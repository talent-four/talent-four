
const profile = document.querySelector("#category-profile");
const payment = document.querySelector("#category-payment");
const favorites = document.querySelector("#category-favorites");
const review = document.querySelector("#category-review");
const QA = document.querySelector("#category-QA");

const inputId_btn = document.querySelector("#main-2-2");
const id_btn = document.querySelector("#main-2-2-write");
const id_check = document.querySelector("#input-check");
const id_cancle = document.querySelector("#input-cancle");


const changePwbtn = document.querySelector("#main-6-1-btn");


let verifyCode;

const container = document.querySelector(".containerH");

const menu = [];

menu.push(profile);
menu.push(payment);
menu.push(review);
menu.push(QA);

let user = {
    name: '홍길동',
    age: '25',
    email: 'wh8299@gmail.com',
    nickname: '홍길동123',
    tel: '010-1234-1234',
    favorites: [
        '코딩1', '코딩2'
    ],
    review: {
        title: '어려워용',
        description: '진짜 어려움'
    },
    QA: {
        title: '제목이안됨',
        description: '내용이안됨'
    }
};

// if 문으로 0개 일시 출력문구 변경

document.addEventListener('DOMContentLoaded', () => {

    profile.classList.add('selected');

    container.innerHTML = `<div id="main-1">
                <div>내 프로필</div>
            </div>
            <div id="main-2">
                <div id="main-2-1">닉네임(별명)</div>
                <div id="main-2-2"><p>${user.nickname}</p><button id="main-2-2-write" class="fa-regular fa-pen-to-square"></button></div>
                <div id="main-2-3"></div>
            </div>
            <div id="main-3">
                <div id="main-3-1">프로필이미지</div>
                <div id="main-3-2">
                    <img src="/img/profile-default.jpg" id="profile-img">
                    <label for="main-3-2-btn-2">
                        <div id="main-3-2-btn-1" class="fa-solid fa-camera"></div>
                    </label>
                  <input type="file" name="main-3-2-btn-2" id="main-3-2-btn-2"></div>
            </div>
            <div id="main-4">
                <div id="main-4-1">이메일(로그인ID)</div>
                <div id="main-4-2">${user.email}<button id="main-4-2-write">이메일 인증하기</button></div></div>
            </div>
            <div id="main-5">
                <div id="main-5-1">전화번호</div>
                <div id="main-5-2">${user.tel}</div>
            </div>
            <div id="main-6">
                <div id="main-6-1">
                    <button id="main-6-1-btn-1">비밀번호 변경</button>
                    <button id="main-6-1-btn-2">회원 탈퇴</button>
                </div>
            </div>
            <div id="background-modal" hidden></div>
            <div id="changePw-modal" hidden>
                <div id="changePw-modal-container">
                    <form action="">
                        <p>비밀번호 변경</p><br>
                        <span>현재 비밀번호</span><input type="password"><br>
                        <span>새 비밀번호 </span><input type="password"><br>
                        <span>비밀번호 확인 </span><input type="password">
                        <button type="submit" id="modal-btn1">수정</button>
                        <button id="modal-btn2" style="background-color: white; border: 1px solid rgb(33,33,33); color: rgb(33,33,33);">취소</button>
                    </form>
                </div>
            </div>
            <div id="resign-modal" hidden>
                <div id="resign-modal-container">
                    <form action="">
                        <p>회원 탈퇴</p><br>
                        <div id="real">정말 탈퇴하시겠습니까?</div>
                        <span>비밀번호</span><input type="password"><br>
                        <button type="submit" id="modal-btn1">회원 탈퇴</button>
                        <button id="modal-btn2" style="background-color: white; border: 1px solid rgb(33,33,33); color: rgb(33,33,33);">취소</button>
                    </form>
                </div>
            </div>
            `;

});



