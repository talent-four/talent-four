const sideCategory = document.querySelectorAll('.activeP'); /* 사이드 카테고리 영역 모음 */
/* ---------------------------------------------------------------------------------- */
const firstCategory = sideCategory[0]; /* 카테고리 영역 첫 번째 */
const secondCategory = sideCategory[1];
const thirdCategory = sideCategory[2];
const fourthCategory = sideCategory[3];
const fifthCategory = sideCategory[4];
/*------------------------------------------------------------------------------------*/

thirdCategory.classList.add('a-style');

// 클래스 만들기


// 클래스 지우기
const deleteBtns = document.querySelectorAll(".class-rowP>div:nth-child(3)>div");
for(let deleteBtn of deleteBtns){
    deleteBtn.addEventListener("click", function(){
        const parentElement = this.parentNode;
        let classNo = this.parentElement.parentElement.id;

        console.log(classNo);

        // 업데이트 버튼
        let updateBtn = parentElement.querySelector(".update-statusBtn");

        // 운영 종료 버튼
        let deleteBtn = parentElement.querySelector(".delete-statusBtn");

        if (updateBtn && deleteBtn) {
            // 다시 눌리면 삭제
            parentElement.removeChild(updateBtn);
            parentElement.removeChild(deleteBtn);
        } else {


            const div1 = document.createElement("div");
            const span1 = document.createElement("span");

            div1.classList.add("class-statusBtn");
            div1.classList.add("update-statusBtn");
            span1.innerText = "수정";
            div1.append(span1);

            // 스타일 설정
            div1.style.position = "absolute";
            div1.style.top = "50px";
            div1.style.backgroundColor = "#ffb703";
            div1.style.zIndex = "3";
            
            // 부모 요소에 추가
            parentElement.append(div1);

            // 존재하지 않으면 새로 생성
            const div2 = document.createElement("div");
            const span2 = document.createElement("span");

            div2.classList.add("class-statusBtn");
            div2.classList.add("delete-statusBtn");
            span2.innerText = "운영종료";
            div2.append(span2);

            // 스타일 설정
            div2.style.position = "absolute";
            div2.style.top = "76px";
            div2.style.backgroundColor = "#DB4F4D";
            div2.style.zIndex = "3";

            // 부모 요소에 추가
            parentElement.append(div2);

            // 새로 생성된 statusBtn에 이벤트 리스너 추가
            div1.addEventListener("click", function() {
                window.location.href = `${contextPath}/detailedPage/write?mode=update&classNo=${classNo}`;
            });

            div2.addEventListener("click", function() {
                if(confirm("정말 삭제하시겠습니까?")){
                    window.location.href = `${contextPath}/detailedPage/delete?classNo=${classNo}`;
                }
            });
        }
    })

}
