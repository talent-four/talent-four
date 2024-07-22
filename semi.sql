alter session set "_oracle_script" = true;

create user semi identified by semi1234;

alter user semi default tablespace system quota unlimited on system;

grant connect, resource, create view to semi;



CREATE TABLE "MEMBER" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"MEMBER_EMAIL"	VARCHAR2(50)		NOT NULL,
	"MEMBER_NM"	VARCHAR2(30)		NOT NULL,
	"MEMBER_PW"	VARCHAR2(30)		NOT NULL,
	"ENROLL_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"SECESSION_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"MEMBER_ST"	NUMBER		NOT NULL,
	"MEMBER_PROFILE"	VARCHAR2(100)		NULL
);

COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원번호(시퀀스)';

COMMENT ON COLUMN "MEMBER"."MEMBER_EMAIL" IS '회원 이메일(아이디)';

COMMENT ON COLUMN "MEMBER"."MEMBER_NM" IS '회원 이름(닉네임)';

COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '회원 비밀번호';

COMMENT ON COLUMN "MEMBER"."ENROLL_DT" IS '회원가입일';

COMMENT ON COLUMN "MEMBER"."SECESSION_FL" IS '회원 탈퇴(탈퇴시 'Y')';

COMMENT ON COLUMN "MEMBER"."MEMBER_ST" IS '회원(1), 튜터(2), 관리자(3), 정지(4)';

COMMENT ON COLUMN "MEMBER"."MEMBER_PROFILE" IS '회원 프로필 사진';

CREATE TABLE "STUDYBOARD" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"STUDY_NM"	NUMBER	DEFAULT 2	NOT NULL,
	"STUDY_START"	DATE		NOT NULL,
	"STUDY_END"	DATE		NOT NULL,
	"STUDY_ TYPE"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"STUDY_ADDRESS"	VARCHAR2(500)		NULL,
	"STUDY_STATUS"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"STUDY_COST"	VARCHAR2(150)		NULL,
	"STUDY_COMMUMITY"	VARCHAR2(150)		NOT NULL
);

COMMENT ON COLUMN "STUDYBOARD"."BOARD_NO" IS '게시글번호(시퀀스)';

COMMENT ON COLUMN "STUDYBOARD"."STUDY_NM" IS '모임인원';

COMMENT ON COLUMN "STUDYBOARD"."STUDY_START" IS '모임시작일(시간, 분까지 기입)';

COMMENT ON COLUMN "STUDYBOARD"."STUDY_END" IS '모임종료일(시간, 분까지 기입)';

COMMENT ON COLUMN "STUDYBOARD"."STUDY_ TYPE" IS '오프라인(N) 온라인(Y)';

COMMENT ON COLUMN "STUDYBOARD"."STUDY_ADDRESS" IS '모임 상세 주소';

COMMENT ON COLUMN "STUDYBOARD"."STUDY_STATUS" IS '모집중(N) 모집 완료(Y)';

COMMENT ON COLUMN "STUDYBOARD"."STUDY_COST" IS '모임시 필요비용';

COMMENT ON COLUMN "STUDYBOARD"."STUDY_COMMUMITY" IS '오픈카톡/이메일 등 기입';

CREATE TABLE "TUTOR" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"TUTOR_EDUCATION"	VARCHAR2(500)		NOT NULL,
	"TUTOR_TEL"	CHAR(11)		NOT NULL,
	"TUTOR_PROFILE"	VARCHAR2(100)		NOT NULL,
	"TUTOR_INTRODUCER"	VARCHAR2(900)		NOT NULL,
	"SAVE_STATUS"	CHAR(1)	DEFAULT 1	NULL
);

COMMENT ON COLUMN "TUTOR"."MEMBER_NO" IS '회원번호(시퀀스)';

COMMENT ON COLUMN "TUTOR"."TUTOR_EDUCATION" IS '학력';

COMMENT ON COLUMN "TUTOR"."TUTOR_TEL" IS '전화번호';

COMMENT ON COLUMN "TUTOR"."TUTOR_PROFILE" IS '튜터 프로필(증명사진)';

COMMENT ON COLUMN "TUTOR"."TUTOR_INTRODUCER" IS '튜터 소개';

COMMENT ON COLUMN "TUTOR"."SAVE_STATUS" IS '저장(1) 임시저장(2)';