profile.addEventListener('click', () => {


    menu.forEach((a) => {
        a.classList.remove('selected');
    })

    profile.classList.add('selected');

    container.innerHTML = `<div id="main-1">
                <div>내 프로필</div>
            </div>
            <div id="main-2">
                <div id="main-2-1">닉네임(별명)</div>
                <div id="main-2-2"><p>${user.nickname}</p><button id="main-2-2-write" class="fa-regular fa-pen-to-square"></button></div>
            </div>
            <div id="main-3">
                <div id="main-3-1">프로필이미지</div>
                <div id="main-3-2">
                    <img src="img/profile-default.jpg" id="profile-img">
                    <label for="main-3-2-btn-2">
                        <div id="main-3-2-btn-1" class="fa-solid fa-camera"></div>
                    </label>
                  <input type="file" name="main-3-2-btn-2" id="main-3-2-btn-2"></div>
            </div>
            <div id="main-4">
                <div id="main-4-1">이메일(로그인ID)</div>
                <div id="main-4-2">${user.email}<button id="main-4-2-write">이메일 인증하기</button></div></div>
            </div>
            <div id="main-5">
                <div id="main-5-1">전화번호</div>
                <div id="main-5-2">${user.tel}</div>
            </div>
            <div id="main-6">
                <div id="main-6-1">
                    <button id="main-6-1-btn-1">비밀번호 변경</button>
                    <button id="main-6-1-btn-2">회원 탈퇴</button>
                </div>
            </div>
            <div id="background-modal" hidden></div>
            <div id="changePw-modal" hidden>
                <div id="changePw-modal-container">
                    <form action="">
                        <p>비밀번호 변경</p><br>
                        <span>현재 비밀번호</span><input type="password"><br>
                        <span>새 비밀번호 </span><input type="password"><br>
                        <span>비밀번호 확인 </span><input type="password">
                        <button type="submit" id="modal-btn1">수정</button>
                        <button id="modal-btn2" style="background-color: white; border: 1px solid rgb(33,33,33); color: rgb(33,33,33);">취소</button>
                    </form>
                </div>
            </div>
            <div id="resign-modal" hidden>
                <div id="resign-modal-container">
                    <form action="">
                        <p>회원 탈퇴</p><br>
                        <div id="real">정말 탈퇴하시겠습니까?</div>
                        <span>비밀번호</span><input type="password"><br>
                        <button type="submit" id="modal-btn1">회원 탈퇴</button>
                        <button id="modal-btn2" style="background-color: white; border: 1px solid rgb(33,33,33); color: rgb(33,33,33);">취소</button>
                    </form>
                </div>
            </div>
            `;

});

payment.addEventListener('click', () => {

    menu.forEach((a) => {
        a.classList.remove('selected');
    })

    payment.classList.add('selected');

    container.innerHTML = `<div id="payment-main-1">
                <div>결제 내역</div>
            </div>
            <div id="payment-main-2">
                <div id="payment-main-2-1">결제 클래스 : ${user.favorites.length}개</div>
            </div>
            <div id="payment-main-3">
                <div id="payment-main-3-1-container">
                    <div id="payment-main-3-2-title">
                        <span>썸네일</span>
                        <span>클래스명</span>
                        <span>결제일</span>
                    </div>
                    <div id="payment-main-3-1-box">
                        <img src="/img/class.jpg" class="profile-payment">
                        <span id="payment-title">강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명</span>
                        <span id="payment-date">2024-07-09</span>
                    </div>
                    <div id="payment-main-3-1-box">
                        <img src="/img/class.jpg" class="profile-payment">
                        <span id="payment-title">강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명</span>
                        <span id="payment-date">2024-07-09</span>
                    </div>
                    <div id="payment-main-3-1-box">
                        <img src="/img/class.jpg" class="profile-payment">
                        <span id="payment-title">강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명</span>
                        <span id="payment-date">2024-07-09</span>
                    </div>
                    <div id="payment-main-3-1-box">
                        <img src="/img/class.jpg" class="profile-payment">
                        <span id="payment-title">강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명</span>
                        <span id="payment-date">2024-07-09</span>
                    </div>
                    <div id="payment-main-3-1-box">
                        <img src="/img/class.jpg" class="profile-payment">
                        <span id="payment-title">강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명</span>
                        <span id="payment-date">2024-07-09</span>
                    </div>
                    <div id="payment-main-3-1-box">
                        <img src="/img/class.jpg" class="profile-payment">
                        <span id="payment-title">강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명</span>
                        <span id="payment-date">2024-07-09</span>
                    </div>
                    <div id="payment-main-3-1-box">
                        <img src="/img/class.jpg" class="profile-payment">
                        <span id="payment-title">강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명</span>
                        <span id="payment-date">2024-07-09</span>
                    </div>
                    <div id="payment-main-3-1-box">
                        <img src="/img/class.jpg" class="profile-payment">
                        <span id="payment-title">강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명</span>
                        <span id="payment-date">2024-07-09</span>
                    </div>
                    <div id="payment-main-3-1-box">
                        <img src="/img/class.jpg" class="profile-payment">
                        <span id="payment-title">강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명</span>
                        <span id="payment-date">2024-07-09</span>
                    </div>
                    <div id="payment-main-3-1-box">
                        <img src="/img/class.jpg" class="profile-payment">
                        <span id="payment-title">강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명</span>
                        <span id="payment-date">2024-07-09</span>
                    </div>
                    <div id="payment-main-3-1-box">
                        <img src="/img/class.jpg" class="profile-payment">
                        <span id="payment-title">강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명</span>
                        <span id="payment-date">2024-07-09</span>
                    </div>
                </div>
            </div>`;


});


