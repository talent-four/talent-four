(function () {
  // blur 생성/삭제 메소드
  const blur = document.getElementById("blur");
  const dclassInfoBtn = document.getElementById("d-classInfoBtn");
  if (blur && dclassInfoBtn) {
    if (dclassInfoBtn.clientHeight >= 500) {
      blur.style.display = "block";
      dclassInfoBtn.style.display = "block";
    } else {
      blur.style.display = "none";
      dclassInfoBtn.style.display = "none";
    }
  }
})();

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
  });
}

// 클래스 상세 페이지 a태그 이동 시, sticky로 인해 위치 조절
const header = document.getElementsByTagName("header")[0];
const pageMove = document.getElementsByClassName("pageMove");

for (let pm of pageMove) {
  pm.addEventListener("click", function (e) {
    e.preventDefault(); // 기본 링크 동작 방지
    const targetId = pm.getAttribute("href").substring(1); // 링크의 href 속성에서 #을 제거한 id 추출
    const targetElement = document.getElementById(targetId);

    if (targetElement) {
      window.scrollTo({
        top: targetElement.offsetTop - header.offsetHeight,
        behavior: "smooth",
      });
    }
  });
}

// 클래스 작성 시, 함수
window.onload = function () {
  var input1 = document.getElementById("inputTtile1");
  var input2 = document.getElementById("inputTtile2");

  if (input1 && input2) {
    input1.addEventListener("input", function () {
      input2.value = input1.value;
    });

    input2.addEventListener("input", function () {
      input1.value = input2.value;
    });
  }

  const preview = document.getElementsByClassName("preview")[0];
  const inputImage = document.getElementsByClassName("inputImage")[0];
  const deleteImage = document.getElementsByClassName("delete-image")[0];

  if (inputImage != null) {
    inputImage.addEventListener("change", function () {
      if (this.files[0] != undefined) {
        const reader = new FileReader();
        // 선택된 파일을 읽을 객체 생성

        reader.readAsDataURL(this.files[0]);
        // 지정된 파일을 읽음 -> result에 저장(URL 포함)
        // -> URL을 이용해서 이미지 볼 수 있음

        reader.onload = function (e) {
          // reader가 파일을 다 읽어온 경우
          // e.target == reader
          // e.target.result == 읽어들인 이미지의 URL
          // preview[i] == 파일이 선택된 input태그와 인접한 preview 이미지 태그
          preview.setAttribute("src", e.target.result);
        };
      } else {
        // 파일 선택이 되지 않았을 때(취소)
        preview.removeAttribute("src");
      }
    });
  }

  if (deleteImage != null) {
    deleteImage.addEventListener("click", function () {
      // 미리보기가 존재하는 경우에만 X 버튼 동작
      if (preview.getAttribute("src") != "") {
        // 미리보기 삭제
        preview.removeAttribute("src");

        // input의 값 "" 만들기
        inputImage.value = "";
      }
    });
  }

  $("#mainCategory").change(function () {
    var mainCategoryCode = $(this).val();

    if (mainCategoryCode) {
      $.ajax({
        url: "getSubCategory",
        type: "GET",
        data: { mainCategoryCode: mainCategoryCode },
        dataType: "JSON",
        success: function (data) {
          console.log(data);
          var $subCategorySelect = $("#subCategory");
          $subCategorySelect.empty();
          $subCategorySelect.append('<option value="" disabled selected>소분류</option>');

          for (let sub of data) {
            $subCategorySelect.append('<option value="' + sub.categoryCode + '">' + sub.categoryName + "</option>");
          }
        },
        error: function (xhr, status, error) {
          console.error("Error fetching subcategories:", error);
        },
      });
    } else {
      $("#subCategory").empty().append('<option value="" disabled selected>소분류</option>');
    }
  });
};

// 클래스 작성 유효성 검사
function writeValidate() {
  const thumbnail = document.getElementsByName("thumbnail")[0];
  const boardTitle = document.getElementsByName("boardTitle")[0];
  const classPrice = document.getElementsByName("classPrice")[0];
  const boardContent = document.querySelector("[name='boardContent']");
  const mainCategory = document.getElementById("mainCategory");
  const subCategory = document.getElementById("subCategory");

  if (boardTitle.value.trim().length == 0) {
    boardTitle.focus();
    boardTitle.value = "";
    alert("제목을 입력해주세요.");

    return false;
  }

  if (boardContent.value.trim().length == 0) {
    boardContent.focus();
    boardContent.value = "";
    alert("내용을 입력해주세요.");

    return false;
  }

  if (thumbnail.files.length === 0) {
    alert("썸네일을 등록해주세요.");
    thumbnail.focus();
    return false;
  }

  if (mainCategory.value === "") {
    alert("대분류를 선택해주세요.");
    mainCategory.focus();
    return false;
  }

  if (subCategory.value === "") {
    alert("소분류를 선택해주세요.");
    subCategory.focus();
    return false;
  }

  const pricePattern = /^[1-9][0-9]{2,4}[0]{2}$/; // 정규식: 숫자만 허용
  if (classPrice.value.trim().length === 0) {
    alert("금액을 입력해주세요.");
    classPrice.focus();
    return false;
  } else if (!pricePattern.test(classPrice.value)) {
    alert("금액은 만원 이상, 100 단위 숫자만 입력 가능합니다.");
    classPrice.focus();
    return false;
  }

  return false;
}