CREATE TABLE "BOARD_TYPE" (
	"BOARD_CD"	NUMBER		NOT NULL,
	"BOARD_NM"	VARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_CD" IS '게시판코드';

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_NM" IS '게시판이름';

CREATE TABLE "BOARD" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"BOARD_TITLE"	VARCHAR2(150)		NOT NULL,
	"BOARD_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"CREATED_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"UPDATE_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"READ_COUNT"	NUMBER	DEFAULT 0	NULL,
	"BOARD_ST"	NUMBER	DEFAULT '1'	NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"BOARD_CD"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "BOARD"."BOARD_NO" IS '게시글번호(시퀀스)';

COMMENT ON COLUMN "BOARD"."BOARD_TITLE" IS '게시글제목';

COMMENT ON COLUMN "BOARD"."BOARD_CONTENT" IS '게시글내용';

COMMENT ON COLUMN "BOARD"."CREATED_DT" IS '작성일';

COMMENT ON COLUMN "BOARD"."UPDATE_DT" IS '마지막수정일';

COMMENT ON COLUMN "BOARD"."READ_COUNT" IS '조회수';

COMMENT ON COLUMN "BOARD"."BOARD_ST" IS '게시글상태(정상1,삭제2,비밀글3)';

COMMENT ON COLUMN "BOARD"."MEMBER_NO" IS '회원번호(시퀀스)';

COMMENT ON COLUMN "BOARD"."BOARD_CD" IS '게시판코드';

CREATE TABLE "HASHTAG" (
	"TAG_NO"	NUMBER		NOT NULL,
	"TAG_NAME"	VARCHAR2(100)		NOT NULL,
	"TAG_IMG"	VARCHAR2(100)		NULL,
	"BOARD_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "HASHTAG"."TAG_NO" IS '태그 번호';

COMMENT ON COLUMN "HASHTAG"."TAG_NAME" IS '태그이름';

COMMENT ON COLUMN "HASHTAG"."TAG_IMG" IS '태그 이미지';

COMMENT ON COLUMN "HASHTAG"."BOARD_NO" IS '게시글번호(시퀀스)';

CREATE TABLE "THUMBS" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"MEMBER_NO2"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "THUMBS"."BOARD_NO" IS '게시글번호(시퀀스)';

COMMENT ON COLUMN "THUMBS"."MEMBER_NO2" IS '회원번호(시퀀스)';

CREATE TABLE "PAID" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"CLASS_NO"	NUMBER		NOT NULL,
	"PAYMENT"	VARCHAR2(100)		NOT NULL,
	"PAYMENT_STATUS"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"START_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "PAID"."MEMBER_NO" IS '수강생 번호';

COMMENT ON COLUMN "PAID"."CLASS_NO" IS '강의 번호';

COMMENT ON COLUMN "PAID"."PAYMENT" IS '결제수단(무통장입금,카카오페이)';

COMMENT ON COLUMN "PAID"."PAYMENT_STATUS" IS '결제상태(미결제 N, 결제 Y)';

COMMENT ON COLUMN "PAID"."START_DATE" IS '결제일';

CREATE TABLE "CHATTING" (
	"CHAT_ROOM"	NUMBER		NOT NULL,
	"CHAT_FROM"	NUMBER		NOT NULL,
	"CHAT_TO"	NUMBER		NOT NULL,
	"CHAT_MESSAGE"	VARCHAR2(3000)		NULL,
	"CHAT_TIMESTAMP"	DATE		NOT NULL
);

COMMENT ON COLUMN "CHATTING"."CHAT_ROOM" IS '채팅방번호';

COMMENT ON COLUMN "CHATTING"."CHAT_FROM" IS '회원번호(시퀀스)';

COMMENT ON COLUMN "CHATTING"."CHAT_TO" IS '회원번호(시퀀스)';

COMMENT ON COLUMN "CHATTING"."CHAT_MESSAGE" IS '메시지';

COMMENT ON COLUMN "CHATTING"."CHAT_TIMESTAMP" IS '보낸시간';

CREATE TABLE "WONDER_ANSER" (
	"ANSER_NO"	NUMBER		NOT NULL,
	"ANSER_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"ANSER_ST"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"ANSER_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "WONDER_ANSER"."ANSER_NO" IS '답변번호(시퀀스)';

COMMENT ON COLUMN "WONDER_ANSER"."ANSER_CONTENT" IS '답변내용';

COMMENT ON COLUMN "WONDER_ANSER"."ANSER_ST" IS '삭제Y 기본 N';

COMMENT ON COLUMN "WONDER_ANSER"."ANSER_DT" IS '답변작성일';

COMMENT ON COLUMN "WONDER_ANSER"."BOARD_NO" IS '게시글번호(시퀀스)';

CREATE TABLE "WONDER_BOARD" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"QA_STATUS"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"WONDER_TYPE"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "WONDER_BOARD"."BOARD_NO" IS '게시글번호(시퀀스)';

COMMENT ON COLUMN "WONDER_BOARD"."QA_STATUS" IS '해결(Y)_미해결(N)';

COMMENT ON COLUMN "WONDER_BOARD"."WONDER_TYPE" IS '자유궁금증, 강의가궁금해요';

CREATE TABLE "REVIEW" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"REIVEW_STAR"	VARCHAR(15)		NOT NULL
);

COMMENT ON COLUMN "REVIEW"."BOARD_NO" IS '게시글번호(시퀀스)';

COMMENT ON COLUMN "REVIEW"."REIVEW_STAR" IS '수강후기 별점';

CREATE TABLE "SETTLE" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"COMMISSION"	NUMBER		NOT NULL,
	"SETTLE_DATE"	DATE		NOT NULL,
	"SETTLE_STATUS"	CHAR(1)	DEFAULT 1	NOT NULL
);

COMMENT ON COLUMN "SETTLE"."MEMBER_NO" IS '튜터';

COMMENT ON COLUMN "SETTLE"."COMMISSION" IS '결제 수수료율';

COMMENT ON COLUMN "SETTLE"."SETTLE_DATE" IS '정산신청날자';

COMMENT ON COLUMN "SETTLE"."SETTLE_STATUS" IS '정산 가능(1)  정산진행중(2) 정산 완료(3)';

CREATE TABLE "QUALIFICATION" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"TUTOR_QUALIFICATION"	VARCHAR2(500)		NOT NULL
);

