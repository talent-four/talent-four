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
	"CLASS_INTRO"	CLOB		        NOT NULL,
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
	"QA_STATUS"	        CHAR(3)	    DEFAULT 'N'	NOT NULL,
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

-- 테이블 데이터, 시퀀스 DELETE
--BEGIN
--    FOR cur_rec IN (SELECT table_name FROM all_tables WHERE owner = 'SEMI') LOOP
--        EXECUTE IMMEDIATE 'DELETE FROM SEMI.' || cur_rec.table_name;
--    END LOOP;
--    FOR cur_seq IN (SELECT sequence_name FROM all_sequences WHERE sequence_owner = 'SEMI') LOOP
--        EXECUTE IMMEDIATE 'DROP SEQUENCE SEMI.' || cur_seq.sequence_name;
--    END LOOP;
--    COMMIT;
--END;
--/

-- 멤버 테이블 샘플 데이터 삽입(PL/SQL)
BEGIN
    FOR I IN 1..500 LOOP
    
    INSERT INTO MEMBER
    VALUES(SEQ_MEMBER_NO.NEXTVAL,
           'USER'||SEQ_MEMBER_NO.CURRVAL||'@naver.com',
           '홍길동'||SEQ_MEMBER_NO.CURRVAL,
           '123'||SEQ_MEMBER_NO.CURRVAL,
           DEFAULT, DEFAULT, DEFAULT, DEFAULT);
    END LOOP;
END;
/

-- 보드 타입
INSERT INTO BOARD_TYPE VALUES(1, '같이 공부해요');
INSERT INTO BOARD_TYPE VALUES(2, '수강후기');
INSERT INTO BOARD_TYPE VALUES(3, '궁금해요');

-- 튜터 테이블 샘플 데이터 삽입(PL/SQL)
BEGIN
    FOR I IN 100..150 LOOP
        INSERT INTO TUTOR
        VALUES(I,
               I||'의 학력 URL',
               '01012341234',
               I||'의 프로필 URL',
               I||'의 자기소개란입니다자기소개란입니다자기소개란입니다자기소개란입니다자기소개란입니다자기소개란입니다자기소개란입니다자기소개란입니다'
               );
               
        -- 멤버 테이블 튜터 전환 데이터 삽입(PL/SQL)
        UPDATE MEMBER SET MEMBER_ST = 2 WHERE MEMBER_NO = I;
    END LOOP;
END;
/

--카테고리 정보 삽입
INSERT INTO CATEGORY VALUES ('MAIN_'||SEQ_MAIN_NO.NEXTVAL, '개발·프로그래밍', NULL);
INSERT INTO CATEGORY VALUES ('MAIN_'||SEQ_MAIN_NO.NEXTVAL, '웹 개발', NULL);
INSERT INTO CATEGORY VALUES ('MAIN_'||SEQ_MAIN_NO.NEXTVAL, '게임 개발', NULL);
INSERT INTO CATEGORY VALUES ('MAIN_'||SEQ_MAIN_NO.NEXTVAL, '데이터 사이언스', NULL);
INSERT INTO CATEGORY VALUES ('MAIN_'||SEQ_MAIN_NO.NEXTVAL, '인공지능', null);

INSERT INTO CATEGORY VALUES ('SUB_'||SEQ_SUB_NO.NEXTVAL, '프로그래밍 언어', (SELECT CATEGORY_CODE FROM CATEGORY WHERE CATEGORY_NAME = '개발·프로그래밍'));
INSERT INTO CATEGORY VALUES ('SUB_'||SEQ_SUB_NO.NEXTVAL, '알고리즘', (SELECT CATEGORY_CODE FROM CATEGORY WHERE CATEGORY_NAME = '개발·프로그래밍'));
INSERT INTO CATEGORY VALUES ('SUB_'||SEQ_SUB_NO.NEXTVAL, '자료구조', (SELECT CATEGORY_CODE FROM CATEGORY WHERE CATEGORY_NAME = '개발·프로그래밍'));
INSERT INTO CATEGORY VALUES ('SUB_'||SEQ_SUB_NO.NEXTVAL, '데이터베이스', (SELECT CATEGORY_CODE FROM CATEGORY WHERE CATEGORY_NAME = '개발·프로그래밍'));
INSERT INTO CATEGORY VALUES ('SUB_'||SEQ_SUB_NO.NEXTVAL, '소프트웨어 테스트', (SELECT CATEGORY_CODE FROM CATEGORY WHERE CATEGORY_NAME = '개발·프로그래밍'));
INSERT INTO CATEGORY VALUES ('SUB_'||SEQ_SUB_NO.NEXTVAL, '개발 도구', (SELECT CATEGORY_CODE FROM CATEGORY WHERE CATEGORY_NAME = '개발·프로그래밍'));

