/* 2022 01 06 webdb guestbook 테이블 만들기 */


--테이블 상태 확인
select * from guestbook;

--테이블 삭제 초기화
drop table guestbook;

--id 번호 자동생성 꼬일때 초기화 (리셋)
drop SEQUENCE seq_guestbook_id; 

-- 모든 정보 보기 (카디전 고려할 것)
SELECT *
FROM guestbook
;


--시퀀스 조회
SELECT * FROM USER_SEQUENCES;


--방명록 guestbook 테이블 만들기
create table    guestbook (
                no number(10), --식별번호
                name varchar2(80), --이름
                password varchar2(20), --비밀번호
                content varchar2(2000), --본문 
                reg_date date, --등록일                
                primary key (no) --프라이머리 키 지정
);


-- 저자 id번호 자동생성을 위한 시퀀스 sequence
create sequence seq_guestbook_id
increment by 1
START WITH 1
nocache
;


--방명록 정보 입력해보기 (자동생성id, 이름, 암호, 본문, 등록일)
INSERT INTO guestbook VALUES (seq_guestbook_id.nextval, '홍길동', '1234', '와봤습니다', sysdate);

INSERT INTO guestbook VALUES (seq_guestbook_id.nextval, '머스크', '1234', '화성갈꺼니까', sysdate);

INSERT INTO guestbook VALUES (seq_guestbook_id.nextval, '주커버그', '1234', '페이스북이 낫나요 메타가 낫나요', sysdate);



-- 수정기능 (id n번)의 데이터를 변경
UPDATE guestbook
SET name = '홍길동'
WHERE no = 2 ;


-- 테이블에서 (id n번) 데이터를 삭제해 보세요
TRUNCATE TABLE guestbook WHERE no = 2;

DELETE FROM guestbook WHERE no = 1 ;


--커밋 
commit;

--롤백
rollback;




select * from guestbook;

select  no
        ,name
        ,password
        ,content
        ,to_char(reg_date, 'yyyy-mm-dd hh:mi:ss') regDate
from guestbook
where no = 1;

order by regDate desc
;

