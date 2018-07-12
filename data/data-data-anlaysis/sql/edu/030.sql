insert into ted_dummy
select * 
  from (
        select 1, '01'  from dual union
        select 2, '02'  from dual union
        select 3, '03'  from dual union
        select 4, '04'  from dual union
        select 5, '05'  from dual union
        select 6, '06'  from dual union
        select 7, '07'  from dual union
        select 8, '08'  from dual union
        select 9, '09'  from dual union
        select 10, '10'  from dual
       )
;
------------------------------------------------------------------------------
insert into ted_student(student_no, student_nm, ent_date, grade_class_no)
select * 
  from (
        select 'A001', '홍길동', sysdate, '0101' from dual union
        select 'A002', '나영희', sysdate, '0101' from dual union
        select 'A003', '김철수', sysdate, '0101' from dual union
        select 'A004', '박만영', sysdate, '0101' from dual union
        select 'A005', '최진사', sysdate, '0101' from dual union
        select 'A006', '김진사', sysdate, '0101' from dual union
        select 'A007', '박이슬', sysdate, '0101' from dual union
        select 'A008', '조햇살', sysdate, '0101' from dual union
        select 'A009', '이아침', sysdate, '0101' from dual union
        select 'A010', '자명종', sysdate, '0101' from dual union
        
        select 'A011', '유비', sysdate, '0201' from dual union
        select 'A012', '제갈량', sysdate, '0201' from dual union
        select 'A013', '신호영', sysdate, '0201' from dual union
        select 'A014', '장비', sysdate, '0201' from dual union
        select 'A015', '조조', sysdate, '0201' from dual union
        select 'A016', '박가영', sysdate, '0201' from dual union
        select 'A017', '흥부', sysdate, '0201' from dual union
        select 'A018', '놀부', sysdate, '0201' from dual union
        select 'A019', '신태양', sysdate, '0201' from dual union
        select 'A020', '이우주', sysdate, '0201' from dual union
        select 'A099', '마동석', sysdate, '0201' from dual union
        
        select 'A021', '김태양', sysdate, '0301' from dual union
        select 'A022', '이목성', sysdate, '0301' from dual union
        select 'A023', '벽창호', sysdate, '0301' from dual union
        select 'A024', '지종원', sysdate, '0301' from dual union
        select 'A025', '이수만', sysdate, '0301' from dual union
        select 'A026', '박장군', sysdate, '0301' from dual union
        select 'A027', '이장군', sysdate, '0301' from dual union
        select 'A028', '대장군', sysdate, '0301' from dual union
        select 'A029', '유명한', sysdate, '0301' from dual union
        select 'A030', '홍길동', sysdate, '0301' from dual union
        
        select 'A031', '소지섭', sysdate, '0302' from dual union
        select 'A032', '소율', sysdate, '0302' from dual union
        select 'A033', '신사동', sysdate, '0302' from dual union
        select 'A034', '양동이', sysdate, '0302' from dual union
        select 'A035', '신태양', sysdate, '0302' from dual union
        select 'A036', '한가한', sysdate, '0302' from dual union
        select 'A037', '이하나', sysdate, '0302' from dual union
        select 'A038', '이둘이', sysdate, '0302' from dual union
        select 'A039', '차돌이', sysdate, '0302' from dual union
        select 'A040', '양태수', sysdate, '0302' from dual union
        select 'A092', '전망대', sysdate, '0302' from dual union 
        
        select 'A041', '홍길동', sysdate, '0102' from dual union
        select 'A042', '곽지만', sysdate, '0102' from dual union
        select 'A043', '이기자', sysdate, '0102' from dual union
        select 'A044', '박기자', sysdate, '0102' from dual union
        select 'A045', '최시언', sysdate, '0102' from dual union
        select 'A046', '임꺽정', sysdate, '0102' from dual union
        select 'A047', '신해와달', sysdate, '0102' from dual union
        select 'A048', '마홍수', sysdate, '0102' from dual union
        select 'A049', '유태풍', sysdate, '0102' from dual union
        select 'A050', '무지개', sysdate, '0102' from dual union
        select 'A093', '신서문', sysdate, '0102' from dual union
        select 'A094', '한마당', sysdate, '0102' from dual union
        select 'A095', '전천후', sysdate, '0102' from dual union
        
        select 'A051', '김춘추', sysdate, '0202' from dual union
        select 'A052', '김유신', sysdate, '0202' from dual union
        select 'A053', '강감찬', sysdate, '0202' from dual union
        select 'A054', '백가영', sysdate, '0202' from dual union
        select 'A055', '나좋아', sysdate, '0202' from dual union
        select 'A056', '반가워', sysdate, '0202' from dual union
        select 'A057', '야생마', sysdate, '0202' from dual union
        select 'A058', '주원장', sysdate, '0202' from dual union
        select 'A059', '양동철', sysdate, '0202' from dual union
        select 'A060', '안마기', sysdate, '0202' from dual union
        select 'A091', '신호등', sysdate, '0202' from dual 
       )