review.addEventListener('click', () => {

    menu.forEach((a) => {
        a.classList.remove('selected');
    })

    review.classList.add('selected');

    container.innerHTML = `<div id="review-main-1">내 리뷰
            </div>
            <div id="review-main-2">
                <div id="review-main-2-1">리뷰 작성하러 가기</div>
            </div>
            <div id="review-main-3">
                <div id="review-main-3-1">
                    <div id="review-main-3-1-1">
                        <img src="/img/profile-default.jpg" id="profile-img" class="profile-review">
                        <span id="review-nick">닉네임</span>
                        <span id="review-star">★★★★★ / 5.0</span>
                        <span id="review-title">강의명강의명강의명강의명강의명강의명강의명강의명</span>
                        <div id="review-description">강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용</div>
                    </div>

                    <div id="review-main-3-1-1">
                        <img src="/img/profile-default.jpg" id="profile-img" class="profile-review">
                        <span id="review-nick">닉네임</span>
                        <span id="review-star">★★★★★ / 5.0</span>
                        <span id="review-title">강의명강의명강의명강의명강의명강의명강의명강의명</span>
                        <div id="review-description">강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용</div>
                    </div> 
    
                    <div id="review-main-3-1-1">
                        <img src="/img/profile-default.jpg" id="profile-img" class="profile-review">
                        <span id="review-nick">닉네임</span>
                        <span id="review-star">★★★★★ / 5.0</span>
                        <span id="review-title">강의명강의명강의명강의명강의명강의명강의명강의명</span>
                        <div id="review-description">강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용</div>
                    </div>
                    
                    <div id="review-main-3-1-1">
                        <img src="/img/profile-default.jpg" id="profile-img" class="profile-review">
                        <span id="review-nick">닉네임</span>
                        <span id="review-star">★★★★★ / 5.0</span>
                        <span id="review-title">강의명강의명강의명강의명강의명강의명강의명강의명</span>
                        <div id="review-description">강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용</div>
                    </div>
                    <!-- <p>작성한 리뷰가 없어요</p> 리뷰 갯수에 따라 상태 변경-->    
                    <!-- 작성하면 추가-->
                </div>
            </div>`;
});

QA.addEventListener('click', () => {

    menu.forEach((a) => {
        a.classList.remove('selected');
    })

    QA.classList.add('selected');

    container.innerHTML = `<div id="qa-main-1">내가 작성한 Q&A <p></p>
            </div>
            <div id="qa-main-2">
                <div id="qa-main-2-1">Q&A 작성하러 가기</div>
            </div>
            <div id="qa-main-3">
                <div id="qa-main-3-1">
                    <!-- <p>작성한 Q&A가 없어요</p> -->
                    <div id="qa-main-3-1-box">
                        <img src="/img/class.jpg" class="profile-QA">
                        <span id="QA-title">강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명강의명</span>
                        <span id="QA-star">★★★★★</span>
                        <textarea type="text" id="QA-description" maxlength="300"></textarea>
                        <button id="QA-btn">작성하기</button>
                    </div>
                    <div id="qa-main-3-1-box">
                        <img src="/img/class.jpg" class="profile-QA">
                        <span id="QA-title">강의명</span>
                        <span id="QA-star">★★★★★</span>
                        <textarea type="text" id="QA-description" maxlength="300"></textarea>
                        <button id="QA-btn">작성하기</button>                    
                    </div>
                    <div id="qa-main-3-1-box">
                        <img src="/img/class.jpg" class="profile-QA">
                        <span id="QA-title">강의명</span>
                        <span id="QA-star">★★★★★</span>
                        <textarea type="text" id="QA-description" maxlength="300"></textarea>
                        <button id="QA-btn">작성하기</button>                    
                    </div>
                    <div id="qa-main-3-1-box">
                        <img src="/img/class.jpg" class="profile-QA">
                        <span id="QA-title">강의명</span>
                        <span id="QA-star">★★★★★</span>
                        <textarea type="text" id="QA-description" maxlength="300"></textarea>
                        <button id="QA-btn">작성하기</button>                    
                    </div>
                </div>
            </div>`;

});


