create table edu.ted_dummy
(
	numval       number not null,
	strval       varchar2 (2)
)
tablespace edu_data01
;

comment on table edu.ted_dummy is '더미' ;

comment on column edu.ted_dummy.numval is '숫자값' ;

comment on column edu.ted_dummy.strval is '문자값' ;

alter table edu.ted_dummy add
	constraint pk_ted_dummy primary key (numval)
    using index tablespace edu_idx01
;	
----------------------------------------------------------------------

create table edu.ted_student
(
	student_no       varchar2 (4) not null,
	student_nm       varchar2 (20),
	ent_date         date,
	grade_class_no   varchar2 (4),
	region_id        number 
)
tablespace edu_data01
;

comment on table edu.ted_student is '학생' ;

comment on column edu.ted_student.student_no is '학생번호' ;

comment on column edu.ted_student.student_nm is '이름' ;

comment on column edu.ted_student.ent_date is '입학일자' ;

comment on column edu.ted_student.grade_class_no is '학년반번호' ;

comment on column edu.ted_student.region_id is '지역ID' ;

alter table edu.ted_student add
	constraint pk_ted_student primary key (student_no)
    using index tablespace edu_idx01
;
---------------------------------------------------------------------------------------

create table edu.ted_score
(
	student_no       varchar2 (4) not null,
	year_mon         varchar2 (7) not null,
	kor              number (3),
	eng              number (3),
	math             number (3)
)
tablespace edu_data01
;

comment on table edu.ted_score is '학생' ;

comment on column edu.ted_score.student_no is '학생번호' ;

comment on column edu.ted_score.year_mon is '시험연월' ;

comment on column edu.ted_score.kor is '국어' ;

comment on column edu.ted_score.eng is '영어' ;

comment on column edu.ted_score.math is '수학' ;

alter table edu.ted_score add
	constraint pk_ted_score primary key (student_no, year_mon)
    using index tablespace edu_idx01
;
---------------------------------------------------------------------------------------

create table edu.ted_region
(
	region_id       number not null,
	region_nm       varchar2 (100)
)
tablespace edu_data01
;

comment on table edu.ted_region is '지역' ;

comment on column edu.ted_region.region_id is '지역ID' ;

comment on column edu.ted_region.region_nm is '지역명' ;

alter table edu.ted_region add
	constraint pk_ted_region primary key (region_id)
    using index tablespace edu_idx01
;	
---------------------------------------------------------------------------------------
create table edu.ted_dept
(
	dept_id       number not null,
	dept_nm       varchar2 (100),
	up_dept_id    number
)
tablespace edu_data01
;

comment on table edu.ted_dept is '부서' ;

comment on column edu.ted_dept.dept_id is '부서ID' ;

comment on column edu.ted_dept.dept_nm is '부서명' ;

comment on column edu.ted_dept.up_dept_id is '상위부서ID' ;

alter table edu.ted_dept add
	constraint pk_ted_dept primary key (dept_id)
    using index tablespace edu_idx01
;
---------------------------------------------------------------------------------------
create table edu.ted_account
(
	acct_id       number not null,
	acct_nm       varchar2 (100)
)
tablespace edu_data01
;

comment on table edu.ted_account is '계정' ;

comment on column edu.ted_account.acct_id is '계정ID' ;

comment on column edu.ted_account.acct_nm is '계정명' ;

alter table edu.ted_account add
	constraint pk_ted_account primary key (acct_id)
    using index tablespace edu_idx01
;
---------------------------------------------------------------------------------------

create sequence edu.seq_ed_cost
;

----------------------------------------------------------------------------------------
create table edu.ted_cost 
(
	year_mon      varchar2(7) not null,
	seq           number not null,
	acct_id       number,
	cost          number
)
tablespace edu_data01
;

comment on table edu.ted_cost is '계정' ;

comment on column edu.ted_cost.year_mon is '집행년월' ;

comment on column edu.ted_cost.acct_id is '계정ID' ;

comment on column edu.ted_cost.seq is '순번' ;

comment on column edu.ted_cost.cost is '집행원가' ;

alter table edu.ted_cost add
	constraint pk_ted_cost primary key (year_mon, seq)
    using index tablespace edu_idx01
;

/*
create index edu.in_ted_cost_01
on edu.ted_cost
(
	cost asc
)
tablespace edu_idx01
;
*/

