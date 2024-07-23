// 소개 글자수 세기
const inputIntroduce = document.getElementById("inputIntroduce")
const inputIntroduceCount = document.getElementById("inputIntroduceCount")

inputIntroduce.addEventListener("input",function(){
    inputIntroduceCount.innerText = inputIntroduce.value.length
    if(inputIntroduce.value.length >= 300){
        inputIntroduceCount.innerText ='300';
        inputIntroduceCount.style.color ='red'
    }
    if(inputIntroduce.value.length == 300){
        inputIntroduceCount.style.color ='red'
    } else{
        inputIntroduceCount.style.color ='black'
    }
})