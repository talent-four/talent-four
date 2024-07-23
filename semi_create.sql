BEGIN
   -- 테이블 삭제
   FOR r IN (SELECT table_name FROM user_tables) LOOP
      EXECUTE IMMEDIATE 'DROP TABLE ' || r.table_name || ' CASCADE CONSTRAINTS';
   END LOOP;

   -- 시퀀스 삭제
   FOR s IN (SELECT sequence_name FROM user_sequences) LOOP
      EXECUTE IMMEDIATE 'DROP SEQUENCE ' || s.sequence_name;
   END LOOP;
END;
/

CREATE TABLE "MEMBER" (
	"MEMBER_NO"	        NUMBER		        PRIMARY KEY,
	"MEMBER_EMAIL"	    VARCHAR2(50)		NOT NULL UNIQUE,
	"MEMBER_NM"	        VARCHAR2(30)		NOT NULL UNIQUE,
	"MEMBER_PW"	        VARCHAR2(200)		NOT NULL,
	"ENROLL_DT"	        DATE	            DEFAULT SYSDATE NOT NULL,
	"SECESSION_FL"	    CHAR(1)	            DEFAULT 'N'	NOT NULL,
	"MEMBER_ST"	        NUMBER		        DEFAULT 1 NOT NULL,
	"MEMBER_PROFILE"	VARCHAR2(300)		NULL
);

COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원번호(시퀀스)';
COMMENT ON COLUMN "MEMBER"."MEMBER_EMAIL" IS '회원 이메일(아이디)';
COMMENT ON COLUMN "MEMBER"."MEMBER_NM" IS '회원 이름(닉네임) 한글로만';
COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '회원 비밀번호';
COMMENT ON COLUMN "MEMBER"."ENROLL_DT" IS '회원가입일';
COMMENT ON COLUMN "MEMBER"."SECESSION_FL" IS '회원 탈퇴(탈퇴시 Y)';
COMMENT ON COLUMN "MEMBER"."MEMBER_ST" IS '회원(1), 튜터(2), 관리자(3), 정지(4)';
COMMENT ON COLUMN "MEMBER"."MEMBER_PROFILE" IS '회원 프로필 사진';