COMMENT ON COLUMN "QUALIFICATION"."MEMBER_NO" IS '회원번호(시퀀스)';

COMMENT ON COLUMN "QUALIFICATION"."TUTOR_QUALIFICATION" IS '자격증(이미지, pdf)';

CREATE TABLE "REPORT" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"REPORT_TYPE"	VARCHAR2(200)		NOT NULL,
	"REPORT_CONTENT"	VARCHAR2(1000)		NOT NULL
);

COMMENT ON COLUMN "REPORT"."BOARD_NO" IS '게시글번호(시퀀스)';

COMMENT ON COLUMN "REPORT"."MEMBER_NO" IS '회원번호(시퀀스)';

COMMENT ON COLUMN "REPORT"."REPORT_TYPE" IS '신고유형';

COMMENT ON COLUMN "REPORT"."REPORT_CONTENT" IS '신고내용';

CREATE TABLE "SETTLE_ACCOUNT" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"TUTOR_ACCOUNT"	VARCHAR2(20)		NOT NULL,
	"BANK_NAME"	VARCHAR2(50)		NOT NULL,
	"ACCOUNT_NAME"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "SETTLE_ACCOUNT"."MEMBER_NO" IS '회원번호(시퀀스)';

COMMENT ON COLUMN "SETTLE_ACCOUNT"."TUTOR_ACCOUNT" IS '튜터계좌';

COMMENT ON COLUMN "SETTLE_ACCOUNT"."BANK_NAME" IS '은행명';

COMMENT ON COLUMN "SETTLE_ACCOUNT"."ACCOUNT_NAME" IS '예금주명';