INSERT INTO CATEGORY VALUES ('SUB_'||SEQ_SUB_NO.NEXTVAL, '프론트엔드', (SELECT CATEGORY_CODE FROM CATEGORY WHERE CATEGORY_NAME = '웹 개발'));
INSERT INTO CATEGORY VALUES ('SUB_'||SEQ_SUB_NO.NEXTVAL, '백엔드', (SELECT CATEGORY_CODE FROM CATEGORY WHERE CATEGORY_NAME = '웹 개발'));
INSERT INTO CATEGORY VALUES ('SUB_'||SEQ_SUB_NO.NEXTVAL, 'JavaScripit', (SELECT CATEGORY_CODE FROM CATEGORY WHERE CATEGORY_NAME = '웹 개발'));
INSERT INTO CATEGORY VALUES ('SUB_'||SEQ_SUB_NO.NEXTVAL, 'HTML/css', (SELECT CATEGORY_CODE FROM CATEGORY WHERE CATEGORY_NAME = '웹 개발'));
INSERT INTO CATEGORY VALUES ('SUB_'||SEQ_SUB_NO.NEXTVAL, 'React', (SELECT CATEGORY_CODE FROM CATEGORY WHERE CATEGORY_NAME = '웹 개발'));

INSERT INTO CATEGORY VALUES ('SUB_'||SEQ_SUB_NO.NEXTVAL, '게임 프로그래밍', (SELECT CATEGORY_CODE FROM CATEGORY WHERE CATEGORY_NAME = '게임 개발'));
INSERT INTO CATEGORY VALUES ('SUB_'||SEQ_SUB_NO.NEXTVAL, '게임 기획', (SELECT CATEGORY_CODE FROM CATEGORY WHERE CATEGORY_NAME = '게임 개발'));
INSERT INTO CATEGORY VALUES ('SUB_'||SEQ_SUB_NO.NEXTVAL, '게임 아트·그래픽', (SELECT CATEGORY_CODE FROM CATEGORY WHERE CATEGORY_NAME = '게임 개발'));
INSERT INTO CATEGORY VALUES ('SUB_'||SEQ_SUB_NO.NEXTVAL, '기타(게임 개발)', (SELECT CATEGORY_CODE FROM CATEGORY WHERE CATEGORY_NAME = '게임 개발'));

INSERT INTO CATEGORY VALUES ('SUB_'||SEQ_SUB_NO.NEXTVAL, '데이터 분석', (SELECT CATEGORY_CODE FROM CATEGORY WHERE CATEGORY_NAME = '데이터 사이언스'));
INSERT INTO CATEGORY VALUES ('SUB_'||SEQ_SUB_NO.NEXTVAL, '데이터 엔지니어링', (SELECT CATEGORY_CODE FROM CATEGORY WHERE CATEGORY_NAME = '데이터 사이언스'));
INSERT INTO CATEGORY VALUES ('SUB_'||SEQ_SUB_NO.NEXTVAL, '자격증(데이터 사이언스)', (SELECT CATEGORY_CODE FROM CATEGORY WHERE CATEGORY_NAME = '데이터 사이언스'));
INSERT INTO CATEGORY VALUES ('SUB_'||SEQ_SUB_NO.NEXTVAL, '기타(데이터 사이언스)', (SELECT CATEGORY_CODE FROM CATEGORY WHERE CATEGORY_NAME = '데이터 사이언스'));

INSERT INTO CATEGORY VALUES ('SUB_'||SEQ_SUB_NO.NEXTVAL, 'AI·ChatGPT 활용', (SELECT CATEGORY_CODE FROM CATEGORY WHERE CATEGORY_NAME = '인공지능'));
INSERT INTO CATEGORY VALUES ('SUB_'||SEQ_SUB_NO.NEXTVAL, '딥러닝·머신러닝', (SELECT CATEGORY_CODE FROM CATEGORY WHERE CATEGORY_NAME = '인공지능'));
INSERT INTO CATEGORY VALUES ('SUB_'||SEQ_SUB_NO.NEXTVAL, '컴퓨터 비전', (SELECT CATEGORY_CODE FROM CATEGORY WHERE CATEGORY_NAME = '인공지능'));
INSERT INTO CATEGORY VALUES ('SUB_'||SEQ_SUB_NO.NEXTVAL, '자연어 처리', (SELECT CATEGORY_CODE FROM CATEGORY WHERE CATEGORY_NAME = '인공지능'));
COMMIT;

-- 클래스 테이블 샘플 데이터 삽입(PL/SQL)
DECLARE
    randomClassNo NUMBER;
    randomTutorNo NUMBER;
    randomClassPrice NUMBER;
BEGIN
    FOR I IN 1..15 LOOP -- 카테고리 개수
        randomClassNo := TRUNC(DBMS_RANDOM.VALUE(10, 30));
        randomTutorNo := TRUNC(DBMS_RANDOM.VALUE(0, 51));
        
        FOR J IN 0..randomClassNo LOOP
            randomClassPrice := TRUNC(DBMS_RANDOM.VALUE(20000, 200000) / 100) * 100;
            INSERT INTO CLASS
            VALUES(SEQ_CLASS_NO.NEXTVAL,
                   SEQ_CLASS_NO.CURRVAL || '번째 클래스 강의',
                   SEQ_CLASS_NO.CURRVAL || '번째 클래스 강의 설명하는 텍스트.',
                    'PHOTO URL', NULL, SYSDATE, DEFAULT, randomClassPrice, 100+randomTutorNo, 'SUB_'||I);
        END LOOP;
    END LOOP;
END;
/

-- PAID
DECLARE
    classCount NUMBER;
    memberCount NUMBER;
    randomClassNo NUMBER;
    randomMemberNo NUMBER;
    paidCount NUMBER;
