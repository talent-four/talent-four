-- 테이블 데이터 DELETE
BEGIN
    FOR cur_rec IN (SELECT table_name FROM all_tables WHERE owner = 'SEMI') LOOP
        EXECUTE IMMEDIATE 'DELETE FROM SEMI.' || cur_rec.table_name;
    END LOOP;
    FOR cur_seq IN (SELECT sequence_name FROM all_sequences WHERE sequence_owner = 'SEMI') LOOP
        EXECUTE IMMEDIATE 'DROP SEQUENCE SEMI.' || cur_seq.sequence_name;
    END LOOP;
    COMMIT;
END;
/

-- 시퀀스
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE;
CREATE SEQUENCE SEQ_BOARD_NO NOCACHE;
CREATE SEQUENCE SEQ_TAG_NO NOCACHE;
CREATE SEQUENCE SEQ_ANSWER_NO NOCACHE;
CREATE SEQUENCE SEQ_CLASS_NO NOCACHE;
CREATE SEQUENCE SEQ_CHAT_NO NOCACHE;
CREATE SEQUENCE SEQ_MAIN_NO NOCACHE;
CREATE SEQUENCE SEQ_SUB_NO NOCACHE;



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
INSERT INTO BOARD_TYPE VALUES(1, '클래스');
INSERT INTO BOARD_TYPE VALUES(2, '같이 공부해요');
INSERT INTO BOARD_TYPE VALUES(3, '수강후기');
INSERT INTO BOARD_TYPE VALUES(4, '궁금해요');

-- 보드 테이블 샘플 데이터 삽입(PL/SQL)
BEGIN
    FOR I IN 1..200 LOOP
    
    INSERT INTO BOARD
    VALUES(SEQ_BOARD_NO.NEXTVAL,
           'USER'||SEQ_BOARD_NO.CURRVAL||'의 게시글 제목',
           'USER'||SEQ_BOARD_NO.CURRVAL||'의 게시글 내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다',
           DEFAULT, DEFAULT, DEFAULT, DEFAULT, I, 1);
    END LOOP;
END;
/
-- 보드 테이블 샘플 데이터 삽입(PL/SQL)
BEGIN
    FOR I IN 1..200 LOOP
    
    INSERT INTO BOARD
    VALUES(SEQ_BOARD_NO.NEXTVAL,
           'USER'||SEQ_BOARD_NO.CURRVAL||'의 게시글 제목',
           'USER'||SEQ_BOARD_NO.CURRVAL||'의 게시글 내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다',
           DEFAULT, DEFAULT, DEFAULT, DEFAULT, I, 2);
    END LOOP;
END;
/

BEGIN
    FOR I IN 1..200 LOOP
    
    INSERT INTO BOARD
    VALUES(SEQ_BOARD_NO.NEXTVAL,
           'USER'||SEQ_BOARD_NO.CURRVAL||'의 게시글 제목',
           'USER'||SEQ_BOARD_NO.CURRVAL||'의 게시글 내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다',
           DEFAULT, DEFAULT, DEFAULT, DEFAULT, I, 3);
    END LOOP;
END;
/

-- 궁금해요 게시판 


-- 용량이 적어서 VARCHAR2(3)으로 변경합니다. 같이 돌려주세요.
--DECLARE 뭔진 모르겠지만 같이 돌려주세요... 
-- 멤버1일 궁금해요전체 작성합니다.

ALTER TABLE WONDER_BOARD
MODIFY QA_STATUS VARCHAR2(3);
DECLARE
    QA_STATUS VARCHAR2(10) := 'QA';          -- Initialize variable
    WONDER_TYPE VARCHAR2(20) := 'Type1';     -- Initialize variable
BEGIN
    FOR I IN 1..500 LOOP
        -- Declare a variable to hold the new board number
        DECLARE
            v_board_no BOARD.BOARD_NO%TYPE;
        BEGIN
            -- Generate a new board number
            v_board_no := SEQ_BOARD_NO.NEXTVAL;

            -- Insert into BOARD table
            INSERT INTO BOARD (
                BOARD_NO,              -- Replace with actual column names
                BOARD_TITLE,                 -- Replace with actual column names
                BOARD_CONTENT,               -- Replace with actual column names
                CREATED_DT,                  -- Replace with actual column names
                UPDATE_DT,                  -- Replace with actual column names
                READ_COUNT,                  -- Replace with actual column names
                BOARD_ST,                  -- Replace with actual column names
                MEMBER_NO,                  -- Replace with actual column names
                BOARD_CD                   -- Replace with actual column names
            ) VALUES (
                v_board_no,
                'USER' || v_board_no || '의 게시글 제목',
                'USER' || v_board_no || '의 게시글 내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다',
                DEFAULT, DEFAULT, DEFAULT, DEFAULT, 1, 4
            );

            -- Insert into WONDER_BOARD table
            INSERT INTO WONDER_BOARD (
                BOARD_NO,              -- Replace with actual column names
                QA_STATUS,                -- Replace with actual column names
                WONDER_TYPE               -- Replace with actual column names
            ) VALUES (
                v_board_no,
                QA_STATUS || 'N',
                WONDER_TYPE || '강의가 궁금해요'
            );
        END;
    END LOOP;