create index edu.in_ted_student_01
on edu.ted_student
(
	ent_date asc
)
tablespace edu_idx01
;
----------------------------------------------------------------------
create table edu.ted_budget
(
	year_mon      varchar2(7) not null,
	acct_id       number not null,
	budget        number
)
tablespace edu_data01
;

comment on table edu.ted_budget is '계정별예산' ;

comment on column edu.ted_budget.year_mon is '예산년월' ;

comment on column edu.ted_budget.acct_id is '계정ID' ;

comment on column edu.ted_budget.budget is '예산' ;

alter table edu.ted_budget add
	constraint pk_ted_budget primary key (year_mon, acct_id)
    using index tablespace edu_idx01
;

alter table edu.ted_score add
    constraint ck_ted_score check (math between 0 and 100)
;

alter table edu.ted_cost add
    constraint fk_ted_cost_01 foreign key (acct_id)
    references edu.ted_account(acct_id)
;
---------------------------------------------------------------------------------
create table edu.ted_budget_cost
(
	year_mon      varchar2(7) not null,
	acct_id       number not null,
	unit          varchar2(1) not null,
	budget        number,
	cost          number
)
tablespace edu_data01
;

comment on table edu.ted_budget_cost is '예산과원가' ;

comment on column edu.ted_budget_cost.year_mon is '집계년월' ;

comment on column edu.ted_budget_cost.unit is '단위' ;

comment on column edu.ted_budget_cost.acct_id is '계정ID' ;

comment on column edu.ted_budget_cost.budget is '예산' ;

comment on column edu.ted_budget_cost.cost is '원가' ;

alter table edu.ted_budget_cost add
	constraint pk_ted_budget_cost primary key (year_mon, acct_id, unit)
    using index tablespace edu_idx01
;

create table edu.ted_rslt_summary
(
	year_mon      varchar2(7) not null,
	rslt_cd       varchar2(1) not null,
	rslt_amt      number
)
tablespace edu_data01
;

comment on table edu.ted_rslt_summary is '실적요약' ;

comment on column edu.ted_rslt_summary.year_mon is '집계년월' ;

comment on column edu.ted_rslt_summary.rslt_cd is '실적코드' ;

comment on column edu.ted_rslt_summary.rslt_amt is '실적금액' ;


alter table edu.ted_rslt_summary add
	constraint pk_ted_rslt_summary primary key (year_mon, rslt_cd)
    using index tablespace edu_idx01
;

create table edu.ted_rslt_code
(
	rslt_cd      varchar2(1) not null,
	rslt_nm      varchar2(50)
)
tablespace edu_data01
;

comment on table edu.ted_rslt_code is '실적코드' ;

comment on column edu.ted_rslt_code.rslt_cd is '실적코드' ;

comment on column edu.ted_rslt_code.rslt_nm is '실적명' ;

alter table edu.ted_rslt_code add
	constraint pk_ted_rslt_code primary key (rslt_cd)
    using index tablespace edu_idx01
;

---------------------------------------------------------------------------------
create or replace view edu.ved_score as 
select a.year_mon
     , a.student_no
     , b.student_nm
     , b.grade_class_no
     , b.ent_date
     , nvl(a.kor,0)  as kor
     , nvl(a.eng,0)  as eng
     , nvl(a.math,0) as math
     , nvl(a.kor,0) + nvl(a.eng,0) + nvl(a.math,0)                 as total
     , round((nvl(a.kor,0) + nvl(a.eng,0) + nvl(a.math,0)) / 3, 2) as avg
     , case when 90 <= round((nvl(a.kor,0) + nvl(a.eng,0) + nvl(a.math,0)) / 3, 2) then 'A'
            when 80 <= round((nvl(a.kor,0) + nvl(a.eng,0) + nvl(a.math,0)) / 3, 2) then 'B'
            else 'C' end as grade
  from ted_score a
     , ted_student b
 where a.student_no = b.student_no
  with read only
;     

-----------------------------------------------------------------------------------------
create table edu.ted_job
(
	seq          number not null,
	exec_date    date
)
tablespace edu_data01
;

comment on table edu.ted_job is 'Job' ;

comment on column edu.ted_job.seq is '실행순번' ;

comment on column edu.ted_job.exec_date is '실행일시' ;

alter table edu.ted_job add
	constraint pk_ted_job primary key (seq)
    using index tablespace edu_idx01
;

----------------------------------------------------------------------------------
create table ted_t1
(
	col1          number not null,
	col2          varchar2(10)
)
tablespace edu_data01
;