BEGIN
    SELECT COUNT(*) INTO classCount FROM CLASS;
    SELECT COUNT(*) INTO memberCount FROM MEMBER;
    
    FOR I IN 0..3 LOOP
        FOR J IN 0..memberCount LOOP
            randomClassNo := TRUNC(DBMS_RANDOM.VALUE(1, classCount));
            randomMemberNo := TRUNC(DBMS_RANDOM.VALUE(1, memberCount+1));
            paidCount := 0;
            
            SELECT COUNT(*)
            INTO paidCount
            FROM PAID
            WHERE MEMBER_NO = randomMemberNo
              AND CLASS_NO = randomClassNo;
            
            IF paidCount = 0 THEN
                INSERT INTO PAID
                VALUES(randomMemberNo, randomClassNo, '카드결제', DEFAULT, DEFAULT);
            END IF;
        END LOOP;
    END LOOP;
END;
/

-- COURSE
INSERT INTO COURSE (MEMBER_NO, CLASS_NO)
    SELECT MEMBER_NO, CLASS_NO
    FROM PAID ;

DECLARE
    v_long_text CLOB := '
초급자를 위해 준비한
[웹 개발, 백엔드] 강의입니다.
스프링의 원리부터 핵심 가치까지 단순히 스프링이 제공하는 기능을 배우고 사용하는 것은 어렵지 않습니다.
그런데 스프링이 제공하는 핵심 가치와 원리를 제대로 이해하고 사용하려면 큰 난관에 부딪힙니다.
왜냐하면 IoC(제어의 역전), DI(의존관계 주입) 같은 알듯말듯한 용어부터, SRP, OCP, DIP 같은 소위 SOLID라 불리는 좋은 객체 지향 설계의 원칙들도 함께 이해해야 비로소 스프링의 핵심 원리를 제대로 파악할 수 있기 때문입니다. 

스프링의 진정한 핵심 가치는 바로 객체 지향 프로그래밍(OOP)에 있습니다.
그리고 스프링을 제대로 이해하기 어려운 이유도 이 객체 지향 때문입니다.
다음 단계의 백엔드 개발자로 성장하려면, 스프링이 제공하는 핵심 가치와 원리를 반드시 깊이있게 이해해야 합니다.
이 강의는 스프링이 없던 20년 전으로 돌아가서 스프링이 왜 만들어졌는지 그 이유부터 시작합니다.
그리고 우리도 그때로 돌아가서 스프링 없는 순수한 자바 코드로 예제 애플리케이션을 만들어봅니다.
요구사항이 변경 됨에 따라 문제점들이 하나씩 발견되고, 그 문제를 해결하기 위해 좋은 객체 지향 원리들을 하나씩 코드에 적용하면서 문제를 해결해나갑니다.
이 과정속에서 여러분은 자연스럽게 코드로 좋은 객체지향의 원리(SOLID)와 IoC, DI에 대해서 이해하고, 또 스프링 컨테이너가 왜 필요한지 깨달을 수 있습니다.

스프링의 핵심 원리를 단순히 이론적으로 이해하는 것이 아니라, 예제 애플리케이션을 직접 코드로 개발하는 과정 속에서 자연스럽게 이해하게 됩니다.
강의 목차

1. 객체 지향 설계와 스프링
2. 스프링 핵심 원리 이해1 - 예제 만들기
3. 스프링 핵심 원리 이해2 - 객체 지향 원리 적용
4. 스프링 컨테이너와 스프링 빈
5. 싱글톤 컨테이너
6. 컴포넌트 스캔
7. 의존관계 자동 주입
8. 빈 생명주기 콜백
9. 빈 스코프

강의의 앞부분(1~3)은 이렇게 객체 지향과 스프링의 핵심 원리에 대해서 설명합니다.
그리고 이후 4. 스프링 컨테이너와 스프링 빈 부터는 스프링이 제공하는 핵심 기능들을 설명합니다.
각 핵심 기능들이 왜 만들어졌는지, 어디에 왜 필요한지, 그리고 가장 중요한 실무에서 어떤 방식으로 사용되는지, 이 부분에 초점을 맞추어 설명합니다.

그래서 스프링의 기능을 단순히 사용하는 단계를 넘어서, 실무에서 어떻게 활용하는 게 좋은 방법인지 제대로 이해하고 사용할 수 있습니다.

이 강의를 듣고 나면,
이 강의는 단순히 스프링 레퍼런스 문서에 있는 기능을 하나하나 설명하는 강의가 아닙니다. 기능을 넘어서 왜 스프링을 만들었고, 왜 스프링이 이런 기능을 제공하는지 그 이유와 핵심 원리에 대해서 설명하는 강의입니다.
강의가 끝나면 여러분은 스프링의 기본 기능을 잘 사용하는 것은 물론이고, 스프링의 본질에 대해서 깊이있는 이해를 하게 됩니다. 스프링의 본질을 이해한다는 것은 객체 지향 설계의 본질을 이해하는 것과 같습니다. 따라서 단순히 스프링의 기능만 사용하는 개발자에서 객체 지향 애플리케이션의 설계와 아키텍처 레벨까지 고민하는 개발자로 성장할 수 있습니다.

강의 대상

스프링을 처음
접하는 개발자

스프링 핵심 원리를 이해하고픈 개발자

객체지향 설계가 고민인 개발자


김영한 스프링 입문 수강생

