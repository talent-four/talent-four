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
const ctx = document.getElementById('viewsChart').getContext('2d');

$(document).ready(function() {
    $('#a').click(function(event) {
        // 클릭 이벤트의 기본 동작을 막습니다 (페이지 이동을 막음)
        event.preventDefault();

        // AJAX 요청을 보냅니다
        $.ajax({
            url: contextPath + "/tutor/dashboard/views", // AJAX 요청을 보낼 URL
            method: 'GET', // 요청 방식 (GET, POST 등)
            success: function(response) {
                // AJAX 요청이 성공적으로 완료된 후 페이지를 이동합니다
                console.log("aaaaaaasdbkhjfas")
                window.location.href = $('#a').attr('href');
            },
            error: function(xhr, status, error) {
                // 오류 처리
                console.error('AJAX 요청 실패:', status, error);
            }
        });
    });
});

// function selectPaidCount(){
    
//     $.ajax({
//         url : contextPath + "/tutor/dashboard/views",
//         type : "GET",
//         dataType : "JSON", // JSON 형태의 문자열 응답 데이터를 JS 객체로 자동 변환
//         success : function(paidgraph){
//             console.log(paidgraph);
//         },
//         error : function(req, status, error){
//             console.log("에러 발생");
//             console.log(req.responseText);
//         }
//     })
// }

// let result = JSON.parse(paidgraph);

// console.log(result;)



document.getElementById("views").addEventListener("click",function(){
    title.innerText ="클래스 조회수"
})

document.getElementById("calculate").addEventListener("click",function(){
    title.innerText ="클래스 결제수"
})

document.getElementById("persent").addEventListener("click",function(){
    title.innerText ="클래스 결제율"
})

/* 대시보드 끝 */
/* --------------------------------------------------------------------------------------------------- */
/* --------------------------------------------------------------------------------------------------- */
/* --------------------------------------------------------------------------------------------------- */