CREATE TABLE "CLASS" (
	"CLASS_NO"	NUMBER		NOT NULL,
	"CLASS_NAME"	VARCHAR2(100)		NOT NULL,
	"CLASS_INTRO"	VARCHAR2(3000)		NOT NULL,
	"CLASS_PHOTO"	VARCHAR2(200)		NOT NULL,
	"CLASS_URL"	VARCHAR2(100)		NOT NULL,
	"CLASS_CREATE_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"CLASS_STATUS"	NUMBER	DEFAULT 1	NOT NULL,
	"CLASS_PRICE"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"CATEGORY_CODE"	VARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "CLASS"."CLASS_NO" IS '강의 번호';

COMMENT ON COLUMN "CLASS"."CLASS_NAME" IS '클래스명';

COMMENT ON COLUMN "CLASS"."CLASS_INTRO" IS '클래스 설명';

COMMENT ON COLUMN "CLASS"."CLASS_PHOTO" IS '클래스 사진';

COMMENT ON COLUMN "CLASS"."CLASS_URL" IS '클래스 동영상 주소';

COMMENT ON COLUMN "CLASS"."CLASS_CREATE_DT" IS '클래스 개설일';

COMMENT ON COLUMN "CLASS"."CLASS_STATUS" IS '운영중 1, 삭제 2';

COMMENT ON COLUMN "CLASS"."CLASS_PRICE" IS '금액';

COMMENT ON COLUMN "CLASS"."MEMBER_NO" IS '튜터 번호';

COMMENT ON COLUMN "CLASS"."CATEGORY_CODE" IS '카테고리 코드';

CREATE TABLE "COURSE" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"CLASS_NO"	NUMBER		NOT NULL,
	"CLASS_LAST_INFO"	VARCHAR2(100)		NULL
);

COMMENT ON COLUMN "COURSE"."MEMBER_NO" IS '수강생 번호';

COMMENT ON COLUMN "COURSE"."CLASS_NO" IS '강의 번호';

COMMENT ON COLUMN "COURSE"."CLASS_LAST_INFO" IS '마지막 영상 정보(없어도 무방)';

CREATE TABLE "CATEGORY" (
	"CATEGORY_CODE"	VARCHAR2(20)		NOT NULL,
	"CATEGORY_NAME"	VARCHAR2(50)		NOT NULL,
	"PARENT_ID"	VARCHAR(255)		NULL
);

COMMENT ON COLUMN "CATEGORY"."CATEGORY_CODE" IS '카테고리 코드';

COMMENT ON COLUMN "CATEGORY"."CATEGORY_NAME" IS '카테고리 이름';

COMMENT ON COLUMN "CATEGORY"."PARENT_ID" IS '자기 참조 외래키';

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MEMBER_NO"
);

ALTER TABLE "STUDYBOARD" ADD CONSTRAINT "PK_STUDYBOARD" PRIMARY KEY (
	"BOARD_NO"
);

ALTER TABLE "TUTOR" ADD CONSTRAINT "PK_TUTOR" PRIMARY KEY (
	"MEMBER_NO"
);

ALTER TABLE "BOARD_TYPE" ADD CONSTRAINT "PK_BOARD_TYPE" PRIMARY KEY (
	"BOARD_CD"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"BOARD_NO"
);

ALTER TABLE "HASHTAG" ADD CONSTRAINT "PK_HASHTAG" PRIMARY KEY (
	"TAG_NO"
);

ALTER TABLE "THUMBS" ADD CONSTRAINT "PK_THUMBS" PRIMARY KEY (
	"BOARD_NO",
	"MEMBER_NO2"
);

ALTER TABLE "PAID" ADD CONSTRAINT "PK_PAID" PRIMARY KEY (
	"MEMBER_NO",
	"CLASS_NO"
);

ALTER TABLE "CHATTING" ADD CONSTRAINT "PK_CHATTING" PRIMARY KEY (
	"CHAT_ROOM"
);

ALTER TABLE "WONDER_ANSER" ADD CONSTRAINT "PK_WONDER_ANSER" PRIMARY KEY (
	"ANSER_NO"
);

ALTER TABLE "WONDER_BOARD" ADD CONSTRAINT "PK_WONDER_BOARD" PRIMARY KEY (
	"BOARD_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY (
	"BOARD_NO"
);

ALTER TABLE "SETTLE" ADD CONSTRAINT "PK_SETTLE" PRIMARY KEY (
	"MEMBER_NO"
);

ALTER TABLE "QUALIFICATION" ADD CONSTRAINT "PK_QUALIFICATION" PRIMARY KEY (
	"MEMBER_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "PK_REPORT" PRIMARY KEY (
	"BOARD_NO",
	"MEMBER_NO"
);