스프링 핵심 원리 강의는 스프링을 처음 접하는 개발자부터, 실무에서 스프링을 사용하지만 스프링의 핵심 원리를 제대로 이해하고 사용하고 싶은 개발자 분들을 위해서 준비했습니다. 그리고 객체지향 설계에 고민이 많은 개발자 분들에게도 도움이 됩니다.

앞으로 이어질 스프링 완전 정복 시리즈
스프링을 완전히 마스터할 수 있는 시리즈를 준비하고 있습니다.
실제 실무에서 사용하는 핵심 스프링 기능을 중심으로, 실무에서 쓰이지 않거나 오래된 기능은 과감하게 생략한 실무 노하우를 전수해드릴 예정입니다.

강의 순서
스프링 입문 - 코드로 배우는 스프링 부트, 웹 MVC, DB 접근 기술 
스프링 핵심 원리 - 기본편  현재 강의 
모든 개발자를 위한 HTTP 웹 기본 지식 
스프링 MVC 1편 - 백엔드 웹 개발 핵심 기술
스프링 MVC 2편 - 백엔드 웹 개발 활용 기술
스프링 DB 1편 - 데이터 접근 핵심 원리
스프링 DB 2편 - 데이터 접근 활용 기술
스프링 핵심 원리 - 고급편
실전! 스프링 부트
';
BEGIN
    UPDATE CLASS 
    SET CLASS_NAME = '스프링 핵심 원리 - 기본편',
        CLASS_INTRO = v_long_text,
        CLASS_PHOTO = '/resources/img/classes/thumbnail/sample1.png',
        CATEGORY_CODE = 'SUB_8'
    WHERE CLASS_NO = 1;
END;
/

--댓글포함 강의가 궁금해요
-- 멤버1이 궁금해요전체 WONDER_ANSWER포함 SQL문입니다.(강의가 궁금해요)(자유 궁금증) 각500개
-- 댓글, hashTag

--댓글포함 강의가 궁금해요
DECLARE
    QA_STATUS VARCHAR2(10) := 'N';          -- Initialize variable
    WONDER_TYPE VARCHAR2(20) := '';         -- Initialize variable
BEGIN
    FOR I IN 1..500 LOOP
        -- Declare a variable to hold the new board number
        DECLARE
            v_board_no BOARD.BOARD_NO%TYPE;
            v_answer_no WONDER_ANSWER.ANSWER_NO%TYPE;
            v_tag_no NUMBER;
        BEGIN
            -- Generate a new board number
            v_board_no := SEQ_BOARD_NO.NEXTVAL;
            v_answer_no := SEQ_ANSWER_NO.NEXTVAL;

            -- Insert into BOARD table
            INSERT INTO BOARD (
                BOARD_NO,              
                BOARD_TITLE,                 
                BOARD_CONTENT,               
                CREATED_DT,                  
                UPDATE_DT,                  
                READ_COUNT,                  
                BOARD_ST,                  
                MEMBER_NO,                  
                BOARD_CD                   
            ) VALUES (
                v_board_no,
                'USER' || v_board_no || '의 게시글 제목',
                'USER' || v_board_no || '의 게시글 내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다',
                DEFAULT, DEFAULT, DEFAULT, DEFAULT, 1, 3
            );

            -- Insert into WONDER_BOARD table
            INSERT INTO WONDER_BOARD (
                BOARD_NO,              
                QA_STATUS,                
                WONDER_TYPE               
            ) VALUES (
                v_board_no,
                DEFAULT,
                WONDER_TYPE || '강의가 궁금해요'
            );

            -- Insert into WONDER_ANSWER table
            INSERT INTO WONDER_ANSWER (
                ANSWER_NO, ANSWER_CONTENT, ANSWER_ST, ANSWER_DT, BOARD_NO)
                VALUES (v_answer_no, 'USER' || v_answer_no || '의 댓글 내용입니다댓글 내용입니다댓글 내용입니다댓글 내용입니다댓글 내용입니다댓글 내용입니다댓글 내용입니다댓글 내용입니다',
                'N', SYSDATE,v_board_no);

            -- Insert multiple tags into HASHTAG table
            FOR tag IN (
                SELECT 'sql' AS tag_name FROM DUAL
                UNION ALL
                SELECT 'database' AS tag_name FROM DUAL
                UNION ALL
                SELECT 'plsql' AS tag_name FROM DUAL
                UNION ALL
                SELECT 'java' AS tag_name FROM DUAL
                UNION ALL
                SELECT 'python' AS tag_name FROM DUAL
                UNION ALL
                SELECT 'javascript' AS tag_name FROM DUAL
                UNION ALL
                SELECT 'html' AS tag_name FROM DUAL
                UNION ALL
                SELECT 'css' AS tag_name FROM DUAL
                UNION ALL
                SELECT 'csharp' AS tag_name FROM DUAL
                UNION ALL
                SELECT 'ruby' AS tag_name FROM DUAL
            ) LOOP
                v_tag_no := SEQ_TAG_NO.NEXTVAL;
                INSERT INTO HASHTAG (TAG_NO, TAG_NAME, TAG_IMG, BOARD_NO )
                VALUES (v_tag_no, tag.tag_name, NULL, v_board_no);
            END LOOP;
        END;
    END LOOP;
END;
/

--댓글포함 자유 궁금증
DECLARE
    QA_STATUS VARCHAR2(10) := '';          -- Initialize variable
    WONDER_TYPE VARCHAR2(20) := '';        -- Initialize variable
