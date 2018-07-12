/*
##########################################################################################################################################################################
1. 하나의 값 조작하기
##########################################################################################################################################################################
*/

## 1. 코드 값을 레이블로 변경하기 (5-1)
## 로그 데이터 또는 업무 데이터로 저장된 코드 값을 그대로 집계에 사용하면 리포트의 가독성이 낮아지므로
## 리포트 작성할 때 변환하는 등의 작업이 필요함.
## 아에 집계할 때 미리 코드 값을 레이블로 변경하는 쿼리

/* DROP TABLE IF EXISTS mst_users;
CREATE TABLE mst_users(
    user_id         varchar(255)
  , register_date   varchar(255)
  , register_device integer
);

INSERT INTO mst_users
VALUES
    ('U001', '2016-08-26', 1)
  , ('U002', '2016-08-26', 2)
  , ('U003', '2016-08-27', 3)
; */


## 1-1. 코드 값을 레이블로 변경하기
select 
	user_id
    , case
     	when a.`register_device` = 1 then 'desktop'
     	when a.`register_device` = 2 then 'mobile'
     	when a.`register_device` = 3 then 'application'
     	-- 디폴트 값을 지정할 경우 else 구문을 사용
     	-- else ''
     	end as device_name
from mst_users a;

##########################################################################################################################################################################

## 2. URL에서 요소 추출하기 (5-2)
/* DROP TABLE IF EXISTS access_log ;
CREATE TABLE access_log (
    stamp    varchar(255)
  , referrer text
  , url      text
);

INSERT INTO access_log 
VALUES
    ('2016-08-26 12:02:00', 'http://www.other.com/path1/index.php?k1=v1&k2=v2#Ref1', 'http://www.example.com/video/detail?id=001')
  , ('2016-08-26 12:02:01', 'http://www.other.net/path1/index.php?k1=v1&k2=v2#Ref1', 'http://www.example.com/video#ref'          )
  , ('2016-08-26 12:02:01', 'https://www.other.com/'                               , 'http://www.example.com/book/detail?id=002' )
; */


## 2-1. 레퍼러로 어떤 웹 페이지를 거쳐 넘어왔는지 판별하기
## 페이지 단위로 집계하면 밀도가 너무 작아 복잡해지므로 호스트 단위로 집계
select al.`stamp`
	-- referrer의 호스트 추출하기
	-- mysql일 경우
	, REGEXP_SUBSTR(al.`referrer`, 'https?://([^/]*)')  as referrer_host
	-- PostgreSQL의 경우
	-- , substring(referrer, from 'https?://[^/]*') as referrer_host
	-- Hive, SparkSQL의 경우
	-- , parse_url(referrer, 'HOST') as referrer_host
from access_log al
;


## 2-2. URL에서 경로와 요청 매개변수 값 추출하기 (5-3)
## (로그 데이터로 저장된) URL 경로를 가공해서 상품 리포트 만들기
## URL 경로와 GET 요청 매개변수에 있는 특정 키를 추출하는 쿼리
select al.`stamp`
	, url
	-- mysql일 경우
	, regexp_substr(url, '//[^/]+([^?#]+)') as path
	, regexp_substr(url, 'id=([^&]*)') as id
from access_log al
;


## 3. 문자열을 배열로 분해하기 (5-4)
## URL 경로를 슬래시(/)로 분할해서 계층을 추출하는 쿼리
select
	stamp
	, url
	-- 경로를 슬래시로 잘라 배열로 분할하기
	-- 경로가 반드시 슬래시로 시작하므로 2번째 요소가 마지막 계층
	, substring_index(url, '/', 3) as path1
	, substring_index(url, '.com', -1) as path2
	, substring_index(substring_index(url, '/', 4), '/', -1) as path3
	, substring_index(substring_index(url, '.com', 2), '/', -1) as path4
	, regexp_substr(url, 'id=([^&]*)') as id
from access_log;

##########################################################################################################################################################################

## 4. 날짜와 타임스탬프 다루기
## 4-1. 현재 날짜와 타임스탬프 추출하기
select
	current_date as dt
	, now() as now
	, sysdate(1) as sysdate
;