ALTER TABLE "SETTLE_ACCOUNT" ADD CONSTRAINT "PK_SETTLE_ACCOUNT" PRIMARY KEY (
	"MEMBER_NO"
);

ALTER TABLE "CLASS" ADD CONSTRAINT "PK_CLASS" PRIMARY KEY (
	"CLASS_NO"
);

ALTER TABLE "COURSE" ADD CONSTRAINT "PK_COURSE" PRIMARY KEY (
	"MEMBER_NO",
	"CLASS_NO"
);

ALTER TABLE "CATEGORY" ADD CONSTRAINT "PK_CATEGORY" PRIMARY KEY (
	"CATEGORY_CODE"
);

ALTER TABLE "STUDYBOARD" ADD CONSTRAINT "FK_BOARD_TO_STUDYBOARD_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);

ALTER TABLE "TUTOR" ADD CONSTRAINT "FK_MEMBER_TO_TUTOR_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "THUMBS" ADD CONSTRAINT "FK_BOARD_TO_THUMBS_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);

ALTER TABLE "THUMBS" ADD CONSTRAINT "FK_MEMBER_TO_THUMBS_1" FOREIGN KEY (
	"MEMBER_NO2"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "PAID" ADD CONSTRAINT "FK_MEMBER_TO_PAID_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "PAID" ADD CONSTRAINT "FK_CLASS_TO_PAID_1" FOREIGN KEY (
	"CLASS_NO"
)
REFERENCES "CLASS" (
	"CLASS_NO"
);

ALTER TABLE "WONDER_BOARD" ADD CONSTRAINT "FK_BOARD_TO_WONDER_BOARD_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_BOARD_TO_REVIEW_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);

ALTER TABLE "SETTLE" ADD CONSTRAINT "FK_TUTOR_TO_SETTLE_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "TUTOR" (
	"MEMBER_NO"
);

ALTER TABLE "QUALIFICATION" ADD CONSTRAINT "FK_TUTOR_TO_QUALIFICATION_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "TUTOR" (
	"MEMBER_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "FK_BOARD_TO_REPORT_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "FK_MEMBER_TO_REPORT_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "SETTLE_ACCOUNT" ADD CONSTRAINT "FK_MEMBER_TO_SETTLE_ACCOUNT_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "PAID" ADD CONSTRAINT "UQ_PAID_MEMBER_NO" UNIQUE ("MEMBER_NO");
ALTER TABLE "PAID" ADD CONSTRAINT "UQ_PAID_CLASS_NO" UNIQUE ("CLASS_NO");

ALTER TABLE "COURSE" ADD CONSTRAINT "FK_PAID_TO_COURSE_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "PAID" (
	"MEMBER_NO"
);

ALTER TABLE "COURSE" ADD CONSTRAINT "FK_PAID_TO_COURSE_2" FOREIGN KEY (
	"CLASS_NO"
)
REFERENCES "PAID" (
	"CLASS_NO"
);

-- 멤버 시퀀스 생성
CREATE SEQUENCE SEQ_MEMBER_NO;

-- 유저 삽입

-- 유저1
INSERT INTO MEMBER VALUES (SEQ_MEMBER_NO.NEXTVAL, 'KH@NAVER.COM', 'USER1', 'PASS1', DEFAULT, 'N', '1', NULL);
--튜터1
INSERT INTO MEMBER VALUES (SEQ_MEMBER_NO.NEXTVAL, 'KH2@NAVER.COM', 'USER2', 'PASS2', DEFAULT, 'N', '2', NULL);
--관리자1
INSERT INTO MEMBER VALUES (SEQ_MEMBER_NO.NEXTVAL, 'KH3@NAVER.COM', 'USER3', 'PASS3', DEFAULT, 'N', '3', NULL);
--유저2
INSERT INTO MEMBER VALUES (SEQ_MEMBER_NO.NEXTVAL, 'KH4@NAVER.COM', 'USER4', 'PASS4', DEFAULT, 'N', '1', NULL);

-- 튜터 세부정보 삽입
INSERT INTO TUTOR VALUES (2, 'KH대학', 01012345678, '프로필입니다', '소개입니다', 1);

-- 시퀀스 만들어야할듯