create table ted_t2
(
	col1          number not null,
	col2          varchar2(10)
)
tablespace edu_data01
;

create table ted_t3
(
	col1          number not null,
	col2          varchar2(10)
)
tablespace edu_data01
;
-------------------------------------------------------------------------------------
create table edu.ted_trade_data
(
	trade_nm          varchar2(100) not null,
	work_nm           varchar2(100),
	tel               varchar2(50),
	reg_type          varchar2(50),
	rating            number(6,1)
)
tablespace edu_data01
;

comment on table edu.ted_trade_data is '' ;

comment on column edu.ted_trade_data.trade_nm is '업체명' ;

comment on column edu.ted_trade_data.work_nm is '공종명' ;

comment on column edu.ted_trade_data.tel is '담당자 사무실전화' ;

comment on column edu.ted_trade_data.reg_type is '등록유형' ;

comment on column edu.ted_trade_data.rating is '평가' ;


create table edu.ted_trade
(
	trade_id          number(10) not null,
	trade_nm          varchar2(100)
)
tablespace edu_data01
;

comment on table edu.ted_trade is '업체정보' ;


comment on column edu.ted_trade.trade_id is '거래선ID' ;

comment on column edu.ted_trade.trade_nm is '업체명' ;

alter table edu.ted_trade add
	constraint pk_ted_trade primary key (trade_id)
    using index tablespace edu_idx01
;

create table edu.ted_work 
(
	work_id          number(10) not null,
	work_nm          varchar2(100)
)
tablespace edu_data01
;

comment on table edu.ted_work is '공종' ;


comment on column edu.ted_work.work_id is '공종ID' ;

comment on column edu.ted_work.work_nm is '공종명' ;

alter table edu.ted_work add
	constraint pk_ted_work primary key (work_id)
    using index tablespace edu_idx01
;

create table edu.ted_code 
(
	cd          varchar2(20) not null,
	cd_nm       varchar2(100),
    up_cd       varchar2(20)
)
tablespace edu_data01
;

comment on table edu.ted_code is '공통코드' ;


comment on column edu.ted_code.cd is '코드' ;

comment on column edu.ted_code.cd_nm is '코드명' ;

comment on column edu.ted_code.up_cd is '상위코드' ;

alter table edu.ted_code add
	constraint pk_ted_code primary key (cd)
    using index tablespace edu_idx01
;

---------------------------------------------------------------------------------------
create table edu.ted_trade_work
(
	trade_id          number(10) not null,
	work_id           number(10) not null,
	tel               varchar2(50),
	reg_type_cd       varchar2(20),
	rating            number(6,1)
)
tablespace edu_data01
;

comment on table edu.ted_trade_work is '' ;

comment on column edu.ted_trade_work.trade_id is '거래선ID' ;

comment on column edu.ted_trade_work.work_id is '공종ID' ;

comment on column edu.ted_trade_work.tel is '담당자 사무실전화' ;

comment on column edu.ted_trade_work.reg_type_cd is '등록유형ID' ;

comment on column edu.ted_trade_work.rating is '평가' ;

alter table edu.ted_trade_work add
	constraint pk_ted_trade_work primary key (trade_id, work_id)
    using index tablespace edu_idx01
;
-------------------------------------------------------------------------------
create table edu.ted_trade_work2
(
	trade_id          number(10) not null,
	work_id           number(10) not null,
	tel               varchar2(50) not null,
	reg_type_cd       varchar2(20),
	rating            number(6,1)
)
tablespace edu_data01
;

comment on table edu.ted_trade_work2 is '' ;

comment on column edu.ted_trade_work2.trade_id is '거래선ID' ;

comment on column edu.ted_trade_work2.work_id is '공종ID' ;

comment on column edu.ted_trade_work2.tel is '담당자 사무실전화' ;

comment on column edu.ted_trade_work2.reg_type_cd is '등록유형ID' ;

comment on column edu.ted_trade_work2.rating is '평가' ;

alter table edu.ted_trade_work2 add
	constraint pk_ted_trade_work2 primary key (trade_id, work_id, tel)
    using index tablespace edu_idx01
;

-----------------------------------------------------------------------------
create table edu.ted_data_type
(
	col1              char(8),
	col2              varchar2(8),
	col3              date,
	col4              number,
	col5              number(10), 
	col6              number(3,1), 
	col7              clob 
)
tablespace edu_data01
;
