document.querySelector('.containerH').addEventListener('click', (e) => {
    console.log(e.target.id);
    console.log(verifyCode);
    if (e.target.id == 'main-2-2-write') {
        document.querySelector("#main-2-2").innerHTML = `<input type="text" id="main-2-2-inputId"><button id="input-check" class="fa-solid fa-check"> </button> <button id="input-cancle" class="fa-solid fa-x"></button>`;
    }

    if (e.target.id == 'main-4-2-write') {
        document.querySelector("#main-4-2").innerHTML =
            `<input type="text" id="main-4-2-inputId"><button id="input2-check" class="fa-solid fa-check"> </button> <button id="input2-cancle" class="fa-solid fa-x"></button>`;
    }

    if (e.target.id == 'input2-check') {
        let emailAddress = document.querySelector('#main-4-2-inputId').value;
        user.email = emailAddress;
        SendVerifyEmail(emailAddress).then((val) => {
            verifyCode = val;
        });
        document.querySelector("#main-4-2").innerHTML = '';
        document.querySelector("#main-4-2").insertAdjacentHTML("afterbegin", `<input type="text" id="main-4-2-inputId"><button id="input2-verify">인증하기</button><br><span id="main-4-2-span"></span>`);
    }

    if (e.target.id == 'input2-verify') {
        if (document.querySelector("#main-4-2-inputId").value == verifyCode) {
            document.querySelector("#main-4-2").innerHTML = '';
            document.querySelector("#main-4-2").insertAdjacentHTML("afterbegin", `${user.email} 인증되었습니다.`);
        } else {
            document.querySelector("#main-4-2-span").innerHTML = `잘못된 인증번호 입니다.`;
        }
    };

    
    // 중복 검사
    if (e.target.id == 'input-check') {

        let input = document.querySelector("#main-2-2-inputId").value;
        if (input == '바뀜') {
            user.name = input;
            document.querySelector("#main-2-2").innerHTML = `<p>${input}</p><button id="main-2-2-write" class="fa-regular fa-pen-to-square"></button>`;
            document.querySelector("#main-2-3").innerText = ``;
        } else {
            document.querySelector("#main-2-3").innerText = `중복된 닉네임 입니다.`;
            document.querySelector("#main-2-3").classList.add("itsbad");
        }
    }
    if (e.target.id == 'input-cancle') {
        document.querySelector("#main-2-2").innerHTML = `<p>${user.name}</p><button id="main-2-2-write" class="fa-regular fa-pen-to-square"></button>`;
        document.querySelector("#main-2-3").innerText = ``;
    };
    // 모달 관련 js
    if (e.target.id == 'main-6-1-btn-1') {
        document.querySelector("#changePw-modal").hidden = false;
        document.querySelector("#background-modal").hidden = false;
    }

    if (e.target.id == 'main-6-1-btn-2') {
        document.querySelector("#resign-modal").hidden = false;
        document.querySelector("#background-modal").hidden = false;
    }

    if (e.target.id == 'modal-btn2') {
        document.querySelector("#resign-modal").hidden = true;
        document.querySelector("#background-modal").hidden = true;
    }

});

document.querySelector('.containerH').addEventListener('change', (e) => {

    if (e.target.id == 'main-3-2-btn-2') {
        const image = document.querySelector('#main-3-2-btn-2');
        const preview = document.querySelectorAll('#profile-img');
        const imageSrc = URL.createObjectURL(image.files[0]);
        preview[0].src = imageSrc;
        preview[1].src = imageSrc;
    }
});

// async function SendVerifyEmail(emailAddress) {

//     let verifyCode = 10000 + (Math.floor(Math.random() * 89999));
//     let data = {
//         service_id: 'service_8lls798',
//         template_id: 'template_uywyx8m',
//         user_id: '5Vm42iOtNtSnQK34-',
//         template_params: {
//             to_email: emailAddress,
//             message: verifyCode
//         }
//     };

//     try {
//         await fetch('https://api.emailjs.com/api/v1.0/email/send', {
//             method: 'POST',
//             headers: {
//                 'Content-Type': 'application/json'
//             },
//             body: JSON.stringify(data)
//         })

//             .then(function (res) {
//                 if (res.ok) {
//                     console.log('보내짐');
//                 } else {
//                     console.log('실패함' + res.statusText);
//                 }
//             })

//     } catch (err) {
//         console.log('err발생', err);
//     }
//     console.log(verifyCode)
//     return verifyCode;

// }