BEGIN
    FOR I IN 1..500 LOOP
        -- Declare a variable to hold the new board number
        DECLARE
            v_board_no BOARD.BOARD_NO%TYPE;
            v_answer_no WONDER_ANSWER.ANSWER_NO%TYPE;
            v_tag_no NUMBER;
        BEGIN
            -- Generate a new board number
            v_board_no := SEQ_BOARD_NO.NEXTVAL;
            v_answer_no := SEQ_ANSWER_NO.NEXTVAL;

            -- Insert into BOARD table
            INSERT INTO BOARD (
                BOARD_NO,              
                BOARD_TITLE,                 
                BOARD_CONTENT,               
                CREATED_DT,                  
                UPDATE_DT,                  
                READ_COUNT,                  
                BOARD_ST,                  
                MEMBER_NO,                  
                BOARD_CD                   
            ) VALUES (
                v_board_no,
                'USER' || v_board_no || '의 게시글 제목',
                'USER' || v_board_no || '의 게시글 내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다',
                DEFAULT, DEFAULT, DEFAULT, DEFAULT, 1, 3
            );

            -- Insert into WONDER_BOARD table
            INSERT INTO WONDER_BOARD (
                BOARD_NO,              
                QA_STATUS,                
                WONDER_TYPE               
            ) VALUES (
                v_board_no,
                QA_STATUS || 'N',
                WONDER_TYPE || '자유 궁금증'
            );

            -- Insert into WONDER_ANSWER table
            INSERT INTO WONDER_ANSWER (
                ANSWER_NO,
                ANSWER_CONTENT,
                ANSWER_ST,
                ANSWER_DT,
                BOARD_NO
            ) VALUES (
                v_answer_no,
                'USER' || v_answer_no || '의 댓글 내용입니다댓글 내용입니다댓글 내용입니다댓글 내용입니다댓글 내용입니다댓글 내용입니다댓글 내용입니다댓글 내용입니다',
                'N',
                SYSDATE,
                v_board_no
            );

            -- Insert multiple tags into HASHTAG table
            FOR tag IN (
                SELECT 'sql' AS tag_name FROM DUAL
                UNION ALL
                SELECT 'database' AS tag_name FROM DUAL
                UNION ALL
                SELECT 'plsql' AS tag_name FROM DUAL
                UNION ALL
                SELECT 'java' AS tag_name FROM DUAL
                UNION ALL
                SELECT 'python' AS tag_name FROM DUAL
                UNION ALL
                SELECT 'javascript' AS tag_name FROM DUAL
                UNION ALL
                SELECT 'html' AS tag_name FROM DUAL
                UNION ALL
                SELECT 'css' AS tag_name FROM DUAL
                UNION ALL
                SELECT 'csharp' AS tag_name FROM DUAL
                UNION ALL
                SELECT 'ruby' AS tag_name FROM DUAL
            ) LOOP
                v_tag_no := SEQ_TAG_NO.NEXTVAL;
                INSERT INTO HASHTAG (
                    TAG_NO,
                    TAG_NAME,
                    TAG_IMG,
                    BOARD_NO
                ) VALUES (
                    v_tag_no,
                    tag.tag_name,
                    NULL,
                    v_board_no
                );
            END LOOP;
        END;
    END LOOP;
END;
/


-- 신고하기 신고유형 :4가지 와이어프레임참조
-- BOARD_NO_SEQ 시퀀스 생성
CREATE SEQUENCE BOARD_NO_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- MEMBER_NO_SEQ 시퀀스 생성
CREATE SEQUENCE MEMBER_NO_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

INSERT INTO REPORT (BOARD_NO, MEMBER_NO, REPORT_TYPE, REPORT_CONTENT, REPORT_DT) VALUES 
(BOARD_NO_SEQ.NEXTVAL, MEMBER_NO_SEQ.NEXTVAL, '허위정보를 기재하였습니다', '이 게시물은 허위 정보를 포함하고 있습니다.', SYSDATE);

INSERT INTO REPORT (BOARD_NO, MEMBER_NO, REPORT_TYPE, REPORT_CONTENT, REPORT_DT) VALUES 
(BOARD_NO_SEQ.NEXTVAL, MEMBER_NO_SEQ.NEXTVAL, '부적절한 내용입니다', '이 게시물은 부적절한 내용을 포함하고 있습니다.', SYSDATE);

INSERT INTO REPORT (BOARD_NO, MEMBER_NO, REPORT_TYPE, REPORT_CONTENT, REPORT_DT) VALUES 
(BOARD_NO_SEQ.NEXTVAL, MEMBER_NO_SEQ.NEXTVAL, '욕설을 했습니다', '이 사용자가 욕설을 했습니다.', SYSDATE);

INSERT INTO REPORT (BOARD_NO, MEMBER_NO, REPORT_TYPE, REPORT_CONTENT, REPORT_DT) VALUES 
(BOARD_NO_SEQ.NEXTVAL, MEMBER_NO_SEQ.NEXTVAL, '기타', '기타 이유로 신고합니다.', SYSDATE);

INSERT INTO REPORT (BOARD_NO, MEMBER_NO, REPORT_TYPE, REPORT_CONTENT, REPORT_DT) VALUES 
(BOARD_NO_SEQ.NEXTVAL, MEMBER_NO_SEQ.NEXTVAL, '허위정보를 기재하였습니다', '이 게시물은 허위 정보를 포함하고 있습니다.', SYSDATE);