;
------------------------------------------------------------------------------
insert into ted_score(student_no, year_mon)
select student_no
     , '2017/07' 
  from ted_student
;

update ted_score
   set kor  = rownum + 31
     , eng  = rownum + 25
     , math = rownum + 15
;

insert into ted_score
select student_no
     , '2017/08' 
     , kor - 1
     , eng + 1
     , math + 3
  from ted_score
;

insert into ted_score
select student_no
     , '2017/06' 
     , kor - 2
     , eng + 3
     , math + 4
  from ted_score
  where year_mon = '2017/07'
;

update ted_score
   set kor  = null
     , eng  = null
     , math = null
 where rownum in (1, 10, 40)
;

update ted_score
   set kor  = null
     , eng  = null
     , math = null
 where rownum in (1, 10, 40)
;

 update ted_score
    set (kor, eng, math) =  (select kor, eng, math from ted_score where student_no = 'A009' and year_mon = '2017/07')
  where student_no = 'A008'
    and year_mon = '2017/07'   
;
------------------------------------------------------------------------------
insert into ted_region 
select * 
  from (
        select 1, '서울' from dual union
        select 2, '부산' from dual union
        select 3, '인천' from dual union
        select 4, '대전' from dual union
        select 5, '광주' from dual union
        select 6, '대구' from dual union
        select 7, '울산' from dual union
        select 8, '평창' from dual union
        select 9, '제주도' from dual union
        select 10, '울릉도' from dual 
       )
;

update ted_student
   set region_id = mod(rownum, 10)+1
;

update ted_student
   set region_id = null
 where region_id =10
;
-------------------------------------------------------------------------------
insert into ted_account 
select * 
  from (
        select 1, '재료비' from dual union
        select 2, '노무비' from dual union
        select 3, '외주비' from dual union
        select 4, '장비비'  from dual union
        select 5, '급료' from dual union
        select 6, '퇴직금' from dual union
        select 7, '복리후생비' from dual union
        select 8, '안전관리' from dual union
        select 9, '차량유지비' from dual union
        select 10, '소모품비' from dual union
        select 11, '기술개발비' from dual union
        select 12, '여비교통비' from dual union
        select 13, '통신비' from dual union 
        select 14, '수도광열비' from dual union
        select 15, '지급임차료' from dual union
        select 16, '감가상각비' from dual union
        select 17, '보험료' from dual union 
        select 18, '접대비' from dual union
        select 19, '지급수수료' from dual union
        select 20, '광고선전비' from dual 
       )
;

commit;
-------------------------------------------------------------------------------
insert into ted_cost
select '2017/07'
     , seq_ed_cost.nextval
     , a.acct_id
     , 2300 * rownum
  from ted_account a
     , ted_dummy b
;
commit;

insert into ted_cost
select '2017/07'
     , seq_ed_cost.nextval
     , a.acct_id
     , round(a.cost * 0.5) * (mod(rownum, 10)+1)
  from ted_cost a
     , ted_dummy b
     , ted_dummy c
;
commit;

insert into ted_cost
select to_char(2018 - c.numval) || '/06'
     , seq_ed_cost.nextval
     , a.acct_id
     , round(a.cost * 0.2) * (mod(rownum, 100)+1)
  from ted_cost a
     , ted_dummy b
     , ted_dummy c
 where b.numval <= 2     
;
commit;

insert into ted_cost
select '2017/08'
     , seq_ed_cost.nextval
     , a.acct_id
     , round(a.cost * 0.2) * (mod(rownum, 100)+1)
  from ted_cost a
 where year_mon like '____/06' 

;
commit;

insert into ted_cost
select substr(a.year_mon,1,4) || '/05'
     , seq_ed_cost.nextval
     , a.acct_id
     , round(a.cost * 0.1) * (mod(rownum, 100)+1)
  from ted_cost a
 where year_mon like '____/06'  
;
commit;

update ted_cost
   set cost = round(cost / 1000)
;
commit;

insert into ted_account 
select * 
  from (
        select 21, '예비비' from dual 
       )
;
  
------------------------------------------------------------------------
insert into ted_budget
select a.year_mon, a.acct_id, round(sum(a.cost) * 1.1)
  from ted_cost a
 where  a.acct_id <= 5
 group by a.year_mon, a.acct_id
;
commit;

insert into ted_budget
select '2017/' || strval
     , 21
     , round(1000000 * (100 - numval) / 100)
  from ted_dummy
 where rownum <= 12
;

commit
;
---------------------------------------------------------------------------
insert into ted_t1
select 101, null from dual union all
select 102, null from dual union all
select 106, null from dual 
; 

insert into ted_t2
select 101, 'A' from dual union all
select 101, 'B' from dual union all
select 102, 'A' from dual union all
select 102, 'B' from dual union all
select 103, 'A' from dual

;  
insert into ted_t3
select 101, 'A' from dual union all
select 101, 'B' from dual union all
select 102, 'A' from dual union all
select 102, 'B' from dual union all
select 105, 'A' from dual

; 

