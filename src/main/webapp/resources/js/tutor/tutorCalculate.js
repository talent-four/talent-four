// 카테고리 바
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
const seventhCategory = sideCategory[6];
/*------------------------------------------------------------------------------------*/
sixthCategory.classList.add('a-style');

/*-******************************************************************************/ 
/*-******************************************************************************/ 
/* 정산하기 시작 */

const calbtn = document.getElementById("calculate-btnP")
const inputinfo = document.getElementById("input-infoP")
const beforeinput = document.getElementById("before-input-infoP")
const accountinputarea = document.getElementById("account-input-areaP")
const backgrounddiv = document.getElementById("background-div")
const savebtn = document.getElementById("save-btnP")
const cancelbtn = document.getElementById("cancel-btnP")
const changebtn = document.getElementById("change-account-btnP")

const accountinfoarea = document.getElementById("account-info-areaP")
const accountinfo = document.getElementById("account-infoP")
const bankname = document.getElementById("banknameP")
const account = document.getElementById("accountP")
const username = document.getElementById("usernameP")
const usernumber = document.getElementById("usernumber1P")


function addaccount(){
    backgrounddiv.style.display = 'block';
    accountinputarea.style.display ='block';
}

function removeaccount(){
    backgrounddiv.style.display = 'none';
    accountinputarea.style.display ='none';
}

inputinfo.addEventListener("click",function(){
    addaccount()
})

cancelbtn.addEventListener("click",function(){
    removeaccount()
})

savebtn.addEventListener("click",function(){
    removeaccount()
    inputinfo.style.display = 'none';
    beforeinput.style.display = 'none';
    changebtn.style.display = 'block';
    accountinfoarea.style.display = 'block';
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