INSERT INTO REPORT (BOARD_NO, MEMBER_NO, REPORT_TYPE, REPORT_CONTENT, REPORT_DT) VALUES 
(BOARD_NO_SEQ.NEXTVAL, MEMBER_NO_SEQ.NEXTVAL, '부적절한 내용입니다', '이 게시물은 부적절한 내용을 포함하고 있습니다.', SYSDATE);

DECLARE
    boardCount NUMBER;
    memberCount NUMBER;
    randomBoardNo NUMBER;
    randomMemberNo NUMBER;
    dupleCheck NUMBER;
BEGIN
    -- 보드, 멤버 테이블의 총 개수 저장
    SELECT COUNT(*) INTO boardCount FROM BOARD;
    SELECT COUNT(*) INTO memberCount FROM MEMBER;
    
    -- 총 멤버수 만큼 반복
    FOR J IN 1..2000 LOOP
        -- 멤버 번호 랜덤으로, 보드 번호 랜덤으로
        randomBoardNo := TRUNC(DBMS_RANDOM.VALUE(1, boardCount));
        randomMemberNo := TRUNC(DBMS_RANDOM.VALUE(1, memberCount));
        -- 중복 확인용 변수
        dupleCheck := 0;
        
        -- THUMBS 테이블에 랜덤 번호가 이미 있을 경우, COUNT 1 이상 발생
        SELECT COUNT(*)
        INTO dupleCheck
        FROM THUMBS
        WHERE MEMBER_NO = randomMemberNo
          AND BOARD_NO = randomBoardNo;
        
        -- COUNT가 0일때만 INSERT
        IF dupleCheck = 0 THEN
            INSERT INTO THUMBS
            VALUES(randomBoardNo, randomMemberNo);
        END IF;
    END LOOP;
END;
/

-- 성현
-- 정산 테이블 데이터 삽입()
BEGIN
    FOR I IN 100..110 LOOP
    
    INSERT INTO SETTLE_ACCOUNT
    VALUES(I,
           '123114'||I,
           '국민은행',
           '홍길동'||(I-99)
           );
    END LOOP;
END;
/

BEGIN
    FOR I IN 111..120 LOOP
    
    INSERT INTO SETTLE_ACCOUNT
    VALUES(I,
           '85414'||I,
           '신한은행',
           '김재능'||(I-99)
           );
    END LOOP;
END;
/
BEGIN
    FOR I IN 121..129 LOOP
    
    INSERT INTO SETTLE_ACCOUNT
    VALUES(I,
           '7854'||I,
           'IBK기업은행',
           '소나기'||(I-99)
           );
    END LOOP;
END;
/
BEGIN
    FOR I IN 130..140 LOOP
    
    INSERT INTO SETTLE_ACCOUNT
    VALUES(I,
           '11952'||I,
           '하나은행',
           '이순신'||(I-99)
           );
    END LOOP;
END;
/
BEGIN
    FOR I IN 141..150 LOOP
    
    INSERT INTO SETTLE_ACCOUNT
    VALUES(I,
           '1753'||I,
           '우리은행',
           '곽재우'||(I-99)
           );
    END LOOP;
END;
/

-- 같이 공부해요 테이블 데이터 삽입
BEGIN
    FOR I IN 1..200 LOOP
        INSERT INTO BOARD (
            BOARD_NO, BOARD_TITLE, BOARD_CONTENT, CREATED_DT, UPDATE_DT, READ_COUNT, BOARD_ST, MEMBER_NO, BOARD_CD
        ) VALUES (
            SEQ_BOARD_NO.NEXTVAL,
            'USER'||SEQ_BOARD_NO.CURRVAL||'의 게시글 제목',
            'USER'||SEQ_BOARD_NO.CURRVAL||'의 게시글 내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다',
            DEFAULT, 
            DEFAULT, 
            DEFAULT, 
            DEFAULT, 
            TRUNC(DBMS_RANDOM.VALUE(1, (SELECT COUNT(*) FROM MEMBER))), 1
        );

        INSERT INTO STUDYBOARD (
            BOARD_NO, STUDY_NM, STUDY_START, STUDY_END, STUDY_TYPE, STUDY_ADDRESS, STUDY_STATUS, STUDY_COST, STUDY_COMMUMITY
        ) VALUES (
            SEQ_BOARD_NO.CURRVAL,
            TRUNC(DBMS_RANDOM.VALUE(2, 6)), -- STUDY_NM을 1에서 100 사이의 무작위 값으로 설정
            TRUNC(SYSDATE + DBMS_RANDOM.VALUE(1, 3)), -- STUDY_START를 현재 날짜로부터 1에서 3일 사이의 무작위 날짜로 설정
            TRUNC(SYSDATE + DBMS_RANDOM.VALUE(4, 11)), -- STUDY_END를 현재 날짜로부터 4에서 11일 사이의 무작위 날짜로 설정
            CASE WHEN DBMS_RANDOM.VALUE(0, 1) < 0.5 THEN 'N' ELSE 'Y' END, -- STUDY_TYPE의 기본값 설정
            NULL, -- STUDY_ADDRESS는 NULL로 설정
            CASE WHEN DBMS_RANDOM.VALUE(0, 1) < 0.5 THEN 'N' ELSE 'Y' END, -- STUDY_STATUS의 기본값 설정
            NULL, -- STUDY_COST는 NULL로 설정
            'KAKAOOPENTALK' -- STUDY_COMMUNITY를 '모집인원'으로 설정
        );
    END LOOP;
