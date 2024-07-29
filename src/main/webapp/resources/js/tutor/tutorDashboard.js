const sideCategory = document.querySelectorAll('.activeP'); /* 사이드 카테고리 영역 모음 */
/* ---------------------------------------------------------------------------------- */
const firstCategory = sideCategory[0]; /* 카테고리 영역 첫 번째 */
const secondCategory = sideCategory[1];
const thirdCategory = sideCategory[2];
const fourthCategory = sideCategory[3];
const fifthCategory = sideCategory[4];

firstCategory.classList.add('a-style');

/* --------------------------------------------------------------------------------------------------- */
/* 대시보드 시작*/

const graph = document.getElementById("graphP")
const totalContent = document.getElementById("total-content")
const ctx = document.getElementById('viewsChart').getContext('2d');
let currentChart = null;

function initializeScatterChart() {
    const ctx = document.getElementById('viewsChart').getContext('2d');
    new Chart(ctx, {
        type: 'scatter',
        data: {
            datasets: [{
                label: '리뷰수 vs 결제수',
                data: scatterData,
                backgroundColor: '#219ebc',
                borderColor: '#219ebc',
                borderWidth: 1,
                pointRadius: 5
            }]
        },
        options: {
            scales: {
                x: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: '리뷰수'
                    }
                },
                y: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: '결제수'
                    }
                }
            },
            plugins: {
                tooltip: {
                    callbacks: {
                        title: function(tooltipItems) {
                            const item = scatterData[tooltipItems[0].dataIndex];
                            return '클래스: ' + item.className;
                        },
                        label: function(tooltipItem) {
                            return '리뷰수: ' + tooltipItem.raw.x + ', 결제수: ' + tooltipItem.raw.y;
                        }
                    }
                }
            }
        }
    });
}

function initializeBarChart() {
    const ctx = document.getElementById('viewsChart').getContext('2d');
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: barLabels, // 클래스 번호 또는 이름
            datasets: [{
                label: '클래스별 데이터',
                data: barData, // 데이터 값 (리뷰수 또는 결제수)
                backgroundColor: barColors, // 막대 색상
                borderColor: barColors.map(color => color.replace('0.2', '1')), // 테두리 색상
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                x: {
                    title: {
                        display: true,
                        text: '클래스 번호'
                    }
                },
                y: {
                    title: {
                        display: true,
                        text: '값'
                    }
                }
            },
            plugins: {
                tooltip: {
                    callbacks: {
                        title: function(tooltipItems) {
                            // 여기에 적절한 타이틀을 설정하세요.
                            const index = tooltipItems[0].dataIndex;
                            return `클래스 ${barLabels[index]}`;
                        },
                        label: function(tooltipItem) {
                            // 막대의 데이터 값을 표시합니다.
                            return `값: ${tooltipItem.raw}`;
                        }
                    }
                }
            }
        }
    });
}

function updateChart(url, label, type) {
    totalContent.style.display = 'none';
    $.ajax({
        url: url, // AJAX 요청을 보낼 URL
        method: 'GET', // 요청 방식 (GET, POST 등)
        success: function(data) {
            const scatterData = data.map(item => ({ x: item.reviewCount, y: item.paidCount, className: item.className }));
            let chartData = {};
            let barLabels = [];
            let barData = [];
            
            if (data.length === 0) {
                console.error('데이터가 없습니다.');
                return;
            }
            
            if (type === 'bar') {
                barLabels = data.map(item => item.classNo); // 클래스 번호를 레이블로 사용
                barData = data.map(item => item.reviewCount || item.paidCount); // 리뷰수 또는 결제수
                
                chartData = {
                    labels: barLabels,
                    datasets: [{
                        label: label,
                        data: barData,
                        backgroundColor: '#219ebc',
                        borderColor: '#219ebc',
                        borderWidth: 1
                    }]
                };
            } else if (type === 'scatter') {
                chartData = {
                    datasets: [{
                        label: '결제율',
                        data: scatterData,
                        backgroundColor: '#219ebc',
                        borderColor: '#219ebc',
                        borderWidth: 1,
                        pointRadius: 5
                    }]
                };
            }

            if (currentChart) {
                currentChart.destroy();
            }

            currentChart = new Chart(ctx, {
                type: type,
                data: chartData,
                options: {
                    scales: {
                        x: {
                            beginAtZero: true,
                            title: {
                                display: type === 'scatter',
                                text: '리뷰수'
                            }
                        },
                        y: {
                            beginAtZero: true,
                            title: {
                                display: type === 'scatter',
                                text: '결제수'
                            }
                        }
                    },
                    plugins: {
                        tooltip: {
                            callbacks: {
                                title: function(tooltipItems) {
                                    if (type === 'scatter') {
                                        const item = scatterData[tooltipItems[0].dataIndex];
                                        return '클래스: ' + item.className;
                                    } else if (type === 'bar') {
                                        const index = tooltipItems[0].dataIndex;
                                        return `클래스 ${barLabels[index]}`;
                                    }
                                },
                                label: function(tooltipItem) {
                                    if (type === 'scatter') {
                                        return '리뷰수: ' + tooltipItem.raw.x + ', 결제수: ' + tooltipItem.raw.y;
                                    } else if (type === 'bar') {
                                        return `값: ${tooltipItem.raw}`;
                                    }
                                }
                            }
                        }
                    }
                }
            });
        },
        error: function(xhr, status, error) {
            console.error('AJAX 요청 실패:', status, error);
        }
    });
}






document.getElementById("reviews").addEventListener("click", function() {
    document.getElementById('title').innerText = "클래스 리뷰수";
    updateChart(contextPath + "/tutor/dashboard/reviews", '리뷰수', 'bar');
});

document.getElementById("paid").addEventListener("click", function() {
    document.getElementById('title').innerText = "클래스 결제수";
    updateChart(contextPath + "/tutor/dashboard/paid", '결제수', 'bar');
});

document.getElementById("scatter").addEventListener("click", function() {
    document.getElementById('title').innerText = "리뷰수 vs 결제수";
    updateChart(contextPath + "/tutor/dashboard/scatter", '리뷰수 vs 결제수', 'scatter');
});

/* 대시보드 끝 */
/* --------------------------------------------------------------------------------------------------- */
/* --------------------------------------------------------------------------------------------------- */
/* --------------------------------------------------------------------------------------------------- */