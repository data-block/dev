/*------------------------
0. 코드 속성값 조회 1
------------------------*/
-- 0-1. 한글명으로 원하는 키워드 검색 ('업종코드')
select *
from dw_comm..tbkz11c -- 코드 테이블
where  comm_cd_id_nm like '%업종코드%'
;

-- 0-2. 결합할 테이블 조회
select *
from dw_comm..tbkz12c -- 코드별 값 상세설명 테이블
limit 10
;

-- 0-3. inner join
select *
from dw_comm..tbkz11c a, dw_comm..tbkz12c b
where a.comm_div_cd = b.comm_div_cd
and comm_div_cd = 'A2488'
order by scrn_inqu_seq
;


/*------------------------
1. 코드 속성값 조회 2
------------------------*/
-- 1-1. 특정 컬럼의 속성 값 확인
select distinct(b2_reg_cd)
from dw_mst..tbia00a
order by 1
;


-- 1-2.
select *
from dw_comm..tbkz11c
where comm_cd_id_nm like '%B2%'
;

-- 1-3.
select *
from dw_comm..tbkz11c
where comm_div_cd = 'A1003'
;



/*------------------------
2. 회원사 코드 검색
------------------------*/
select *
from dw_comm..tbkp94a
where tx_agnc_nm like '%교보생명%'
   or tx_agnc_nm like '%현대캐피탈%'
   or tx_agnc_nm like '%현대커머셜%'
   or tx_agnc_nm like '%씨티은행%'
   or tx_agnc_nm like '%씨티카드%'
;

-- 정규표현식
-- select *
-- from dw_comm..tbkp94a
-- where regexp_like(tx_agnc_nm, '(*.교보생명.*)|(*.현대캐피탈.*)|(*.현대커머셜.*)|(*.씨티은행.*)|(*.씨티카드.*)')
-- ;


/*------------------------
3. 담보 및 담보물 등록현황
------------------------*/

select a.tx_agnc_cd as "회원사코드"
      , b.tx_agnc_nm as "회원사명"
      , count(*) AS "총 건수"
      , sum(decode(mrtg_yn, 'Y', 1, 0)) as "담보여부_Y"
      -- rep_mrtg_trgt_knd_cd (대표물 담보 종류 코드)
      , sum(case when mrtg_yn = 'Y' and rep_mrtg_trgt_knd_cd != '0000000000000000000000000' then 1 else 0 end) as "담보물_등록"
      , sum(case when mrtg_yn = 'Y' and rep_mrtg_trgt_knd_cd = '0000000000000000000000001' then 1 else 0 end) as "담보물_기타등록"
      , sum(case when mrtg_yn = 'Y' and rep_mrtg_trgt_knd_cd = '0000000000000000000000000' then 1 else 0 end) as "담보물_미등록"
      , sum(decode(mrtg_yn, 'N', 1, 0)) as "담보여부_N"
      , sum(case when mrtg_yn = 'N' and rep_mrtg_trgt_knd_cd = '0000000000000000000000000' then 1 else 0 end) as "담보물_미등록"
      , sum(case when mrtg_yn = 'N' and rep_mrtg_trgt_knd_cd = '0000000000000000000000001' then 1 else 0 end) as "담보물_기타등록"
      , sum(case when mrtg_yn = 'N' and rep_mrtg_trgt_knd_cd != '0000000000000000000000000' then 1 else 0 end) as "담보물_등록"
from dw_mst..tbia00a a, dw_comm..tbkp94a b                -- tbia00a : , tbkp94a :
where a.tx_agnc_cd = b.tx_agnc_cd
  and a.b_st_dt <= '20180517' and a.b_end_dt > '20180517' -- 기준일자
  and a.b2_reg_cd in ('01', '02')                         -- B2등록사유코드 (01: 발생, 02: 변동)
  and a.acct_stat_cd = '00'                               -- 계좌상태코드 (00: 정상, 09: 비유효
  and a.tx_agnc_cd in ('A00211', 'A00212', 'C00220', 'C00310', 'D00010')
group by a.tx_agnc_cd, b.tx_agnc_nm
order by a.tx_agnc_cd
;


/*------------------------
4. 모집채널 등록현황
------------------------*/
select b.tx_agnc_nm,
      , to_char(b_st_dt, 'YYYY') yyyy
      , a.clct_chnl_cd -- 모집채널 코드
      , count(*) as "총 등록건수"
      , sum(case when a.clct_chnl_cd in ('01', '02', '03', '04', '05', '06', '07', '99') then 1 else 0 end) as "정상코드_등록건수"
      , sum(case when a.clct_chnl_cd not in ('01', '02', '03', '04', '05', '06', '07', '99') then 1 else 0 end) as "오류코드_등록건수"
      , sum(case when a.clct_chnl_cd is null then 1 else 0 end) as "Null_등록건수"
from dw_mst..tbia00a a, dw_comm..tbkp94a b
where a.tx_agnc_cd = b.tx_agnc_cd
  and a.b_st_dt >= '20170101' and a.b_end_dt <= '20180517'
  and a.tx_agnc_cd in ('A00211', 'A00212', 'C00220', 'C00310', 'D00010')
group by 1, 2, 3
order by 1, 2, 3
;


/*------------------------
5. 연체기산일 현황
------------------------*/
