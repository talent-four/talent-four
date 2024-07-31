const sideCategory = document.querySelectorAll('.activeP'); /* 사이드 카테고리 영역 모음 */
/* ---------------------------------------------------------------------------------- */
const firstCategory = sideCategory[0]; /* 카테고리 영역 첫 번째 */
const secondCategory = sideCategory[1];
const thirdCategory = sideCategory[2];
const fourthCategory = sideCategory[3];
const fifthCategory = sideCategory[4];
/*------------------------------------------------------------------------------------*/
fifthCategory.classList.add('a-style');
/*-******************************************************************************/ 
/*-******************************************************************************/ 
/* 정산하기 시작 */

// function selectcalList(){
//     $.ajax({
//         url : contextPath + "/calculate/calmoney",
//         type : "POST",
//         dataType : "JSON", // JSON 형태의 문자열 응답 데이터를 JS 객체로 자동 변환

//         success : function(tutorcalculateList){

//             const calArea = document.getElementById("cal-all-rows"); // ul 태그
//             calArea.innerHTML="";
//             console("일단됨")




//         },
//         error : function(req, status, error){
//             console.log("에러 발생");
//             console.log(req.responseText);
//         }


//     })
// }

// 즉시 실행 함수

$(document).ready(function() {
    // 페이지 로드 시 '정산중' 상태를 기본으로 설정하고 AJAX 호출
    loadCalculateList(1);
});

$(document).on('click', '.status-link', function(event) {
    event.preventDefault(); // 링크의 기본 동작 방지
    const status = $(this).data('id'); // 클릭된 링크의 데이터-id를 가져옴
    loadCalculateList(status); // 선택된 상태로 AJAX 호출
});


function loadCalculateList(status) {
    $.ajax({
        url: contextPath + "/tutor/calculate/calmoney",
        data: { cp: status }, // 상태를 쿼리 매개변수로 전달
        dataType: "json",
        success: function(tutorcalculateList) {
            const calAllRows = document.getElementById("cal-all-rows");
            calAllRows.innerHTML = "";

            if (!tutorcalculateList || tutorcalculateList.length === 0) {
                calAllRows.innerHTML = "<tr><th colspan='7'><h1>정산 내용이 없습니다.</h1></th></tr>";
                return;
            }

            tutorcalculateList.forEach(calList => {
                // 행 생성
                const calRow = document.createElement("tr");
                calRow.classList.add("cal-each-rows");

                // 체크박스
                const td1 = document.createElement("td");
                td1.classList.add("checkbox");
                const input = document.createElement("input");
                input.type = "checkbox";
                input.name = "money";
                input.value = calList.memberNo + " " + calList.memberNickname;
                td1.appendChild(input);

                // 정산상태
                const td2 = document.createElement("td");
                td2.classList.add("cal-status-area");
                const statusDiv = document.createElement("div");
                statusDiv.classList.add("cal-status");
                if (calList.settleStatus === 1) {
                    statusDiv.classList.add("ing");
                    statusDiv.innerText = '정산미신청';
                } else if (calList.settleStatus === 2) {
                    statusDiv.classList.add("finished");
                    statusDiv.innerText = '정산완료';
                }
                td2.appendChild(statusDiv);

                // 기타 데이터
                const td3 = document.createElement("td");
                td3.classList.add("nicknameArea");
                td3.innerText = calList.memberNickname;

                const td4 = document.createElement("td");
                td4.classList.add("classNameArea");
                td4.innerText = calList.className;

                const td5 = document.createElement("td");
                td5.classList.add("classPriceArea");
                td5.innerText = calList.classPrice;

                const td6 = document.createElement("td");
                td6.classList.add("commissionArea");
                td6.innerText = calList.commission + '%';

                const td7 = document.createElement("td");
                td7.classList.add("settleStatusArea");
                if (calList.settleStatus === 1) {
                    td7.innerText = '-';
                } else if (calList.settleStatus === 2) {
                    td7.innerText = calList.settleDate;
                }

                // 행에 데이터 추가
                calRow.append(td1, td2, td3, td4, td5, td6, td7);
                calAllRows.appendChild(calRow); 
            });
        },
        error: function(xhr, status, error) {
            console.log('AJAX 요청 실패:', status, error);
        }
    });
}




const calbtn = document.getElementById("calculate-btnP")

calbtn.addEventListener("click",function(){
    // selectcalList()
    
})


/* 정산요청 버튼 까지는 끝 */
/*  --------------------------------------------------------------------------------------------- */
/* 정산 리스트 영역 */
const moneyList = document.getElementsByName("money")
const titlecheck = document.getElementById("title-checkP")

titlecheck.addEventListener("click",function(){
    for(let i = 0; i<moneyList.length; i++){
        moneyList[i].checked = titlecheck.checked;
    }
})

this.addEventListener("click",function(e){
    for(let i=0; i<moneyList.length; i++){

        if(moneyList[i] == e.target){ 
            if(titlecheck.checked && !moneyList[i].checked){
                titlecheck.checked = false
            }

            let flag = true; 
            for(let j=0; j<moneyList.length; j++){ 
                if(!moneyList[j].checked){ 
                    flag = false
                }
            }
            if(!titlecheck.checked && flag){
                titlecheck.checked = true;
            }
        }
    }
})

//--------------------------------------------------------------------------------
// 정산 타입 변경 js
document.addEventListener('DOMContentLoaded', function() {
    const links = document.querySelectorAll('.status-link');
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const currentCp = urlParams.get('cp');

    if (currentCp) {
        document.querySelectorAll('.status-link').forEach(link => {
            link.parentElement.classList.remove('choiced');
            if (link.dataset.id === currentCp) {
                link.parentElement.classList.add('choiced');
            }
        });
    }

    links.forEach(link => {
        link.addEventListener('click', function() {
            links.forEach(l => {
                l.parentElement.classList.remove('choiced');
            });
            link.parentElement.classList.add('choiced');
        });
    });
});