END;
/

-- 정산하기 테이블 데이터 삽입

INSERT INTO SETTLE (MEMBER_NO)
    SELECT DISTINCT C.MEMBER_NO
    FROM PAID P
    JOIN CLASS C ON P.CLASS_NO = C.CLASS_NO
    ORDER BY 1;
    
-- 100번 튜터 데이터 강제입력


UPDATE CLASS SET   
CLASS_NAME = '개발자를 위한 오픈소스 라이선스', 
CLASS_INTRO = '오픈소스,

걱정없이
사용하세요!
사용하시는 오픈소스의 라이선스 의무사항, 무엇인지 정확히 알고 사용하세요?
"개발하면서 오픈소스를 사용하신 적 있으신가요?"
"라이선스는 모르겠지만, 다른 패키지를 사용하신 적 있으신가요?"
"네. 요즘은 모든 모듈을 직접 개발하기보다는
이미 개발되어 있는 다양한 오픈소스를 활용하는 추세죠."
잠깐만요! 전 세계의 소스코드 중 오픈소스의 비율은 갈수록 커지고 있지만,
오픈소스의 라이선스를 지키지 못하면 국제적인 소송을 당할 수 있다는 것도 알고 계신가요?🧐
오픈소스 사용하고 있는데, 이렇게 써도 괜찮나 ... 싶으셨죠?
회사에서 혹은 학교나 학원에서
오픈소스를 사용하시면서 이런 생각 한 번쯤 해보셨을 거예요.
"오픈소스, 한 줄만 사용해도 고지를 해야 할까?"
"오픈소스를 셀 수 없이 많이 사용했는데, 어떻게 다 고지를 하지?"
"오픈소스 커뮤니티라는 말은 많이 듣는데, 실제로 그 의미가 뭘까?"
"회사에서 오픈소스를 사용하고 있는데, 어떤 제약 조건이 있진 않을까?"
오픈소스에 대한 궁금증과 불안, 저희가 해결해드릴게요!',
CLASS_PRICE = 25000, 
CLASS_PHOTO = '대입예정',
MEMBER_NO = 100
WHERE CLASS_NO = 100;

UPDATE MEMBER SET MEMBER_EMAIL ='tutor@naver.com',
MEMBER_NM ='재능', MEMBER_PW='pass01'
WHERE MEMBER_NO = 100;

-- 100번 튜터 데이터 입력 2
UPDATE TUTOR SET TUTOR_EDUCATION ='학력 경로 대입 예정',TUTOR_TEL='01015411235',
TUTOR_INTRODUCER = '재능 강사의 강사 소개명입니다.' WHERE MEMBER_NO =100;

UPDATE CLASS SET   
CLASS_NAME = '챗 GPT 전문가가 알려주는 AI 컨텐츠 자동화 가이드북', 
CLASS_INTRO = '더 이상
고민말고
장고하세요!
묶음 강의 말고 장고만 듣자!
배우고 싶은 건 장고뿐인데,
그동안 다른 강의까지 묶어 들어야 하는 비싼 패키지를 구매했나요?
이젠 탈잉에서 정말 필요한 클래스만 최저가로 수강하세요!
장고 프레임워크만으로 웹 개발 전반과 실무 프로젝트를 학습하세요.
약 3,000명의 튜티가 선택한 최신 강의!
강사의 화려한 경력이 곧 강의력은 아니지만,
지금까지 약 3,000명의 튜티를 가르친
강의력이 보장된 박순영 튜터를 만나보세요!
초보 개발자도 이해하기 쉽도록, 눈높이에 맞춰 친절하게 알려드려요.
빠르게 변하는 개발 트렌드에 맞춰 새롭게 완성된 가장 최신 강의로,
지금 이 순간 필요한 모든 정보를 담았어요.',
CLASS_PRICE = 30000, 
CLASS_PHOTO = '대입예정',
MEMBER_NO = 100
WHERE CLASS_NO = 101;

UPDATE CLASS SET   
CLASS_NAME = '지금 당작 써먹는 챗GPT 실무활용 필살기', 
CLASS_INTRO = '인스타에서 어떻게 광고하느냐에 따라 매출 수익이 달라진다는 사실을 알고 계셨나요? 재능쌤이 소개하는 매출 폭증하는 인스타 광고 비법!',
CLASS_PRICE = 27000, 
CLASS_PHOTO = '대입예정',
MEMBER_NO = 100
WHERE CLASS_NO = 102;

UPDATE CLASS SET   
CLASS_NAME = '캐글 런닝머신, 딥러닝 대회 부수기', 
CLASS_INTRO = '인스타에서 어떻게 광고하느냐에 따라 매출 수익이 달라진다는 사실을 알고 계셨나요? 재능쌤이 소개하는 매출 폭증하는 인스타 광고 비법!',
CLASS_PRICE = 40000, 
CLASS_PHOTO = '대입예정',
MEMBER_NO = 100,
CLASS_STATUS = 2
WHERE CLASS_NO = 103;

