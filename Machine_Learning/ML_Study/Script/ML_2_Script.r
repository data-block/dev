
##### 1. Electricity
### Obj : 빌딩의 전력량 예측하는 모델
### Data : Electric
### Hypothesis : surface_area를 input으로 쓰면 electricity를 예측하는데 도움이 될 것이다.
### feature : surface_area(Input), electricity(Output)
### Process : Data Load -> EDA -> Modeling -> Test

##### Data Load
Elec <- read.csv('/Users/mac/Downloads/dev/study/R_ML/Class 1/Data/Electric.csv')

##### EDA ... Data Structure & Plot
str(Elec)
plot(Elec$surface_area, Elec$electricity, cex = 3, pch = 19)


##### 난수 발생 알고리즘 초기값 고정 ... Training 할 때마다 샘플이 동일한 기준에서 돌아가야 하니까
set.seed(3)

##### Training Set을 전체 데이터의 70% 지정 (Training Data)
train <- sample(1:nrow(Elec), 0.7 * nrow(Elec))

##### 실제 전력량 (Output, Answer)
real_electricity <- Elec$electricity[-train]

##### Model_1 ... 전력량과 면적의 1차 함수
Model_1 <- lm(electricity ~ surface_area, data = Elec[train, ])
predicted_electricity_1 <- predict(Model_1, Elec[-train, ])
test_error_1 <- mean((real_electricity - predicted_electricity_1)^2)

##### Model_5 ... 전력량과 면적의 5차 함수
Model_5 <- lm(electricity ~ poly(surface_area, 5), data = Elec[train, ])
predicted_electricity_5 <- predict(Model_5, Elec[-train, ])
test_error_5 <- mean((real_electricity - predicted_electricity_5)^2)

##### Model_10 ... 전력량과 면적의 10차 함수
Model_10 <- lm(electricity ~ poly(surface_area, 10), data = Elec[train, ])
predicted_electricity_10 <- predict(Model_10, Elec[-train, ])
test_error_10 <- mean((real_electricity - predicted_electricity_10)^2)

##### 각각의 Error(Cost) 값
test_error_1
test_error_5
test_error_10

## EDA ... 구현한 모든 모델 시각화 
plot(Elec$surface_area, Elec$electricity, cex = 3, pch = 15)
a <- seq(500, 820, length = 1000) # surface_area의 값 범위(500~820)를 1000등분 함

points(a, predict(Model_1, data.frame(surface_area = a)), type = 'l', lwd = 10, col = 1)
points(a, predict(Model_5, data.frame(surface_area = a)), type = 'l', lwd = 10, col = 5)
points(a, predict(Model_10, data.frame(surface_area = a)), type = 'l', lwd = 3, col = 10)

##### 2. Cars
### obj : 자동차의 연비를 예측하는 모델
### Data : Cars.csv
### Hypothesis : weight를 Input으로 쓰면 mpg를 예측하는데 도움이 될 것이다.
### Feature : weight(Input), mpg(Output)
### Process : Data Load -> EDA -> Modeling(Train) -> (Validation) -> Test -> Visualization

##### Data Load
Cars <- read.csv("/Users/mac/Downloads/dev/study/R_ML/Class 1/Data/Cars.csv")

##### Data Structure
str(Cars)

##### 데이터 샘플링 초기값 설정
set.seed(1)

##### Training Set을 전체 데이터의 60%로 지정
train <- sample(1:nrow(Cars), 0.6 * nrow(Cars))
##### Validatiaon Set을 전체 데이터의 20%로 지정
validation <- sample(setdiff(1:nrow(Cars), train), 0.2 * nrow(Cars)) # setdiff = 뺸 나머지, 1:768의 vector 주머니에서 train을 빼라
##### Test Set을 전체 데이터의 20%로 지정
test <- setdiff(1:nrow(Cars), c(train, validation))

##### Model_1 : weight(무게)와 mpg(연비) 1차 함수
Model_1 <- lm(mpg ~ weight, data = Cars[train, ])
pred_weight_1 <- predict(Model_1, Cars[validation, ])
validation_error_1 <- mean((Cars$mpg[validation] - pred_weight_1)^2)

##### Model_2 : weight(무게)와 mpg(연비) 10차 함수
Model_2 <- lm(mpg ~ poly(weight, 10), data = Cars[train, ])
pred_weight_2 <- predict(Model_2, Cars[validation, ])
validation_error_2 <- mean((Cars$mpg[validation] - pred_weight_2)^2)

##### Model_3 : weight + horsepower
Model_3 <- lm(mpg ~ weight + horsepower, data = Cars[train, ])
pred_weight_3 <- predict(Model_3, Cars[validation, ])
validation_error_3 <- mean((Cars$mpg[validation] - pred_weight_3)^2)



plot(Cars$weight, Cars$mpg, cex = 3, pch = 15)

##### Machine Learning System Design
### 일반적으로 이 과정을 수십, 수백, 수천 번 반복한다.
### 이 실험의 과정이 한 달이 걸리고, 한 달이 지났을 때,
### Validation Error가 제일 낮아지는 모형을 선택했다.
### 이제 Model에 대한 Test Error를 한 번 딱 측정하고 끝낸다.


##### K-Fold로 나눴다면, 실험이 끝날 때까지 가지고 가야 한다.
##### Cross Validation은 독립적이라서 병렬처리할 수 있다.
# 구조화된 데이터 ... Random Forest, Boost, Decision Tree (~14년 Random Forest, 그 이후에는 Boost 계열이 많이 활용)
# 비구조화된 데이터(이미지, 음성, 텍스트 데이터) ... Deep Learning