END;
/

DECLARE
    QA_STATUS VARCHAR2(10) := 'QA';          -- Initialize variable
    WONDER_TYPE VARCHAR2(20) := 'Type1';
BEGIN
    FOR I IN 1..500 LOOP
        -- Declare a variable to hold the new board number
        DECLARE
            v_board_no BOARD.BOARD_NO%TYPE;
        BEGIN
            -- Generate a new board number
            v_board_no := SEQ_BOARD_NO.NEXTVAL;

            -- Insert into BOARD table
            INSERT INTO BOARD (
                BOARD_NO,              -- Replace with actual column names
                BOARD_TITLE,                 -- Replace with actual column names
                BOARD_CONTENT,               -- Replace with actual column names
                CREATED_DT,                  -- Replace with actual column names
                UPDATE_DT,                  -- Replace with actual column names
                READ_COUNT,                  -- Replace with actual column names
                BOARD_ST,                  -- Replace with actual column names
                MEMBER_NO,                  -- Replace with actual column names
                BOARD_CD                   -- Replace with actual column names
            ) VALUES (
                v_board_no,
                'USER' || v_board_no || '의 게시글 제목',
                'USER' || v_board_no || '의 게시글 내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다',
                DEFAULT, DEFAULT, DEFAULT, DEFAULT, 1, 4
            );

            -- Insert into WONDER_BOARD table
            INSERT INTO WONDER_BOARD (
                BOARD_NO,              -- Replace with actual column names
                QA_STATUS,                -- Replace with actual column names
                WONDER_TYPE               -- Replace with actual column names
            ) VALUES (
                v_board_no,
                QA_STATUS || 'N',
                WONDER_TYPE || '자유궁금증'
            );
        END;
    END LOOP;
END;
/

-- 궁금하기 답변  멤버1이 댓글씁니다.





    

select count(*) from member;

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
    END LOOP;
END;
/
-- 멤버 테이블 튜터 전환 데이터 삽입(PL/SQL)
BEGIN
    FOR I IN 100..150 LOOP
    
    UPDATE MEMBER SET 
    MEMBER_ST = 2 WHERE MEMBER_NO = I;
    
    END LOOP;
END;
/

-- 리뷰 테이블 샘플 데이터 삽입(PL/SQL)
DECLARE
    v_board_no NUMBER;
    v_review_star NUMBER;
BEGIN
    FOR i IN 1..5000 LOOP
        -- Generate random board_no (1 to 302)
        v_board_no := TRUNC(DBMS_RANDOM.VALUE(1, 303));
        
        -- Generate random review_star (1 to 5)
        v_review_star := TRUNC(DBMS_RANDOM.VALUE(1, 6));
        
        -- Insert random data into review table
        INSERT INTO REVIEW (BOARD_NO, REIVEW_STAR)
        VALUES (v_board_no, v_review_star);
    END LOOP;
    
    COMMIT; -- Commit the transaction
END;
/





-- 튜터 세부정보 삽입
INSERT INTO TUTOR VALUES (2, 'KH대학', 01012345678, '프로필입니다', '소개입니다', 1);



SELECT * FROM CATEGORY;
SELECT CATEGORY_NAME FROM CATEGORY
WHERE PARENT_ID IS NULL
ORDER BY CATEGORY_CODE;




-- 보드 테이블 샘플 데이터 삽입(PL/SQL)
BEGIN
    FOR I IN 1..200 LOOP
    
    INSERT INTO BOARD
    VALUES(SEQ_BOARD_NO.NEXTVAL,
           SEQ_BOARD_NO.CURRVAL || '번째 게시글 제목',
           SEQ_BOARD_NO.CURRVAL || '번째 게시글 내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다.',
            SYSDATE,SYSDATE,DEFAULT,1, 6, 2);
    END LOOP;
