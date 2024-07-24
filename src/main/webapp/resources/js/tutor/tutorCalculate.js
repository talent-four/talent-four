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

const calbtn = document.getElementById("calculate-btnP")
const accountinputarea = document.getElementById("account-input-areaP")
const backgrounddiv = document.getElementById("background-div")
const savebtn = document.getElementById("save-btnP")
const cancelbtn = document.getElementById("cancel-btnP")
const changebtn = document.getElementById("change-account-btnP")

const accountinfo = document.getElementById("account-infoP")
const bankname = document.getElementById("banknameP")
const account = document.getElementById("accountP")
const username = document.getElementById("usernameP")


function addaccount(){
    backgrounddiv.style.display = 'block';
    accountinputarea.style.display ='block';
}

function removeaccount(){
    backgrounddiv.style.display = 'none';
    accountinputarea.style.display ='none';
}

cancelbtn.addEventListener("click",function(){
    removeaccount()
})

savebtn.addEventListener("click",function(){
    removeaccount()
    accountinfo.innerText = bankname.value + " " + account.value + " " + username.value;
})

changebtn.addEventListener("click",function(){
    addaccount()
    bankname.value =""
    account.value =""
    username.value =""
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

