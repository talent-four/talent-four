$("#showCategoryBar").on("click", function(){
    if ($(".categoryBar").css("display") == "none"){
        $(".categoryBar").slideDown(200);
    } else {
        $(".categoryBar").slideUp(200);
    }
})

const sideCategory = document.querySelectorAll('.activeP'); /* 사이드 카테고리 영역 모음 */
/* ---------------------------------------------------------------------------------- */
const firstCategory = sideCategory[0]; /* 카테고리 영역 첫 번째 */
const secondCategory = sideCategory[1];
const thirdCategory = sideCategory[2];
const fourthCategory = sideCategory[3];
const fifthCategory = sideCategory[4];
const sixthCategory = sideCategory[5];
/*------------------------------------------------------------------------------------*/

firstCategory.classList.add('a-style');


/* 공통 끝 */
/* --------------------------------------------------------------------------------------------------- */
/* --------------------------------------------------------------------------------------------------- */
/* --------------------------------------------------------------------------------------------------- */
/* 대시보드 시작*/

// 캔버스 요소를 선택합니다.
var ctx = document.getElementById('viewsChart').getContext('2d');
// var ctx1 = document.getElementById('calcualteChart').getContext('2d');
// var ctx2 = document.getElementById('persentChart').getContext('2d');
    
// 데이터 및 옵션을 정의합니다.
var viewsChart = new Chart(ctx, {
    type: 'line', // 그래프의 유형: 'line'
    data: {
        labels: ['24-06-24', '24-06-25', '24-06-26', '24-06-27', '24-06-28', '24-06-29', '24-06-30'], // x축 레이블
        datasets: [
            {
                label: '클래스 a',
                borderColor: 'rgba(75, 192, 192, 1)',
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                data: [102, 132, 105, 111, 95, 114, 100], // 첫 번째 라인 데이터 값
                fill: false,
            },
            {
                label: '클래스 b',
                borderColor: 'rgba(153, 102, 255, 1)',
                backgroundColor: 'rgba(153, 102, 255, 0.2)',
                data: [218, 208, 195, 198, 208, 202, 230], // 두 번째 라인 데이터 값
                fill: false,
            },
            {
                label: '클래스 c',
                borderColor: 'rgba(255, 99, 132, 1)',
                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                data: [150, 111, 175, 204, 212, 222, 231], // 세 번째 라인 데이터 값
                fill: false,
            }
        ]
    },
    options: {
        responsive: false,
        plugins: {
            legend: {
                display: true, 
                position: 'top',
                labels: {
                }
            },
        },
        scales: {
            x: {
                title: {
                    display: true,
                    text: '날자'
                }
            },
            y: {
                title: {
                    display: true,
                    text: '조회수'
                },
                beginAtZero: false
            }
        }
    }
});

// -------------------------------------------------------------------------------------------------------------------
// 결제수 그래프
// var calcualteChart = new Chart(ctx1, {
//     type: 'line', // 그래프의 유형: 'line'
//     data: {
//         labels: ['24-06-24', '24-06-25', '24-06-26', '24-06-27', '24-06-28', '24-06-29', '24-06-30'], // x축 레이블
//         datasets: [
//             {
//                 label: '클래스 a',
//                 borderColor: 'rgba(75, 192, 192, 1)',
//                 backgroundColor: 'rgba(75, 192, 192, 0.2)',
//                 data: [55, 54, 53, 52, 51, 50, 51], // 첫 번째 라인 데이터 값
//                 fill: false,
//             },
//             {
//                 label: '클래스 b',
//                 borderColor: 'rgba(153, 102, 255, 1)',
//                 backgroundColor: 'rgba(153, 102, 255, 0.2)',
//                 data: [218, 208, 195, 198, 208, 202, 230], // 두 번째 라인 데이터 값
//                 fill: false,
//             },
//             {
//                 label: '클래스 c',
//                 borderColor: 'rgba(255, 99, 132, 1)',
//                 backgroundColor: 'rgba(255, 99, 132, 0.2)',
//                 data: [150, 111, 175, 204, 212, 222, 231], // 세 번째 라인 데이터 값
//                 fill: false,
//             }
//         ]
//     },
//     options: {
//         responsive: false,
//         plugins: {
//             legend: {
//                 display: true, 
//                 position: 'top',
//                 labels: {
//                 }
//             },
//         },
//         scales: {
//             x: {
//                 title: {
//                     display: true,
//                     text: '날자'
//                 }
//             },
//             y: {
//                 title: {
//                     display: true,
//                     text: '결제수'
//                 },
//                 beginAtZero: false
//             }
//         }
//     }
// });

// // -------------------------------------------------------------------------------------------------------------------
// // 결제율 그래프

// var persentChart = new Chart(ctx2, {
//     type: 'line', // 그래프의 유형: 'line'
//     data: {
//         labels: ['24-06-24', '24-06-25', '24-06-26', '24-06-27', '24-06-28', '24-06-29', '24-06-30'], // x축 레이블
//         datasets: [
//             {
//                 label: '클래스 a',
//                 borderColor: 'rgba(75, 192, 192, 1)',
//                 backgroundColor: 'rgba(75, 192, 192, 0.2)',
//                 data: [102, 132, 105, 111, 95, 114, 100], // 첫 번째 라인 데이터 값
//                 fill: false,
//             },
//             {
//                 label: '클래스 b',
//                 borderColor: 'rgba(153, 102, 255, 1)',
//                 backgroundColor: 'rgba(153, 102, 255, 0.2)',
//                 data: [222, 245, 241, 243, 238, 222, 214], // 두 번째 라인 데이터 값
//                 fill: false,
//             },
//             {
//                 label: '클래스 c',
//                 borderColor: 'rgba(255, 99, 132, 1)',
//                 backgroundColor: 'rgba(255, 99, 132, 0.2)',
//                 data: [150, 111, 175, 204, 212, 222, 231], // 세 번째 라인 데이터 값
//                 fill: false,
//             }
//         ]
//     },
//     options: {
//         responsive: false,
//         plugins: {
//             legend: {
//                 display: true, 
//                 position: 'top',
//                 labels: {
//                 }
//             },
//         },
//         scales: {
//             x: {
//                 title: {
//                     display: true,
//                     text: '날자'
//                 }
//             },
//             y: {
//                 title: {
//                     display: true,
//                     text: '결제율'
//                 },
//                 beginAtZero: false
//             }
//         }
//     }
// });

const title = document.getElementById("title")

document.getElementById("views").addEventListener("click",function(){
    document.getElementById('viewsChart').style.display = 'block';
    // document.getElementById('calcualteChart').style.display = 'none';
    // document.getElementById('persentChart').style.display = 'none';
    title.innerText ="클래스 조회수"
})

document.getElementById("calculate").addEventListener("click",function(){
    document.getElementById('viewsChart').style.display = 'none';
    // document.getElementById('calcualteChart').style.display = 'block';
    // document.getElementById('persentChart').style.display = 'none';
    title.innerText ="클래스 결제수"
})

document.getElementById("persent").addEventListener("click",function(){
    document.getElementById('viewsChart').style.display = 'none';
    // document.getElementById('calcualteChart').style.display = 'none';
    // document.getElementById('persentChart').style.display = 'block';
    title.innerText ="클래스 결제율"
})



document.getElementById('viewsChart').style.display = 'block';
// document.getElementById('calcualteChart').style.display = 'none';
// document.getElementById('persentChart').style.display = 'none';



/* 대시보드 끝 */
/* --------------------------------------------------------------------------------------------------- */
/* --------------------------------------------------------------------------------------------------- */
/* --------------------------------------------------------------------------------------------------- */