--카테고리 정보 삽입
INSERT INTO CATEGORY VALUES (1, '개발.프로그래밍', NULL);
INSERT INTO CATEGORY VALUES (2, '게임 개발', NULL);
INSERT INTO CATEGORY VALUES (3, '데이터 사이언스', NULL);
INSERT INTO CATEGORY VALUES (4, '웹 개발', 1);
INSERT INTO CATEGORY VALUES (5, '프론트엔드', 1);
INSERT INTO CATEGORY VALUES (6, '백엔드', 1);
INSERT INTO CATEGORY VALUES (7, 'JavaScripit', 4);
INSERT INTO CATEGORY VALUES (8, 'HTML/css', 4);
INSERT INTO CATEGORY VALUES (9, 'React', 4);

-- 클래스 시퀀스 생성
CREATE SEQUENCE SEQ_CLASS_NO;

-- 클래스 생성
INSERT INTO CLASS VALUES (SEQ_CLASS_NO.NEXTVAL, '테스트 강의1', '강의 설명', 'DEFAULT', 'URL' , SYSDATE, 1, 29900, 2,7);
INSERT INTO CLASS VALUES (SEQ_CLASS_NO.NEXTVAL, '테스트 강의2', '강의 설명', 'DEFAULT', 'URL' , SYSDATE, 1, 39900, 2,8);

-- 1번 회원이 1번 테스트강의 결제
INSERT INTO PAID VALUES (1, 1, '무통장입금' , 'Y' , SYSDATE);

-- 보드 시퀀스 생성
CREATE SEQUENCE SEQ_BOARD_NO;



-- 1번 클래스에 대한 리뷰 작성 (작성자 1번 회원)
INSERT INTO BOARD VALUES (SEQ_BOARD_NO.NEXTVAL, '강의후기 제목', '강의 후기 내용입니다.', SYSDATE, SYSDATE, DEFAULT, DEFAULT,1,3);
INSERT INTO BOARD VALUES (SEQ_BOARD_NO.NEXTVAL, '강의후기 제목1', '강의 후기 내용입니다.', SYSDATE, SYSDATE, DEFAULT, DEFAULT,1,3);
INSERT INTO BOARD VALUES (SEQ_BOARD_NO.NEXTVAL, '강의후기 제목2', '강의 후기 내용입니다.', SYSDATE, SYSDATE, DEFAULT, DEFAULT,1,3);
INSERT INTO BOARD VALUES (SEQ_BOARD_NO.NEXTVAL, '강의후기 제목3', '강의 후기 내용입니다.', SYSDATE, SYSDATE, DEFAULT, DEFAULT,1,3);
INSERT INTO BOARD VALUES (SEQ_BOARD_NO.NEXTVAL, '강의후기 제목4', '강의 후기 내용입니다.', SYSDATE, SYSDATE, DEFAULT, DEFAULT,1,3);
INSERT INTO BOARD VALUES (SEQ_BOARD_NO.NEXTVAL, '강의후기 제목5', '강의 후기 내용입니다.', SYSDATE, SYSDATE, DEFAULT, DEFAULT,1,3);


-- 게시판 종류 
INSERT INTO BOARD_TYPE VALUES (1, '클래스');
INSERT INTO BOARD_TYPE VALUES (2, '스터디모집');
INSERT INTO BOARD_TYPE VALUES (3, '수강후기');
INSERT INTO BOARD_TYPE VALUES (4, '궁금해요');

-- 수강후기 추가 내용 삽입
INSERT INTO REVIEW VALUES(1, 4);
INSERT INTO REVIEW VALUES(2, 2);
INSERT INTO REVIEW VALUES(3, 5);
INSERT INTO REVIEW VALUES(4, 1);
INSERT INTO REVIEW VALUES(5, 2);
INSERT INTO REVIEW VALUES(6, 3);


-- 1번 회원이 게시판 1번글을 추천(리뷰)
INSERT INTO THUMBS VALUES(1, 1);
-- 무결성 제약조건 오류 확인

-- 1번회원이 게시판 1번글을 신고(리뷰)
INSERT INTO REPORT VALUES(1,1,'욕함', '욕했다니까');
-- 무결성 제약조건 오류 확인

-- 태그 삽입
--태그 시퀀스 생성
-- ㅋㅋ 테이블 잘못만듬 수정까진 필요없을듯
CREATE SEQUENCE SEQ_HASHTAG_NO;

