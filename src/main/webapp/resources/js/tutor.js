$("#showCategoryBar").on("click", function(){
    if ($(".categoryBar").css("display") == "none"){
        $(".categoryBar").slideDown(200);
    } else {
        $(".categoryBar").slideUp(200);
    }
})
      

const sideCategory = document.querySelectorAll('.activeP'); /* 사이드 카테고리 영역 모음 */
const mainSection = document.querySelectorAll('.mainsectionsP'); /* 사이드 카테고리 영역 모음 */
/* ---------------------------------------------------------------------------------- */
const firstCategory = sideCategory[0]; /* 카테고리 영역 첫 번째 */
const secondCategory = sideCategory[1];
const thirdCategory = sideCategory[2];
const fourthCategory = sideCategory[3];
const fifthCategory = sideCategory[4];
const sixthCategory = sideCategory[5];
const seventhCategory = sideCategory[6];
/*------------------------------------------------------------------------------------*/
const dashboard = mainSection[0]; /* 각 메인 영역들 */
const profileP = mainSection[1];
const classesP = mainSection[2];
const classsellP = mainSection[3];
const reviewP = mainSection[4];
const calculateP = mainSection[5];
const messageP = mainSection[6];

/*------------------------------------------------------------------------------------*/ 
function restyle(){
    for(let i =0; i<sideCategory.length; i++){
        sideCategory[i].classList.remove('a-style');
    }
    for(let i =0; i<mainSection.length; i++){
        mainSection[i].style.display='none';
    }
}

/* 사이드 카테고리 선택 JS */

firstCategory.addEventListener('click', function() {
    restyle()
    dashboard.style.display='block';
    this.classList.add('a-style');
});

secondCategory.addEventListener('click', function() {
    restyle()
    profileP.style.display='block';
    this.classList.add('a-style');
});

thirdCategory.addEventListener('click', function() {
    restyle()
    classesP.style.display='block';
    this.classList.add('a-style');
});

fourthCategory.addEventListener('click', function() {
    restyle()
    classsellP.style.display='block';
    this.classList.add('a-style');
});

fifthCategory.addEventListener('click', function() {
    restyle()
    reviewP.style.display='block';
    this.classList.add('a-style');
});

sixthCategory.addEventListener('click', function() {
    restyle()
    calculateP.style.display='block';
    this.classList.add('a-style');
});

seventhCategory.addEventListener('click', function() {
    restyle()
    messageP.style.display='block';
    this.classList.add('a-style');
});

/* 공통 끝 */
/* --------------------------------------------------------------------------------------------------- */
/* --------------------------------------------------------------------------------------------------- */
/* --------------------------------------------------------------------------------------------------- */
/* 대시보드 시작*/

// 캔버스 요소를 선택합니다.
var ctx = document.getElementById('myLineChart').getContext('2d');
    
