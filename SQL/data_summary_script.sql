/*-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
											데이터 추출
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --*/

/*
- 2017년 7월까지 계정별 집행원가를 다음과 같은 조건으로 조회되도록 작성하기.
  - 계정ID, 계정명, 전년누계, 전월누계, 당월, 당월누계, 총계
    - 전년누계 : ~ 2016-12 까지
    - 전월누계 : 2017-01 ~ 2017-06
    - 당월 : 2017-07
    - 당월누계 : 전월누계 + 당월
    - 총계 : 전년누계 + 당월누계
 */

select
   a.ACCT_ID as 계정ID
  ,a.ACCT_NM as 계정명
--  전년 누계 (~2016-12)
,sum(case when b.year_mon <= substr(:year_mon,1,4) then cost end) as 전년누계
--   전월 누계 (2017-01~2017-06)
,sum(case when replace(b.YEAR_MON, '/', '') between replace(:year_mon, '/', '') - 6 and replace(:year_mon, '/', '') - 1 then cost end) as 전월누계
--  당월
,sum(case when b.YEAR_MON like :year_mon || '%' then cost end) as 당월
--   당월 누계 (전월 + 당월)
,sum(case when b.year_mon like substr(:year_mon,1,4) || '%'  then cost end) as 당월누계
--   총계 (전년누계 + 당월누계)
,sum(cost) as 총계
from
TED_ACCOUNT a, TED_COST b
where
a.ACCT_ID = b.ACCT_ID
group by a.ACCT_ID, a.ACCT_NM
order by 1, 2
;