END;
/

-- 클래스 테이블 샘플 데이터 삽입(PL/SQL)
BEGIN
    FOR I IN 1..20 LOOP
    
    INSERT INTO CLASS
    VALUES(SEQ_CLASS_NO.NEXTVAL,
           SEQ_CLASS_NO.CURRVAL || '번째 클래스 강의',
           SEQ_CLASS_NO.CURRVAL || '번째 클래스 강의 설명하는 텍스트.',
            'DEFAULT', NULL, SYSDATE, 1, 43200*SEQ_CLASS_NO.CURRVAL, 1, 'SUB_13');
    END LOOP;
END;
/

-- 리뷰 테이블 샘플 데이터 삽입(PL/SQL)
DECLARE
    v_board_no NUMBER;
    v_review_star NUMBER;
BEGIN
    FOR i IN 1..5000 LOOP
        -- Generate random board_no (1 to 302)
        v_board_no := TRUNC(DBMS_RANDOM.VALUE(1, 303));
        
        -- Generate random review_star (1 to 5)
        v_review_star := TRUNC(DBMS_RANDOM.VALUE(1, 6));
        
        -- Insert random data into review table
        INSERT INTO REVIEW (BOARD_NO, REIVEW_STAR)
        VALUES (v_board_no, v_review_star);
    END LOOP;
    
    COMMIT; -- Commit the transaction
END;
/

--카테고리 정보 삽입
-- 대분류 삽입 SQL
-- INSERT INTO CATEGORY VALUES ('MAIN_'||CATEGORY_MAIN_SEQ.NEXTVAL, '개발·프로그래밍', NULL);
INSERT INTO CATEGORY VALUES ('MAIN_'||CATEGORY_MAIN_SEQ.NEXTVAL, '개발·프로그래밍', NULL);
INSERT INTO CATEGORY VALUES ('MAIN_'||CATEGORY_MAIN_SEQ.NEXTVAL, '웹 개발', NULL);
INSERT INTO CATEGORY VALUES ('MAIN_'||CATEGORY_MAIN_SEQ.NEXTVAL, '게임 개발', NULL);
INSERT INTO CATEGORY VALUES ('MAIN_'||CATEGORY_MAIN_SEQ.NEXTVAL, '데이터 사이언스', NULL);
INSERT INTO CATEGORY VALUES ('MAIN_'||CATEGORY_MAIN_SEQ.NEXTVAL, '인공지능', null);

-- 소분류 삽입 SQL
-- INSERT INTO CATEGORY VALUES ('SUB_'||CATEGORY_SUB_SEQ.NEXTVAL, '웹 개발', (SELECT CATEGORY_CODE FROM CATEGORY WHERE CATEGORY_NAME = '개발·프로그래밍'));
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


-- 클래스 생성
INSERT INTO CLASS VALUES (SEQ_CLASS_NO.NEXTVAL, '테스트 강의1', '강의 설명', 'DEFAULT', 'URL' , SYSDATE, 1, 29900, 2, 'SUB_1');
INSERT INTO CLASS VALUES (SEQ_CLASS_NO.NEXTVAL, '테스트 강의2', '강의 설명', 'DEFAULT', 'URL' , SYSDATE, 1, 39900, 2, 'SUB_6');


COMMIT;

SELECT * FROM CLASS;

SELECT *
FROM CLASS
JOIN MEMBER USING (MEMBER_NO);
WHERE CATEGORY_CODE = 'SUB_1';

COMMIT;

-- 1번 회원이 1번 테스트강의 결제
INSERT INTO PAID VALUES (1, 1, '무통장입금' , 'Y' , SYSDATE);





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

INSERT INTO HASHTAG VALUES (SEQ_HASHTAG_NO.NEXTVAL, '강사님이 친절해요', NULL, 1);
INSERT INTO HASHTAG VALUES (SEQ_HASHTAG_NO.NEXTVAL, '재밌어요', NULL, 1);
INSERT INTO HASHTAG VALUES (SEQ_HASHTAG_NO.NEXTVAL, '시간가는줄 몰라요', NULL, 1);
INSERT INTO HASHTAG VALUES (SEQ_HASHTAG_NO.NEXTVAL, '가격대비 최고', NULL, 1);
INSERT INTO HASHTAG VALUES (SEQ_HASHTAG_NO.NEXTVAL, '또 들을 예정', NULL, 1);
INSERT INTO HASHTAG VALUES (SEQ_HASHTAG_NO.NEXTVAL, '강사님이 친절해요', NULL, 1);