// 데이터 및 옵션을 정의합니다.
var myLineChart = new Chart(ctx, {
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




/* 대시보드 끝 */

/*------------------------------------------------------------------------------------------------ */
/*------------------------------------------------------------------------------------------------ */
/*------------------------------------------------------------------------------------------------ */
/* 프로필 시작 */
/* 닉네임 시작 */
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

Nchangeinput.addEventListener("keyup",function(){
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
/* -----------------------------------------------------------------------------------------------*/
/* -----------------------------------------------------------------------------------------------*/





/* -----------------------------------------------------------------------------------------------*/
/* -----------------------------------------------------------------------------------------------*/
/* -----------------------------------------------------------------------------------------------*/
/* 리뷰 시작 */
/*------------------------------------------------------------------------------------------------ */

/* 리뷰 QnA 시작*/
/* 리뷰 QnA 공통 시작*/

const qnacontainer = document.getElementById("qna-containerP");
const reviewcontainer = document.getElementById("review-containerP");
const reviewbtn = document.getElementById("review-btnP");
const qnabtn = document.getElementById("qna-btnP");

reviewbtn.addEventListener("click",function(){
    reviewcontainer.style.display = 'block';
    reviewbtn.style.color = 'rgb(255, 16, 88)';
    reviewbtn.style.borderBottom = '2px solid rgb(255, 16, 88)';
    qnacontainer.style.display = 'none';
    qnabtn.style.color = 'rgb(153, 153, 153)';
    qnabtn.style.borderBottom = 'none';
    
})

qnabtn.addEventListener("click",function(){
    reviewcontainer.style.display = 'none';
    reviewbtn.style.color = 'rgb(153, 153, 153)';
    reviewbtn.style.borderBottom = 'none';
    qnacontainer.style.display = 'block';
    qnabtn.style.color = 'rgb(255, 16, 88)';
    qnabtn.style.borderBottom = '2px solid rgb(255, 16, 88)';
})


/* 리뷰 QnA 공통  끝*/
/* --------------------------------------------------   */
/* 리뷰 시작*/

const selectedreview = document.getElementById("selected-reviewP");
const returnbtn = document.getElementById("return-review-btnP");
const choicereview = document.getElementById("choice-review-areaP");
const Nreviewarea = document.getElementById("review-areaP");

document.getElementById("select-review-btnP").addEventListener("click",function(){
    choicereview.style.display = 'block';
    returnbtn.style.display = 'block';
})

returnbtn.addEventListener("click",function(){
    if (choicereview.style.display = 'block' ){
        choicereview.style.display = 'none'
        returnbtn.style.display = 'none';
    }
})

document.getElementById("NreviewP").addEventListener("click",function(){
    selectedreview.innerText = "내가 응답하지 않은 리뷰"
    choicereview.style.display = 'none'
    returnbtn.style.display = 'none';
})

document.getElementById("AreviewP").addEventListener("click",function(){
    selectedreview.innerText = "전체 리뷰"
    choicereview.style.display = 'none'
    returnbtn.style.display = 'none';
})

document.getElementById("review-page-left-btnP").addEventListener("click",function(){
})
document.getElementById("review-page-right-btnP").addEventListener("click",function(){
})

/* ------------------------------------------------------------------------ */
/* 답글 작성 */

const hiddenqnaarea = document.getElementById("hidden-qna-areaP")
const qnaanswertextarea = document.getElementById("qna-answer-textareaP")
const qnaanswercount = document.getElementById("qna-answer-countP")
const qnaanswercancel = document.getElementById("qna-answer-cancel-btnP")
const qnaanswercheck = document.getElementById("qna-answer-check-btnP")

document.getElementById("qna-contentP").addEventListener("click",function(){
    hiddenqnaarea.style.display="block"
})

qnaanswercheck.addEventListener("click",function(){
    hiddenqnaarea.style.display="none"
})

qnaanswercancel.addEventListener("click",function(){
    hiddenqnaarea.style.display="none"
})

qnaanswertextarea.addEventListener("keyup",function(){
    qnaanswercount.innerText = this.value.length
})



/* 리뷰 끝 */
/* -------------------------------------------------------------------------------------------- */
/* qna 시작 */
/* 선택 영역 추가 / 삭제 이벤트 시작 */
const selectclassbtn = document.getElementById("select-class-btnP")
const selectchapterbtn = document.getElementById("select-chapter-btnP")
const selectqnabtn = document.getElementById("select-qna-btnP")

const choclassarea = document.getElementById("choice-class-areaP")
const chochapterarea = document.getElementById("choice-chapter-areaP")
const choqnaarea = document.getElementById("choice-qna-areaP")

const returnclassbtn = document.getElementById("return-class-btnP")
const returnchapterbtn = document.getElementById("return-chapter-btnP")
const returnqnabtn = document.getElementById("return-qna-btnP")

const selectedclass = document.getElementById("selected-classP")
const selectedchapter = document.getElementById("selected-chapterP")
const selectedcqna = document.getElementById("selected-qnaP")


function removeclass(){
    choclassarea.style.display ='none';
    returnclassbtn.style.display ='none';
}

function removechapter(){
    chochapterarea.style.display ='none';
    returnchapterbtn.style.display ='none';
}

function removeqna(){
    choqnaarea.style.display ='none';
    returnqnabtn.style.display ='none';
}

selectclassbtn.addEventListener("click",function(){
    choclassarea.style.display ='block';
    returnclassbtn.style.display ='block';
    removechapter()
    removeqna()
})

selectchapterbtn.addEventListener("click",function(){
    if(selectedclass.innerText == "전체 클래스"){

    } else{
        removeclass()
        returnchapterbtn.style.display ='block';
        chochapterarea.style.display ='block';
        removeqna()
    }
    
})

selectqnabtn.addEventListener("click",function(){
    removeclass()
    removechapter()
    choqnaarea.style.display ='block';
    returnqnabtn.style.display ='block';
})

returnclassbtn.addEventListener("click",function(){
    removeclass()
})

returnchapterbtn.addEventListener("click",function(){
    removechapter()

})

returnqnabtn.addEventListener("click",function(){
    removeqna()
})

/* 선택 영역 추가 / 삭제 이벤트 끝 */
/*-------------------------------------------------------------------------------- */
/* 클래스 / 챕터 / qna 타입 변경 시작 */



document.getElementById("class0P").addEventListener("click",function(){
    selectedclass.innerText = "전체 클래스"
    removeclass()
})

document.getElementById("class1P").addEventListener("click",function(){
    selectedclass.innerText = "JAVA는 어려워"
    removeclass()
})

document.getElementById("class2P").addEventListener("click",function(){
    selectedclass.innerText = "CSS는 해석하기가 너무 힘들어"
    removeclass()
})

document.getElementById("chapter0P").addEventListener("click",function(){
    selectedchapter.innerText = "전체 챕터"
    removechapter()
})

document.getElementById("chapter1P").addEventListener("click",function(){
    selectedchapter.innerText = "1. JVAV란?"
    removechapter()
})

document.getElementById("chapter2P").addEventListener("click",function(){
    selectedchapter.innerText = "2. JVAV 환경 구축"
    removechapter()
})

document.getElementById("NqnaP").addEventListener("click",function(){
    selectedcqna.innerText = "내가 응답하지 않은 Q&A"
    removeqna()
})

document.getElementById("AqnaP").addEventListener("click",function(){
    selectedcqna.innerText = "전체 Q&A"
    removeqna()
})

/* 리뷰 끝 */
/*-******************************************************************************/ 
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


/* 정산하기 끝 */
/*-******************************************************************************/ 
/*-******************************************************************************/ 
/*-******************************************************************************/ 
