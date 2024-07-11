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
/*------------------------------------------------------------------------------------*/

secondCategory.classList.add('a-style');

/* 공통 끝 */
/*------------------------------------------------------------------------------------------------ */
/*------------------------------------------------------------------------------------------------ */
/*------------------------------------------------------------------------------------------------ */
/* 낙네임 시작 */ /* 프로필 시작 */
const NchangeBtn = document.getElementById("Nchange-btnP")
const NhideArea = document.getElementById("Nhide-areaP")
const changeArea = document.getElementById("change-areaP")
const Ncheck = document.getElementById("NcheckP")
const Ncancel = document.getElementById("NcancelP")
const NP = document.getElementById("NP")
const Nchangeinput = document.getElementById("Nchange-inputP")
const Nchangecount = document.getElementById("Nchange-countP")

NchangeBtn.addEventListener("click",function(){
    changeArea.style.display ='none'
    NhideArea.style.display ='block'
    Nchangeinput.value = NP.innerText;
})

Ncancel.addEventListener("click",function(){
    changeArea.style.display ='block'
    NhideArea.style.display ='none'
    Nchangeinput.value =""
})

Ncheck.addEventListener("click",function(){
    changeArea.style.display ='block'
    NhideArea.style.display ='none'
    NP.innerText = Nchangeinput.value;
    Nchangeinput.value =""
})

Nchangeinput.addEventListener("input",function(){
    Nchangecount.innerText = Nchangeinput.value.length
    if(Nchangeinput.value.length >= 12){
        Nchangecount.innerText ='12';
        Nchangecount.style.color ='red'
    }
    if(Nchangeinput.value.length == 12){
        Nchangecount.style.color ='red'
    } else{
        Nchangecount.style.color ='black'
    }
})

/* 낙네임 끝 */ 
/* -----------------------------------------------------------------------------------------------*/
/* 튜터 소개 시작 */ 

const Infowrite = document.getElementById("info-write-btnP")
const Infocheck = document.getElementById("info-check-btnP")
const Infocancel = document.getElementById("info-error-btnP")
const Infocount = document.getElementById("input-countP")
const Infocountarea = document.getElementById("info-count-areaP")
const Infotextarea = document.getElementById("info-textareaP")
const Infoinput = document.getElementById("info-inputP")
const Infoinputarea = document.getElementById("info-input-areaP")

function Infoadd(){
    Infocheck.style.display ='block'
    Infocancel.style.display ='block'
    Infotextarea.style.display ='block'
    Infocountarea.style.display ='block'
}

function Inforemove(){
    Infocheck.style.display ='none'
    Infocancel.style.display ='none'
    Infotextarea.style.display ='none'
    Infocountarea.style.display ='none'
}

Infowrite.addEventListener("click",function(){
    Infoadd()
    Infoinputarea.style.height = '220px';
    Infowrite.style.display='none'
    const str = Infoinput.innerText
    Infotextarea.value = str
})

Infocheck.addEventListener("click",function(){
    Inforemove()
    Infoinputarea.style.height = '80px';
    Infowrite.style.display ='block'
    const Info = Infotextarea.value
    Infoinput.innerText = Info
})

Infocancel.addEventListener("click",function(){
    Inforemove()    
    Infoinputarea.style.height = '80px';
    Infowrite.style.display ='block'
    Infotextarea.value =""
})

Infotextarea.addEventListener("keyup",function(){
    const length = Infotextarea.value.length;
    Infocount.innerText = length;

    if(length<250){
        Infocount.style.color = 'black'
    } else if(length<299){
        Infocount.style.color = 'orange'
    } else{
        Infocount.style.color = 'red'
    }

})

/* 튜터 소개 끝 */ 
/* -----------------------------------------------------------------------------------------------*/
