// 모집 상태 정렬
const typeAll = document.getElementById("type-all")
const typeIng = document.getElementById("type-ing")
const typeFinished = document.getElementById("type-finished")

typeAll.addEventListener("click",function(){
    this.classList.add("choiced")
    typeIng.classList.remove("choiced")
    typeFinished.classList.remove("choiced")
})

typeIng.addEventListener("click",function(){
    typeAll.classList.remove("choiced")
    typeFinished.classList.remove("choiced")
    this.classList.add("choiced")
})

typeFinished.addEventListener("click",function(){
    typeAll.classList.remove("choiced")
    typeIng.classList.remove("choiced")
    this.classList.add("choiced")
})


// ----------------------------------------------------------------------------------------------------


// 지역 / 언어 / 모집방법 선택

document.addEventListener('DOMContentLoaded', function() {
    const choiceLocation = document.getElementById('choice-location');
    const choiceStatus = document.getElementById('choice-status');
    const hiddenLocationArea = document.getElementById('hidden-location-area');
    const hiddenTypeArea = document.getElementById('hidden-type-area');

    function hideAllAreas() {
        hiddenLocationArea.style.display = 'none';
        hiddenTypeArea.style.display = 'none';
    }

    choiceLocation.addEventListener('click', function() {
        hideAllAreas();
        hiddenLocationArea.style.display = 'block';
    });


    choiceStatus.addEventListener('click', function() {
        hideAllAreas();
        hiddenTypeArea.style.display = 'block';
    });

    function handleLiClick(event, divs) {
        divs.forEach(div => div.classList.remove('selected'));
        event.currentTarget.classList.add('selected');
    }

    // Add click events to locationDiv items
    document.querySelectorAll('.locationDiv').forEach(div => {
        div.addEventListener('click', function(event) {
            handleLiClick(event, document.querySelectorAll('.locationDiv'));
        });
    });

    // Add click events to typeDiv items
    document.querySelectorAll('.typeDiv').forEach(div => {
        div.addEventListener('click', function(event) {
            handleLiClick(event, document.querySelectorAll('.typeDiv'));
        });
    });
});

// document.addEventListener('DOMContentLoaded', function() {
//     const maxSelections = 7; // 최대 선택 항목 수
//     const stackDivs = document.querySelectorAll('#hidden-stack-area .stuckDiv');

//     stackDivs.forEach(div => {
//         div.addEventListener('click', function() {
//             const selectedDivs = document.querySelectorAll('#hidden-stack-area .stuckDiv.selected');
            
//             if (div.classList.contains('selected')) {
//                 // 선택 해제
//                 div.classList.remove('selected');
//             } else {
//                 // 선택된 항목 수가 최대치를 초과하지 않도록 확인
//                 if (selectedDivs.length < maxSelections) {
//                     div.classList.add('selected');
//                 } else {
//                     alert(`최대 ${maxSelections}개 항목까지 선택할 수 있습니다.`);
//                 }
//             }
//         });
//     });
// });