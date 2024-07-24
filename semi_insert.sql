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
BEGIN
    FOR I IN 1..500 LOOP
    
    INSERT INTO BOARD
    VALUES(SEQ_BOARD_NO.NEXTVAL,
           'USER'||SEQ_BOARD_NO.CURRVAL||'의 게시글 제목',
           'USER'||SEQ_BOARD_NO.CURRVAL||'의 게시글 내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다',
           DEFAULT, DEFAULT, DEFAULT, DEFAULT, I, 4);
    END LOOP;
END;
/

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
---------------------------------------------------------------------------

-- 성현
-- 정산 테이블 데이터 삽입()
BEGIN
    FOR I IN 1..51 LOOP
    
    INSERT INTO SETTLE
    VALUES(I,
           I||'의 학력 URL',
           '01012341234',
           I||'의 프로필 URL',
           I||'의 자기소개란입니다자기소개란입니다자기소개란입니다자기소개란입니다자기소개란입니다자기소개란입니다자기소개란입니다자기소개란입니다'
           );
    END LOOP;
END;
/