## 4-2. 지정한 값의 날짜/시각 데이터 추출하기
-- 문자열을 날짜/타임스탬프로 변환하기 (5-6)
select
	cast('2016-01-30' as date) as dt
	, timestamp('2016-01-30 12:00:00')
	, timestamp(now())
;


## 4-3. 날짜/시각에서 특정 필드 추출하기 (5-7)
## 연월 동시 추출하여 월별 리포트 생성
## extract, substr
select
	dt
	, extract(year from dt) as year
	, extract(month from dt) as momth
	, extract(day from dt) as day
from 
	(select cast('2016-01-30' as date) as dt) as d
;

select
	dt
	, extract(year from dt) as year
	, extract(month from dt) as momth
	, extract(day from dt) as day
	, extract(hour from dt) as hour
	, extract(minute from dt) as minute
	, extract(second from dt) as second
from
	(select timestamp(now()) as dt) as d
;

select
	substr(dt, 1, 7) as 'year_month'
from
	(select cast('2016-01-30' as date) as dt) as d
;

##########################################################################################################################################################################

## 5. 결손 값을 디폴트 값으로 대치하기
## 문자열 또는 숫자를 다룰 때는 중간에 null 들어있는 경우를 조심해야함
## null과 문자열을 결합하거나, 사칙연산을 해도 null이 됨

/* DROP TABLE IF EXISTS purchase_log_with_coupon;
CREATE TABLE purchase_log_with_coupon (
    purchase_id varchar(255)
  , amount      integer
  , coupon      integer
);

INSERT INTO purchase_log_with_coupon
VALUES
    ('10001', 3280, NULL)
  , ('10002', 4650,  500)
  , ('10003', 3870, NULL)
; */

select
	purchase_id
	, amount
	, coupon
	, amount - coupon as discount_amount1
	, amount - coalesce(coupon, 0) as discount_amount2
from
	purchase_log_with_coupon
;

/*
##########################################################################################################################################################################
2. 여러 개의 값에 대한 조작
##########################################################################################################################################################################
*/

## 1. 문자열 연결하기
/* DROP TABLE IF EXISTS mst_user_location;
CREATE TABLE mst_user_location (
    user_id   varchar(255)
  , pref_name varchar(255)
  , city_name varchar(255)
);

INSERT INTO mst_user_location
VALUES
    ('U001', '서울특별시', '강서구')
  , ('U002', '경기도수원시', '장안구'  )
  , ('U003', '제주특별자치도', '서귀포시')
; */

select
	user_id
	, concat(pref_name, ' ',city_name) as pref_city
from
	`mst_user_location`
;

## 2. 여러 개의 값 비교하기
## 4분기의 매출(quarterly_sales)을 나타낸 테이블
## 각 연도의 4분기 매출이 컬럼(q1~q4)으로 표현되어 있음
## 2018년 3분기와 4분기는 매출 금액이 확정되지 않아서 null

/* DROP TABLE IF EXISTS quarterly_sales;
CREATE TABLE quarterly_sales (
    year integer
  , q1   integer
  , q2   integer
  , q3   integer
  , q4   integer
);

INSERT INTO quarterly_sales
VALUES
    (2015, 82000, 83000, 78000, 83000)
  , (2016, 85000, 85000, 80000, 81000)
  , (2017, 90000, 82000, 82000 , 83000 )
  , (2018, 92000, 81000, NULL , NULL )
; */

## 2-1. 분기별 매출 증감 판정하기
## 분기마다 매출이 증가했는지 감소했는지 판정하기
select
	year
	, q1
	, q2
	-- q1과 q2의 매출 변화 평가하기
	, case
		when q1 < q2 then '+'
		when q1 = q2 then ' '
		else '-'
	 end as judge_q1_q2
	 -- q1과 q2의 매출액 차이 계산하기
	 , q2 - q1 as diff_q2_q1
	 -- q1과 q2의 매출 변화를 1, 0, -1로 표현하기
	 , sign(q2 - q1) as sign_q2_q1
from
	quarterly_sales
order by
	year
;

##########################################################################################################################################################################
##########################################################################################################################################################################
##########################################################################################################################################################################
##########################################################################################################################################################################
##########################################################################################################################################################################


