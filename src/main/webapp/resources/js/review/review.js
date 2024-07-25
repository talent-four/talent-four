

document.addEventListener('DOMContentLoaded', () => {
    const buttons = document.querySelectorAll('.radio-button');

    buttons.forEach(button => {
        button.addEventListener('click', () => {
            buttons.forEach(btn => btn.classList.remove('selected'));

            button.classList.add('selected');

            const value = button.getAttribute('data-value');
            const radioButton = document.querySelector(`input[type="radio"][value="${value}"]`);
            radioButton.checked = true;
        });
    });
});

const write = document.querySelector(".btn3");

write.addEventListener("click", ()=>{
    if(memberNickname!=""){
        document.querySelector("#background-modal").hidden= false;
        document.querySelector("#write-modal").hidden= false;
    } else {
        alert("로그인을 하고 리뷰를 작성해주세요.");
    }

});

document.querySelector("#write-btn2").addEventListener("click", ()=>{

    document.querySelector("#background-modal").hidden= true;
    document.querySelector("#write-modal").hidden= true;    

});



document.addEventListener("DOMContentLoaded", ()=>{
    selectReview();
});

function selectReview() {

    $.ajax({

        url: contextPath + "/review/view",
        type: "POST",
        success(res) {

            const result = JSON.parse(res);

            console.log(result);

            result.forEach((review) => {
                let starText = "";
                if(review.profileImage==null){
                    review.profileImage="/resources/img/profile-default.jpg";
                }

                let memberBtn ="";
                if(memberNickname==review.memberNickname){
                    memberBtn="<div class='updateBtn'>수정하기</div><div class='deleteBtn'>삭제하기</div>"
                }

                if(review.reviewStar==1){
                    review.reviewStar="★";
                    starText="1.0";
                } else if(review.reviewStar==2){
                    review.reviewStar="★★";
                    starText="2.0";
                } else if(review.reviewStar==3){
                    review.reviewStar="★★★";
                    starText="3.0";
                } else if(review.reviewStar==4){
                    review.reviewStar="★★★★";
                    starText="4.0";
                } else if(review.reviewStar==5){
                    review.reviewStar="★★★★★";
                    starText="5.0";
                }

                document.querySelector("#main-box").insertAdjacentHTML("afterend" , 
                    `
                        <div id="main-box">
                    <div class="content">
                <div class="titlebox">
                    <span class="title">${review.boardTitle}</span>${memberBtn}
                    <span class="lecturer">강사</span>
                    <span class="name">${review.instructorName}</span>
                    <div class="recommend-btn">추천</div>
                    <div class="declaration-btn">신고</div>
                </div>
                <div class="classimgcontainer">
                    <img src="${contextPath}${review.classURL}" class="classimg">
                </div>
                <div class="reviewcontentbox">
                    <div class="reviewtitle">
                        <img src="${contextPath}${review.profileImage}" class="profileimg">
                        <div class="name1">
                            <div class="reviewer">${review.memberNickname}</div>
                            <div class="reviewScore">
                                <div class="star" style="color:gold">${review.reviewStar}</div>
                                <div class="starnum">(${starText})</div>
                            </div>
                        </div>
                        <div class="title1">
                            <div class="title1-reviewtitle">${review.boardTitle}</div>
                            <div class="title1-reviewsubtitle">
                                <div class="title1-reviewsubtitle-date color626262">작성일 ${review.createdDate}</div>
                                <div class="title1-reviewsubtitle-recommend color595959">추천${review.thumbs}</div>
                                <div class="title1-reviewsubtitle-report color595959">신고${review.report}</div>
                            </div>
                        </div>
                    </div>
                    <div class="contentbox">
                        <div class="reviewcontext">${review.boardContent}
                        </div>
                        <div class="reviewtag">#${review.tag}</div>
                    </div>
                </div>
                </div>
                </div>`

                )


            });

            console.log("성공함");
        },
        error() {
            console.log("에러임");
        }

    });
}
