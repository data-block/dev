import time
import math
import requests
import pandas as pd
from bs4 import BeautifulSoup

def daum_movie():
    fout = open("./daum_movie_result.txt", 'w', encoding = 'utf-8')

    for movie in movie_list:
        movie_nm = movie.get('movie_nm')
        review_no = movie.get('review_no')
        page_no = movie.get('page_no')
        base_url = movie.get('base_url')
        movie_id = movie.get('movieId')
        print('movie_nm : ', movie_nm)
        print('movie_id : ', movie_id)
        print('review_no : ', review_no)
        print('page_no : ' , page_no)
        fout.write("movie_nm : " + movie_nm + "(" + str(review_no) + ")"+ "\n")
        for page in range(1, page_no + 1):
            url = base_url + movie_id + '&type=netizen&page=' + str(page)
            print(page, "/", page_no)
            response = urlopen(url)
            parsed = BeautifulSoup(response, 'html.parser')  # html5lib
            reviews = parsed.find_all('p', {'class': 'desc_review'})
            
            for review in reviews:
                review = review.get_text(strip = True)
                if review != "":
#                     print(review)

                    fout.write(review + "\n")
        fout.write("="*30 + "\n")
    fout.close()  