UPDATE CLASS SET   
CLASS_NAME = '만들면서 배우는 HTML-CSS입문', 
CLASS_INTRO = '인스타에서 어떻게 광고하느냐에 따라 매출 수익이 달라진다는 사실을 알고 계셨나요? 재능쌤이 소개하는 매출 폭증하는 인스타 광고 비법!',
CLASS_PRICE = 50000, 
CLASS_PHOTO = '대입예정',
MEMBER_NO = 100,
CLASS_STATUS = 2
WHERE CLASS_NO = 104;

-- 상위 5개만 변경
INSERT INTO PAID VALUES(94, 100, '카드결제', 'Y', DEFAULT);
INSERT INTO PAID VALUES(44, 100, '카드결제', 'Y', DEFAULT);
INSERT INTO PAID VALUES(74, 100, '카드결제', 'Y', DEFAULT);
INSERT INTO PAID VALUES(77, 101, '카드결제', 'Y', DEFAULT);
INSERT INTO PAID VALUES(1, 101, '카드결제', 'Y', DEFAULT);
INSERT INTO PAID VALUES(93, 101, '카드결제', 'Y', DEFAULT);
INSERT INTO PAID VALUES(125, 102, '카드결제', 'Y', DEFAULT);
INSERT INTO PAID VALUES(297, 102, '카드결제', 'Y', DEFAULT);
INSERT INTO PAID VALUES(314, 103, '카드결제', 'Y', DEFAULT);
INSERT INTO PAID VALUES(248, 103, '카드결제', 'Y', DEFAULT);
INSERT INTO PAID VALUES(76, 103, '카드결제', 'Y', DEFAULT);
INSERT INTO PAID VALUES(141, 104, '카드결제', 'Y', DEFAULT);
INSERT INTO PAID VALUES(115, 104, '카드결제', 'Y', DEFAULT);
INSERT INTO PAID VALUES(205, 104, '카드결제', 'Y', DEFAULT);
INSERT INTO PAID VALUES(332, 104, '카드결제', 'Y', DEFAULT);
INSERT INTO PAID VALUES(185, 104, '카드결제', 'Y', DEFAULT);


-- 리뷰
DECLARE
    randomClassNo NUMBER;   
BEGIN
    SELECT COUNT(*) INTO randomClassNo FROM CLASS;
    
    FOR j IN 1..3 LOOP  -- 외부 루프 추가 (3번 반복)
        FOR i IN 1..500 LOOP
            INSERT INTO BOARD
            VALUES(SEQ_BOARD_NO.NEXTVAL,
                'USER' || i || '의 리뷰 제목',
                'USER' || i || '의 리뷰 내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다',
                DEFAULT, DEFAULT, DEFAULT, DEFAULT, i, 3);
        
            INSERT INTO REVIEW (BOARD_NO, CLASS_NO, REVIEW_STAR)
            VALUES (
                SEQ_BOARD_NO.CURRVAL,
                TRUNC(DBMS_RANDOM.VALUE(1, randomClassNo)), -- 클래스 번호 1~클래스 넘버까지 랜덤 / 우선 400개로 입력
                TRUNC(DBMS_RANDOM.VALUE(0, 6))  -- 별점 1~5까지 랜덤  
            );
        END LOOP;
    END LOOP;
 
END;
/

-- thumbs값 생성
DECLARE
    TYPE MEMBER_NO_ARRAY IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    v_member_nos MEMBER_NO_ARRAY;
    v_total_members CONSTANT PLS_INTEGER := 500;
    v_random_index PLS_INTEGER;
    v_temp NUMBER;
    v_current_index PLS_INTEGER := 1;
BEGIN
    -- 1부터 500까지의 MEMBER_NO 값을 배열에 저장
    FOR i IN 1..v_total_members LOOP
        v_member_nos(i) := i;
    END LOOP;

    -- Fisher-Yates shuffle 알고리즘을 사용하여 배열을 섞음
    FOR i IN REVERSE 2..v_total_members LOOP
        v_random_index := TRUNC(DBMS_RANDOM.VALUE(1, i+1));
        v_temp := v_member_nos(i);
        v_member_nos(i) := v_member_nos(v_random_index);
        v_member_nos(v_random_index) := v_temp;
    END LOOP;

    -- BOARD_NO를 1부터 200까지 반복하며 MEMBER_NO를 중복 없이 삽입
    FOR board_no IN 401..600 LOOP
        FOR j IN 1..3 LOOP
            BEGIN
                IF v_current_index <= v_total_members THEN
                    INSERT INTO THUMBS (BOARD_NO, MEMBER_NO)
                    VALUES (board_no, v_member_nos(v_current_index));
                    v_current_index := v_current_index + 1;
                ELSE
                    EXIT; -- 더 이상 삽입할 MEMBER_NO가 없으면 종료
                END IF;
            EXCEPTION
                WHEN OTHERS THEN
                    -- 예외가 발생한 경우 현재까지의 트랜잭션을 커밋하고 종료
                    COMMIT;
                    RAISE_APPLICATION_ERROR(-20001, '제약 조건 오류 발생. 현재까지의 데이터는 커밋되었습니다.');
            END;
        END LOOP;
    END LOOP;

    -- 모든 작업이 성공적으로 완료되면 커밋
    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        -- 예외가 발생한 경우 트랜잭션을 롤백
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('오류 발생: ' || SQLERRM);
END;
/

COMMIT;