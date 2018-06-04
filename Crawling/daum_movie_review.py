## 1. 라이브러리 호출
import time # 시간 딜레이 및 코드 진행 시간 측정을 위한 라이브러리
import math # 리뷰 한 페이지당 10개의 리뷰가 있는데, 딱 떨어지지 않는 경우가 많아서(ex: 2433일 경우에 244 페이지) 올림 처리하여 모든 리뷰 수집을 위한 라이브러리
import requests # 서버에 요청하는 라이브러리  (from urllib.request import urlopen)을 사용해도 무방
import pandas as pd # 추후에 손쉽게 확인하기 위한 라이브러리 (pandas, dataframe)
from bs4 import BeautifulSoup # 예쁘게 꾸며주는 라이브러리
import datetime

dt = datetime.datetime.now()
dt

## 2. 다운로드 함수를 만들기 위한 사전 작업
# movieId_list에 수집하고 싶은 영화의 ID 값을 입력
# movieId는 다음 영화 페이지에서 개발자 도구를 통해 얻을 수 있음 (tag: movieId)
movieId_list = ['93251', '102301', '106954', '116628', '109076'] # 5개의 영화
page = '1' # 리뷰 페이지 (1~n)
movie_list = [] # 영화 정보들을 담을 리스트 ... [{'key1' : 'val2', 'key2' : 'val2' ... 의 형태로 담김}]

# 영화 정보를 담기 위한 반복문 작업
for movieId in movieId_list:
    base_url = "http://movie.daum.net/moviedb/grade?movieId="
    url = 'http://movie.daum.net/moviedb/grade?movieId=' + movieId + '&type=netizen&page=' + page # 인자 값으로 movieId와 page를 받음
    # requests 함수를 사용하여 서버에 호출
    resp = requests.get(url)
    # beautifulsoup을 사용하여 파싱
    soup = BeautifulSoup(resp.text, 'html.parser')
    # 리뷰 숫자 카운트
    review_no = soup.find("span", {"class": "txt_menu"}).get_text()
    review_no = int(review_no.replace(",", "").replace("(", "").replace(")", ""))
    # 페이지 수 카운트
    page_no = math.ceil(review_no / 10)
    # 정확한 영화 제목을 얻기 위한 변수
    movie_nm = soup.find("h2", {"class" : "tit_rel"}).get_text()

    # movie_list에 사전 형태로 영화의 정보 담기
    # movieId : 영화 번호(고유값) / movie_nm : 영화 제목 / base_url: parameter 전의 기본 url / url: parameter를 포함한 url / review_no : 리뷰 숫자 / page_no: 페이지 숫자
    movie_list.append({
        'movieId': movieId,
        'movie_nm': movie_nm,
        'base_url': base_url,
        'url' : url,
        'review_no': review_no,
        'page_no': page_no
    })
print(movie_list)

## 3. 다운로드 함수 정의
def daum_movie():
    # 코스 실행 시간 측정 (st_dt: 시작, ed_dt: 종료, run_dt: 실행시간)
    st_dt = time.time()
    # 크롤링한 데이터를 담기 위한 txt 파일 생성
    fout = open("./daum_movie_result({}).txt".format(dt.strftime("%Y%m%d")), 'w', encoding = 'utf-8')
    # fout = open("./daum_movie_result.txt", 'w', encoding = 'utf-8')

    # movie_list에 담긴 5개의 영화를 반복문으로 돌리기
    for movie in movie_list:
        movie_nm = movie.get('movie_nm')
        review_no = movie.get('review_no')
        page_no = movie.get('page_no')
        base_url = movie.get('base_url')
        movie_id = movie.get('movieId')

        # 진행상황을 알고 싶다면 print문의 주석 해제
        # print('movie_nm : ', movie_nm)
        # print('movie_id : ', movie_id)
        # print('review_no : ', review_no)
        # print('page_no : ' , page_no)

        fout.write("movie_nm : " + movie_nm + "(" + str(review_no) + ")"+ "\n")
        for page in range(1, page_no + 1):
            url = base_url + movie_id + '&type=netizen&page=' + str(page)
            print(movie_nm, " : ", page, "/", page_no)

            resp = requests.get(url)
            soup = BeautifulSoup(resp.text, 'html.parser')
            reviews = soup.find_all('p', {'class': 'desc_review'})  

            # response = urlopen(url)
            # parsed = BeautifulSoup(response, 'html.parser')  # 'html5lib'을 사용해도 무방하나 'html.parser'가 더 빠름
            # reviews = parsed.find_all('p', {'class': 'desc_review'})
            
            for review in reviews:
                review = review.get_text(strip = True)
                if review != "":
#                     print(review)

                    fout.write(review + "\n")
        fout.write("="*30 + "\n")
    fout.close()
    ed_dt = time.time()

    print("--- {} seconds ---".format(ed_dt - st_dt))

daum_movie()