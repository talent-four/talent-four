// 클래스 소개 더보기 버튼
if (document.getElementById("d-classInfoBtn") != null) {
    document.getElementById("d-classInfoBtn").addEventListener("click", function () {
        const classIntro = document.querySelector(".classDetail");
        classIntro.classList.toggle("classDetailShow");

        // 버튼 텍스트 변경
        if (classIntro.classList.contains("classDetailShow")) {
            this.textContent = "클래스 소개 접기";
        } else {
            this.textContent = "클래스 소개 더보기";
        }
    })
}


window.onload = function () {
    var input1 = document.getElementById('inputTtile1');
    var input2 = document.getElementById('inputTtile2');

    if (input1 && input2) {
        input1.addEventListener('input', function () {
            input2.value = input1.value;
        });

        input2.addEventListener('input', function () {
            input1.value = input2.value;
        });
    };

    const preview = document.getElementsByClassName("preview")[0];
    const inputImage = document.getElementsByClassName("inputImage")[0];
    const deleteImage = document.getElementsByClassName("delete-image")[0];

    inputImage.addEventListener("change", function() {

        if (this.files[0] != undefined) {

            const reader = new FileReader();
            // 선택된 파일을 읽을 객체 생성

            reader.readAsDataURL(this.files[0]);
            // 지정된 파일을 읽음 -> result에 저장(URL 포함)
            // -> URL을 이용해서 이미지 볼 수 있음

            reader.onload = function (e) { // reader가 파일을 다 읽어온 경우
                // e.target == reader
                // e.target.result == 읽어들인 이미지의 URL
                // preview[i] == 파일이 선택된 input태그와 인접한 preview 이미지 태그
                preview.setAttribute("src", e.target.result);
            }

        } else { // 파일 선택이 되지 않았을 때(취소)
            preview.removeAttribute("src");
        }
    })

    deleteImage.addEventListener("click", function(){
        
        // 미리보기가 존재하는 경우에만 X 버튼 동작
        if(preview.getAttribute("src") != ""){

            // 미리보기 삭제
            preview.removeAttribute("src");
        
            // input의 값 "" 만들기
            inputImage.value = "";
        }
    })

    $('#mainCategory').change(function() {
        var mainCategoryCode = $(this).val();
        
        if (mainCategoryCode) {
            $.ajax({
                url: 'getSubCategory',
                type: 'GET',
                data: { "mainCategoryCode": mainCategoryCode },
                dataType: 'JSON',
                success: function(data) {
                    console.log(data);
                    var $subCategorySelect = $('#subCategory');
                    $subCategorySelect.empty();
                    $subCategorySelect.append('<option value="" disabled selected>소분류</option>');

                    for(let sub of data){
                        $subCategorySelect.append('<option value="' + sub.categoryName + '">' + sub.categoryName + '</option>');
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching subcategories:', error);
                }
            });
        } else {
            $('#subCategory').empty().append('<option value="" disabled selected>소분류</option>');
        }
    });

};

// 클래스 작성 유효성 검사
// function writeValidate() {
//     const thumbnail = document.getElementsByName("thumbnail")[0];
//     const boardTitle = document.getElementsByName("boardTitle")[0];
//     const classPrice = document.getElementsByName("classPrice")[0];
//     const boardContent = document.querySelector("[name='boardContent']");
//     const mainCategory = document.getElementById("mainCategory");
//     const subCategory = document.getElementById("subCategory");


//     if(boardTitle.value.trim().length == 0){
//         boardTitle.focus();
//         boardTitle.value = "";
//         alert("제목을 입력해주세요.");

//         return false;
//     }

//     if(boardContent.value.trim().length == 0){
//         boardContent.focus();
//         boardContent.value = "";
//         alert("내용을 입력해주세요.");

//         return false;
//     }

//     if (thumbnail.files.length === 0) {
//         alert("썸네일을 등록해주세요.");
//         thumbnail.focus();
//         return false;
//     }

//     if (mainCategory.value === "") {
//         alert("대분류를 선택해주세요.");
//         mainCategory.focus();
//         return false;
//     }

//     if (subCategory.value === "") {
//         alert("소분류를 선택해주세요.");
//         subCategory.focus();
//         return false;
//     }
    
//     const pricePattern = /^[1-9][0-9]{2,4}[0]{2}$/; // 정규식: 숫자만 허용
//     if (classPrice.value.trim().length === 0) {
//         alert("금액을 입력해주세요.");
//         classPrice.focus();
//         return false;

//     } else if (!pricePattern.test(classPrice.value)) {
//         alert("금액은 만원 이상, 100 단위 숫자만 입력 가능합니다.");
//         classPrice.focus();
//         return false;
//     }

//     return true;
// }