INSERT INTO HASHTAG VALUES (SEQ_HASHTAG_NO.NEXTVAL, '강사님이 친절해요', NULL, 1);
INSERT INTO HASHTAG VALUES (SEQ_HASHTAG_NO.NEXTVAL, '재밌어요', NULL, 1);
INSERT INTO HASHTAG VALUES (SEQ_HASHTAG_NO.NEXTVAL, '시간가는줄 몰라요', NULL, 1);
INSERT INTO HASHTAG VALUES (SEQ_HASHTAG_NO.NEXTVAL, '가격대비 최고', NULL, 1);
INSERT INTO HASHTAG VALUES (SEQ_HASHTAG_NO.NEXTVAL, '또 들을 예정', NULL, 1);
INSERT INTO HASHTAG VALUES (SEQ_HASHTAG_NO.NEXTVAL, '강사님이 친절해요', NULL, 1);
SELECT * FROM HASHTAG;

COMMIT;
-- 로그인 SQL문
SELECT MEMBER_NO, MEMBER_EMAIL, MEMBER_NM, MEMBER_PW, MEMBER_ST, MEMBER_PROFILE FROM MEMBER WHERE MEMBER_NM='USER1' AND MEMBER_PW='PASS1' AND SECESSION_FL='N' ;

-- ID중복 검사 SQL문
SELECT COUNT(MEMBER_NM) FROM MEMBER WHERE MEMBER_NM = 'USER1';

SELECT * FROM MEMBER;
UPDATE MEMBER SET MEMBER_NM='USER1' WHERE MEMBER_NM='ASD'; 

-- 비밀번호 검사 SQL문
SELECT COUNT(MEMBER_NO) FROM MEMBER WHERE MEMBER_PW='PASS1' AND MEMBER_NO=1;

-- 궁금해요 게시판 
INSERT INTO BOARD VALUES (SEQ_BOARD_NO.NEXTVAL, 'sql이 궁금해요', 'sql알려주세요', SYSDATE, SYSDATE, DEFAULT, DEFAULT,1,4);
INSERT INTO WONDER_BOARD VALUES(8, 'N', '강의가궁금해요');

INSERT INTO WONDER_BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 'Y', '강의가궁금해요');
SELECT SEQ_BOARD_NO.CURRVAL FROM DUAL;

INSERT INTO BOARD VALUES (2000, 'sql이 궁금해요', 'sql알려주세요', SYSDATE, SYSDATE, DEFAULT, DEFAULT,1,4);
INSERT INTO WONDER_BOARD VALUES(2000, 'Y', '강의가궁금해요');
commit;

INSERT INTO BOARD VALUES (SEQ_BOARD_NO.NEXTVAL, 'vscode설치법', 'vscode설치 하는방법', SYSDATE, SYSDATE, DEFAULT, DEFAULT,1,4);
INSERT INTO WONDER_BOARD VALUES(9, 'Y', '자유로운궁금증');
INSERT INTO WONDER_BOARD VALUES(501, 'N', '자유로운궁금증');

-- 궁금해요 더미게시판더미.
BEGIN
    FOR I IN 1..500 LOOP
    
    INSERT INTO BOARD
    VALUES(SEQ_BOARD_NO.NEXTVAL,
           SEQ_BOARD_NO.CURRVAL || '번째 게시글',
           SEQ_BOARD_NO.CURRVAL || '번째 게시글 내용입니다.',
           DEFAULT, DEFAULT, DEFAULT, DEFAULT,1,4
    
    );
    END LOOP;

END;
/

-- 해시태그

INSERT INTO HASHTAG VALUES (SEQ_HASHTAG_NO.NEXTVAL, 'sql', NULL, 1);
commit;
rollback;

CREATE SEQUENCE BOARD_SEQ START WITH 1 INCREMENT BY 1;


-- 원더보드 검색
SELECT BOARD_NO,BOARD_TITLE,BOARD_CONTENT,CREATED_DT,READ_COUNT,MEMBER_NM,QA_STATUS,WONDER_TYPE FROM BOARD
JOIN WONDER_BOARD USING(BOARD_NO)
JOIN MEMBER USING(MEMBER_NO)
WHERE WONDER_TYPE ='자유로운궁금증' AND BOARD_CD='4';