CREATE TABLE "TUTOR" (
	"MEMBER_NO"	        NUMBER		        PRIMARY KEY,
	"TUTOR_EDUCATION"	VARCHAR2(500)	    NOT NULL,
	"TUTOR_TEL"	        VARCHAR2(11)		    NOT NULL,
	"TUTOR_PROFILE"	    VARCHAR2(200)		NOT NULL,
	"TUTOR_INTRODUCER"	VARCHAR2(900)		NOT NULL,
    FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN "TUTOR"."MEMBER_NO" IS '회원번호(시퀀스)';
COMMENT ON COLUMN "TUTOR"."TUTOR_EDUCATION" IS '학력';
COMMENT ON COLUMN "TUTOR"."TUTOR_TEL" IS '전화번호';
COMMENT ON COLUMN "TUTOR"."TUTOR_PROFILE" IS '튜터 프로필(증명사진)';
COMMENT ON COLUMN "TUTOR"."TUTOR_INTRODUCER" IS '튜터 소개';

CREATE TABLE "SETTLE" (
	"MEMBER_NO"	    NUMBER		PRIMARY KEY,
	"COMMISSION"	NUMBER		DEFAULT 20,
	"SETTLE_DATE"	DATE		DEFAULT SYSDATE NOT NULL,
	"SETTLE_STATUS"	CHAR(1)	    DEFAULT 1	NOT NULL,
    FOREIGN KEY (MEMBER_NO) REFERENCES TUTOR (MEMBER_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN "SETTLE"."MEMBER_NO" IS '튜터';
COMMENT ON COLUMN "SETTLE"."COMMISSION" IS '결제 수수료율';
COMMENT ON COLUMN "SETTLE"."SETTLE_DATE" IS '정산신청날자';
COMMENT ON COLUMN "SETTLE"."SETTLE_STATUS" IS '정산 가능(1)  정산진행중(2) 정산 완료(3)';

CREATE TABLE "SETTLE_ACCOUNT" (
	"MEMBER_NO"	    NUMBER		PRIMARY KEY,
	"TUTOR_ACCOUNT"	VARCHAR2(20)		NOT NULL,
	"BANK_NAME"	VARCHAR2(50)		NOT NULL,
	"ACCOUNT_NAME"	VARCHAR2(30)		NOT NULL,
    FOREIGN KEY (MEMBER_NO) REFERENCES TUTOR (MEMBER_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN "SETTLE_ACCOUNT"."MEMBER_NO" IS '회원번호(시퀀스)';
COMMENT ON COLUMN "SETTLE_ACCOUNT"."TUTOR_ACCOUNT" IS '튜터계좌';
COMMENT ON COLUMN "SETTLE_ACCOUNT"."BANK_NAME" IS '은행명';
COMMENT ON COLUMN "SETTLE_ACCOUNT"."ACCOUNT_NAME" IS '예금주명';

CREATE TABLE "CATEGORY" (
	"CATEGORY_CODE"	VARCHAR2(20)		PRIMARY KEY,
	"CATEGORY_NAME"	VARCHAR2(50)		NOT NULL UNIQUE,
	"PARENT_ID"	VARCHAR(20)		        NULL,
    FOREIGN KEY (PARENT_ID) REFERENCES CATEGORY (CATEGORY_CODE) ON DELETE CASCADE
);

COMMENT ON COLUMN "CATEGORY"."CATEGORY_CODE" IS '카테고리 코드';
COMMENT ON COLUMN "CATEGORY"."CATEGORY_NAME" IS '카테고리 이름';
COMMENT ON COLUMN "CATEGORY"."PARENT_ID" IS '자기 참조 외래키';

CREATE TABLE "CLASS" (
	"CLASS_NO"	    NUMBER		        PRIMARY KEY,
	"CLASS_NAME"	VARCHAR2(100)		NOT NULL,
	"CLASS_INTRO"	VARCHAR2(4000)		NOT NULL,
	"CLASS_PHOTO"	VARCHAR2(200)		NOT NULL,
	"CLASS_URL"	    VARCHAR2(100)		,
	"CLASS_CREATE_DT"	DATE	        DEFAULT SYSDATE	NOT NULL,
	"CLASS_STATUS"	NUMBER	            DEFAULT 1	NOT NULL,
	"CLASS_PRICE"	NUMBER		        NOT NULL,
	"MEMBER_NO"	    NUMBER		        NOT NULL,
	"CATEGORY_CODE"	VARCHAR2(20)		NOT NULL,
    FOREIGN KEY (MEMBER_NO) REFERENCES TUTOR (MEMBER_NO) ON DELETE CASCADE,
    FOREIGN KEY (CATEGORY_CODE) REFERENCES CATEGORY (CATEGORY_CODE) ON DELETE CASCADE
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

CREATE TABLE "PAID" (
	"MEMBER_NO"	        NUMBER		,
	"CLASS_NO"	        NUMBER		,
	"PAYMENT"	        VARCHAR2(100)		NOT NULL,
	"PAYMENT_STATUS"	CHAR(1)	    DEFAULT 'N'	NOT NULL,
	"PAYMENT_DATE"	    DATE	DEFAULT SYSDATE	NOT NULL,
    PRIMARY KEY (MEMBER_NO, CLASS_NO),
    FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO) ON DELETE CASCADE,
    FOREIGN KEY (CLASS_NO) REFERENCES CLASS (CLASS_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN "PAID"."MEMBER_NO" IS '수강생 번호';
COMMENT ON COLUMN "PAID"."CLASS_NO" IS '강의 번호';
COMMENT ON COLUMN "PAID"."PAYMENT" IS '결제수단(무통장입금,카카오페이)';
COMMENT ON COLUMN "PAID"."PAYMENT_STATUS" IS '결제상태(미결제 N, 결제 Y)';
COMMENT ON COLUMN "PAID"."PAYMENT_DATE" IS '결제일';

CREATE TABLE "COURSE" (
	"MEMBER_NO"	        NUMBER,
	"CLASS_NO"	        NUMBER,
	"CLASS_LAST_INFO"	VARCHAR2(100),
    PRIMARY KEY (MEMBER_NO, CLASS_NO),
    FOREIGN KEY (CLASS_NO, MEMBER_NO) REFERENCES PAID (CLASS_NO, MEMBER_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN "COURSE"."MEMBER_NO" IS '수강생 번호';
COMMENT ON COLUMN "COURSE"."CLASS_NO" IS '강의 번호';
COMMENT ON COLUMN "COURSE"."CLASS_LAST_INFO" IS '마지막 영상 정보(없어도 무방)';

CREATE TABLE "BOARD_TYPE" (
	"BOARD_CD"	NUMBER		        PRIMARY KEY,
	"BOARD_NM"	VARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_CD" IS '게시판코드';
COMMENT ON COLUMN "BOARD_TYPE"."BOARD_NM" IS '게시판이름';

CREATE TABLE "BOARD" (
	"BOARD_NO"	    NUMBER		        PRIMARY KEY,
	"BOARD_TITLE"	VARCHAR2(150)		NOT NULL,
	"BOARD_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"CREATED_DT"	DATE	            DEFAULT SYSDATE	NOT NULL,
	"UPDATE_DT"	    DATE	            DEFAULT NULL,
	"READ_COUNT"	NUMBER	            DEFAULT 0,
	"BOARD_ST"	    NUMBER	            DEFAULT '1'	NOT NULL,
	"MEMBER_NO"	    NUMBER		        NOT NULL,
	"BOARD_CD"	    NUMBER		        NOT NULL,
    FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO) ON DELETE CASCADE,
    FOREIGN KEY (BOARD_CD) REFERENCES BOARD_TYPE (BOARD_CD) ON DELETE CASCADE
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

CREATE TABLE "REVIEW" (
	"BOARD_NO"	    NUMBER		    PRIMARY KEY,
    "CLASS_NO"	    NUMBER                  ,
	"REVIEW_STAR"	NUMBER   		NOT NULL,
    FOREIGN KEY (CLASS_NO) REFERENCES CLASS (CLASS_NO) ON DELETE CASCADE,
    FOREIGN KEY (BOARD_NO) REFERENCES BOARD (BOARD_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN "REVIEW"."BOARD_NO" IS '게시글번호(시퀀스)';
COMMENT ON COLUMN "REVIEW"."CLASS_NO" IS '클래스 번호';
COMMENT ON COLUMN "REVIEW"."REVIEW_STAR" IS '수강후기 별점';

CREATE TABLE "HASHTAG" (
	"TAG_NO"	NUMBER		        PRIMARY KEY,
	"TAG_NAME"	VARCHAR2(100)		NOT NULL,
	"TAG_IMG"	VARCHAR2(100)		NULL,
	"BOARD_NO"	NUMBER		        NOT NULL,
    FOREIGN KEY (BOARD_NO) REFERENCES BOARD (BOARD_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN "HASHTAG"."TAG_NO" IS '태그 번호';
COMMENT ON COLUMN "HASHTAG"."TAG_NAME" IS '태그이름';
COMMENT ON COLUMN "HASHTAG"."TAG_IMG" IS '태그 이미지';
COMMENT ON COLUMN "HASHTAG"."BOARD_NO" IS '게시글번호(시퀀스)';


CREATE TABLE "STUDYBOARD" (
	"BOARD_NO"	        NUMBER		        PRIMARY KEY,
	"STUDY_NM"	        NUMBER	            DEFAULT 2	NOT NULL,
	"STUDY_START"	    DATE		        ,
	"STUDY_END"	        DATE		        ,
	"STUDY_TYPE"	    CHAR(1)	            DEFAULT 'N'	NOT NULL,
	"STUDY_ADDRESS" 	VARCHAR2(500)		NULL,
	"STUDY_STATUS"	    CHAR(1)	            DEFAULT 'N'	NOT NULL,
	"STUDY_COST"	    VARCHAR2(150)		,
	"STUDY_COMMUMITY"	VARCHAR2(150)		NOT NULL,
    FOREIGN KEY (BOARD_NO) REFERENCES BOARD (BOARD_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN "STUDYBOARD"."BOARD_NO" IS '게시글번호(시퀀스)';
COMMENT ON COLUMN "STUDYBOARD"."STUDY_NM" IS '모임인원';
COMMENT ON COLUMN "STUDYBOARD"."STUDY_START" IS '모임시작일(시간, 분까지 기입)';
COMMENT ON COLUMN "STUDYBOARD"."STUDY_END" IS '모임종료일(시간, 분까지 기입)';
COMMENT ON COLUMN "STUDYBOARD"."STUDY_TYPE" IS '오프라인(N) 온라인(Y)';
COMMENT ON COLUMN "STUDYBOARD"."STUDY_ADDRESS" IS '모임 상세 주소';
COMMENT ON COLUMN "STUDYBOARD"."STUDY_STATUS" IS '모집중(N) 모집 완료(Y)';
COMMENT ON COLUMN "STUDYBOARD"."STUDY_COST" IS '모임시 필요비용';
COMMENT ON COLUMN "STUDYBOARD"."STUDY_COMMUMITY" IS '연락방법 기입';

CREATE TABLE "THUMBS" (
	"BOARD_NO"	        NUMBER,
	"MEMBER_NO"	        NUMBER,
    PRIMARY KEY (BOARD_NO, MEMBER_NO),
    FOREIGN KEY (BOARD_NO) REFERENCES BOARD (BOARD_NO) ON DELETE CASCADE,
    FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN "THUMBS"."BOARD_NO" IS '게시글번호(시퀀스)';
COMMENT ON COLUMN "THUMBS"."MEMBER_NO" IS '회원번호(시퀀스)';

CREATE TABLE "CHATTING" (
	"CHAT_NO"	        NUMBER		    PRIMARY KEY,
	"CHAT_FROM"	        NUMBER		    NOT NULL,
	"CHAT_TO"	        NUMBER		    NOT NULL,
	"CHAT_MESSAGE"	    VARCHAR2(3000)	,
	"CHAT_TIMESTAMP"	DATE		    NOT NULL,
    FOREIGN KEY (CHAT_FROM) REFERENCES MEMBER (MEMBER_NO) ON DELETE CASCADE,
    FOREIGN KEY (CHAT_TO) REFERENCES MEMBER (MEMBER_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN "CHATTING"."CHAT_NO" IS '채팅방번호';
COMMENT ON COLUMN "CHATTING"."CHAT_FROM" IS '회원번호(시퀀스)';
COMMENT ON COLUMN "CHATTING"."CHAT_TO" IS '회원번호(시퀀스)';
COMMENT ON COLUMN "CHATTING"."CHAT_MESSAGE" IS '메시지';
COMMENT ON COLUMN "CHATTING"."CHAT_TIMESTAMP" IS '보낸시간';

CREATE TABLE "WONDER_BOARD" (
	"BOARD_NO"	        NUMBER		PRIMARY KEY,
	"QA_STATUS"	        CHAR(1)	    DEFAULT 'N'	NOT NULL,
	"WONDER_TYPE"	VARCHAR2(30)	NOT NULL,
    FOREIGN KEY (BOARD_NO) REFERENCES BOARD (BOARD_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN "WONDER_BOARD"."BOARD_NO" IS '게시글번호(시퀀스)';
COMMENT ON COLUMN "WONDER_BOARD"."QA_STATUS" IS '해결(Y)_미해결(N)';
COMMENT ON COLUMN "WONDER_BOARD"."WONDER_TYPE" IS '자유궁금증, 강의가궁금해요';



CREATE TABLE "WONDER_ANSWER" (
	"ANSWER_NO"	        NUMBER		        PRIMARY KEY,
	"ANSWER_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"ANSWER_ST"	        CHAR(1)	            DEFAULT 'N'	NOT NULL,
	"ANSWER_DT"	        DATE	            DEFAULT SYSDATE	NOT NULL,
	"BOARD_NO"	        NUMBER		        NOT NULL,
    FOREIGN KEY (BOARD_NO) REFERENCES BOARD (BOARD_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN "WONDER_ANSWER"."ANSWER_NO" IS '답변번호(시퀀스)';
COMMENT ON COLUMN "WONDER_ANSWER"."ANSWER_CONTENT" IS '답변내용';
COMMENT ON COLUMN "WONDER_ANSWER"."ANSWER_ST" IS '삭제Y 기본 N';
COMMENT ON COLUMN "WONDER_ANSWER"."ANSWER_DT" IS '답변작성일';
COMMENT ON COLUMN "WONDER_ANSWER"."BOARD_NO" IS '게시글번호(시퀀스)';

CREATE TABLE "REPORT" (
	"BOARD_NO"	        NUMBER		        NOT NULL,
	"MEMBER_NO"	        NUMBER		        NOT NULL,
	"REPORT_TYPE"	    VARCHAR2(200)		NOT NULL,
	"REPORT_CONTENT"	VARCHAR2(1000)		NOT NULL,
    "REPORT_DT"         DATE                DEFAULT SYSDATE NOT NULL,
    FOREIGN KEY (BOARD_NO) REFERENCES BOARD (BOARD_NO) ON DELETE CASCADE,
    FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN "REPORT"."BOARD_NO" IS '게시글번호(시퀀스)';
COMMENT ON COLUMN "REPORT"."MEMBER_NO" IS '회원번호(시퀀스)';
COMMENT ON COLUMN "REPORT"."REPORT_TYPE" IS '신고유형';
COMMENT ON COLUMN "REPORT"."REPORT_CONTENT" IS '신고내용';
COMMENT ON COLUMN "REPORT"."REPORT_DT" IS '신고날짜';

-- 시퀀스
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE;
CREATE SEQUENCE SEQ_BOARD_NO NOCACHE;
CREATE SEQUENCE SEQ_TAG_NO NOCACHE;
CREATE SEQUENCE SEQ_ANSWER_NO NOCACHE;
CREATE SEQUENCE SEQ_CLASS_NO NOCACHE;
CREATE SEQUENCE SEQ_CHAT_NO NOCACHE;
CREATE SEQUENCE SEQ_MAIN_NO NOCACHE;
CREATE SEQUENCE SEQ_SUB_NO NOCACHE;

commit;