-------------------------------------------------------------------------------
insert into ted_trade_data
select trade_nm, work_nm, '02-000-00' || to_char(trim(to_char(rownum,'09'))), reg_type_nm, rating
  from ( 
        select '(유)체이스코리아' trade_nm, '테스트공종1' work_nm, '' tel, '하자' reg_type_nm, 5 rating from dual union all
        select '(유)체이스코리아', '테스트공종2', '', '하자', 2.4  from dual union all
        select '(유)체이스코리아', '마감공사', '', '자재', 3.5  from dual union all
        select '㈜경창건설', '가스공사', '', '', 4.1  from dual union all
        select '㈜국일공영', '타일공사', '', '', 2.7  from dual union all
        select '(주)대공엔지니어링', '경비용역', '', '', 5  from dual union all
        select '(주)대교월드건설', '방수공사', '', '', 4.9  from dual union all
        select '(주)대영전설', '전기공사', '', '', 3.9  from dual union all
        select '(주)동신석재', '석공사', '', '', 1.9  from dual union all
        select '(주)삼익플랜', '그래픽공사', '', '', 3.5  from dual union all
        select '(주)신일건구', '목창호공사', '', '', 4.6  from dual union all
        select '(주)에스티제이건설', '지붕공사', '', '', 4.2  from dual union all
        select '(주)태진전기', '전기공사', '', '', 4.3  from dual union all
        select '(주)한일아키텍', '유리공사', '', '', 3.4  from dual union all
        select '(주)화랑이엔씨', '도장공사', '', '', 0  from dual union all
        select '개일건설(주)', '골조공사', '', '', 5  from dual union all
        select '금성방재공업(주)', '소방공사', '', '', 2.4  from dual union all
        select '보쓰엔지니어링(주)', '자동제어공사', '', '', 4.1  from dual union all
        select '상원진흥(주)', '금속공사', '', '', 2.7  from dual union all
        select '영림산업(주)', '조적공사', '', '', 4.9  from dual union all
        select '영림산업(주)', '미장공사', '', '', 3.9  from dual union all
        select '유연건설(주)', '공통가설공사', '', '', 3.5  from dual union all
        select '정원테크노건설산업(주)', '단열공사', '', '', 4.6  from dual union all
        select '한영정보통신(주)', '통신공사', '', '', 4.2  from dual union all
        select '한화엘앤씨(주)', '창호공사', '', '', 4.3  from dual union all
        select '합덕건설(주)', '코킹공사', '', '', 3.4  from dual union all
        select '합덕건설(주)', '토공사', '', '', 4.6  from dual union all
        select '현재개발', '도배공사', '', '', 4.2  from dual union all
        select '화남이엔씨(주)', '설비공사', '', '', 3.4  from dual union all
        select '황룡건설(주)', '골조공사', '', '', 1.2  from dual union all
        select '황룡건설(주)', '목공사', '', '', 5  from dual 
       ) a
; 

update ted_trade_data
   set reg_type = '외주'
 where reg_type is null
;

insert into ted_trade
select rownum, trade_nm
from (select trade_nm
        from ted_trade_data
       group by trade_nm
     )
;

insert into ted_work
select rownum, work_nm
from (select work_nm
        from ted_trade_data
       where reg_type is not null
       group by work_nm
        )
;

insert into ted_code
select 'ED', '탈잉교육',  '*' from dual union all
select 'ED10', '등록유형',  'ED' from dual union all
select 'ED1001', '하자',  'ED10' from dual union all
select 'ED1002', '외주',  'ED10' from dual union all
select 'ED1003', '자재',  'ED10' from dual 
;

insert into ted_trade_work
select b.trade_id, c.work_id, a.tel, d.cd, a.rating
  from ted_trade_data a
     , ted_trade b
     , ted_work c
     , ted_code d
 where a.trade_nm = b.trade_nm(+)
   and a.work_nm  = c.work_nm(+)
   and a.reg_type = d.cd_nm(+)
;

insert into ted_data_type
select 'ABCD', '한글', sysdate, 12345678901234567890, 1234567890, 12.5, '메모' from dual
;

insert into ted_rslt_code
select 'S', '매출' from dual union all
select 'C', '원가' from dual union all
select 'P', '손익' from dual 
;

insert into ted_dept
select 1, '사장',  0 from dual union all
select 2, '감사실',  1 from dual union all
select 3, '경영본부',  1 from dual union all
select 7, '기획팀',  3 from dual union all
select 8, '경영지원팀',  3 from dual union all
select 13, '인사부',  3 from dual union all
select 12, '인사팀',  13 from dual union all
select 17, '총무팀',  13 from dual union all
select 4, '재무관리본부',  1 from dual union all
select 9, '자금팀',  4 from dual union all
select 5, '조달본부',  1 from dual union all
select 10, '외주팀',  5 from dual union all
select 11, '자재팀',  5 from dual union all
select 6, '영업본부',  1 from dual union all
select 14, '영업1팀',  6 from dual union all
select 15, '영업2팀',  6 from dual union all
select 16, '영업3팀',  6 from dual 
;


insert into ted_trade_work2
select * from ted_trade_work
;

commit;