// html 텍스트 전환하기
const textarea = document.getElementById("textarea");
const output = document.getElementById("output");
const button = document.getElementById("toggleButton");
let showingHTML = false;

if(button != null){
	button.addEventListener("click", () => {
  if (showingHTML) {
    output.style.display = "none";
    textarea.style.display = "block";
    button.textContent = "HTML 미리보기";
    button.style.border = "1px solid black";
  } else {
    // 개행 문자(\n)를 <br> 태그로 변환
    const escapedText = textarea.value;
    //   .replace(/&/g, "&amp;")
    //   .replace(/</g, "&lt;")
    //   .replace(/>/g, "&gt;")
    //   .replace(/(\r\n|\n\r|\n|\r)/g, "<br>");
    output.innerHTML = escapedText;
    output.style.display = "block";
    textarea.style.display = "none";
    button.textContent = "글 작성하기";
    button.style.border = "1px solid #ffb703";
  }
  showingHTML = !showingHTML;
});
}



function reviewWrite() {
	createWrite();
};

// 리뷰 화면 만들기
function createWrite() {

    document.querySelector("#dp-review").insertAdjacentHTML("afterbegin",
        `<div id="background-modal"></div>
                    
                    <div id="write-modal">
                        <div class="write-wrapper">
                            <form action="${contextPath}/review/write" method="GET">
                                <div class="write-tag">
                                    <div class="write-tag-question">태그를 선택해 주세요</div>
                                    <div class="write-tag-select">
                                        <div class="radio-button selected" data-value="1">#친절해요</div>
                                        <div class="radio-button" data-value="2">#재밌어요</div>
                                        <div class="radio-button" data-value="3">#시간가는줄 몰라요</div>
                                        <div class="radio-button" data-value="4">#가격대비최고</div>
                                        <div class="radio-button" data-value="5">#강의 맛집</div>
                                        <div class="radio-button" data-value="6">#다음에 또 올께요</div>
                                        <div class="radio-button" data-value="7">#완강했어요</div>
                                        <div class="radio-button" data-value="8">#후회 안해요</div>
                                        <div class="radio-button" data-value="9">#고민은 시간낭비</div>
                                        <input type="radio" name="tag" value="1" id="option1" required checked
                                            hidden>
                                        <input type="radio" name="tag" value="2" id="option2" hidden>
                                        <input type="radio" name="tag" value="3" id="option3" hidden>
                                        <input type="radio" name="tag" value="4" id="option4" hidden>
                                        <input type="radio" name="tag" value="5" id="option5" hidden>
                                        <input type="radio" name="tag" value="6" id="option6" hidden>
                                        <input type="radio" name="tag" value="7" id="option7" hidden>
                                        <input type="radio" name="tag" value="8" id="option8" hidden>
                                        <input type="radio" name="tag" value="9" id="option9" hidden>
                                    </div>
                                </div>
                                <div class="write-content">
                                    <div class="writestarbox">
                                        <div class="starsel">
                                            <input type="radio" name="writeStar" value="5" id="star1" required
                                                hidden><label for="star1">★ </label><input type="radio" name="writeStar"
                                                value="4" id="star2" hidden><label for="star2">★ </label><input
                                                type="radio" name="writeStar" value="3" id="star3" hidden><label
                                                for="star3">★ </label><input type="radio" name="writeStar" value="2"
                                                id="star4" hidden><label for="star4">★ </label><input type="radio"
                                                name="writeStar" value="1" id="star5" hidden><label for="star5">★
                                            </label>
                                            별점을 선택해주세요
                                        </div>
                                        <input type="text" placeholder="제목을 입력해주세요" id="writeTitle" name="writeTitle" maxlength="30">
                                        <textarea name="writetext" cols="60" rows="6" id="writecontext" maxlength="300"
                                            placeholder="내용을 입력해주세요"></textarea>
                                    </div>
                                    <button id="write-btn1" type="submit">글 쓰기</button>
                                    <button id="write-btn2" type="button">취소</button>
                            </form>
                        </div>
                    </div>`
    );
	tagButtonController();
}


function tagButtonController() {
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

    document.querySelector("#write-btn2").addEventListener("click", () => {
        const background = document.querySelector("#background-modal");
        const writemodal = document.querySelector("#write-modal");
        
        if (background) {
            background.remove();
        }
        if (writemodal) {
            writemodal.remove();
        }
    });
}


