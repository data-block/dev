
2-1. Parametric Approach & Hypothesis & Capacity
===
## 2-1-1. 종전의 프로그래밍과 머신러닝의 차이점
- 전문가 vs. 데이터
    - 종전의 프로그래밍은 전문가가 가진 종전의 지식 체계를 이용
    - 머신러닝은 데이터를 사용해서 f를 찾아나간다.
    
## 2-1-2. obj : f (Data 기반)
- 목표: 데이터에 기반해서 f를 찾는 것
<br><br>
- 모든 함수가 사는 공간에서 우리가 가지고 있는 데이터를 가장 잘 설명하는 데이터를 찾는다고 가정해보자.
    - 이런 접근 방식에는 문제가 있다. 범위가 너무 넓다. 거기에서 하나를 뽑는 건 어렵다.
    <br><br>
- (우리가 하고 싶은 건) 우리 데이터를 가장 잘 설명하는 함수를 제한된 범위 내에서 찾자
    - 모든 1차 함수가 사는 공간에서 우리가 가진 데이터를 가장 잘 설명하는 함수를 찾는 건 그렇게 어려운 일이 아니다.
    - 모든 데이터에 대해서 Loss에 계산하고 그걸 다 더해서 Cost를 계산하고 그걸 가장 줄여주는 w와 b를 찾자
    <br><br>
- Parametric Approach (모수적 접근방법)
    - 함수를 찾는 문제 -> Parameter를 찾는 문제로 바뀜
    - Parameter = w, b
    - 함수를 찾는 문제에서 변수를 찾는 문제로 축소되었다.
    <br><br>
- Non-Parametric Approach
    - Decision Tree
<br><br>    
- 1차 함수의 한계
    - (1차 함수가 사는 공간 안에서) 데이터를 가장 잘 설명하는 함수를 찾았다.
    - 1차 함수는 우리가 원하는 관계를 설명하기에는 너무 단순하다.
<br><br>
- 관심 대상의 확장
    - (1차 함수를 포함하는)모든 2차 함수가 사는 공간으로 우리의 관심 대상을 확장
    - 확장된 공간에서 우리가 가진 데이터를 가장 잘 설명하는 함수를 찾자.

## 2-1-3. Hypothesis
- 우리가 세운 가설 중에서, 가장 설명력이 뛰어난 w와 b를 찾자는 것!
    - Hypothesis를 설정하는 경우의 장점
        - 선택할 수 있는 함수의 범위를 크게 줄여준다.
        - 모든 함수가 사는 공간에서 뽑는 게 아니라 제한된 영역에서 사는 공간에서 뽑으면 되기에 문제가 훨씬 쉬워진다.
        - 함수를 찾는 문제 -> w, b를 찾는 문제로 바뀜 (모수적 접근 방법, Parametric Approach)

## 2-1-4. Capacity
- 1차 함수
    - 1차 함수는 Capacity가 부족하다.
        - 1차 함수는 우리가 가진 데이터를 표현할 수 있는 능력이 없다.
<br><br>
- 2차 함수
    - (Capacity가 조금 더 높은 2차 함수를 선택해서) 우리가 가진 데이터를 사용해서 러닝 알고리즘을 통해서 가장 데이터를 잘 설명하는 w와 b를 찾자
        - 우리가 가진 데이터의 비선형성을 더 잘 설명한다.
        - 추세가 일치하는 경향성을 갖다가 우리는 선형성(Linearity - 직선과 비슷한 양상)라고 부른다. 
        - 데이터를 보면 선형적으로 움직이지 않고, 비선형적으로 움직인다.
        - 그래서 비선형적인 관계를 모델링하기 위해서 2차 함수를 사용한다.
<br><br>
- 3차 함수
    - (3차 함수로 우리가 가진 데이터를 모델링 하면) 모델의 성능이 더 좋을 것인가?
    - 판단 기준이 Cost였다면, 2차 함수보다 3차 함수가 더 나은 모델이라고 정량적으로 얘기할 수 있다(바로 아래의 Cost 글 참조)
<br><br>
- Cost
    - 모든 데이터의 Loss를 다 더해서 계산한 값이 Cost
    - Loss는 예측값과 실제값의 차이를 계산해서 제곱한 값
        - loss = (예측 - 실제)^2
    - 함수가 늘어나면 Cost가 줄어들게 된다.
        - 통계학에서는 R-Squared라고 함.
        - 변수를 추가하면 추가할수록 R-Suqared가 낮아진다.
    - 판단 기준이 cost였다면, 2차 함수보다 3차 함수가 더 나은 모델이라고 정량적으로 얘기할 수 있다.
<br><br>
- 질문: 차수가 하나 늘어날 수록 curve가 꺾이는 것인가?
    - 꼭 그렇지 않다.
- - -
2-2. Overfitting과 Underfitting
=================
## 2-2-1. Overfitting (과적합)
- Hypothesis 9 : 9차 함수
    - 9차 함수는 Cost가 0이다.
    <br><br>
    - Cost를 모델의 판단 기준으로 삼기로 했다면, 9차 함수는 좋은 모델이다.
    <br><br>
    - 허나 (상식적으로 생각한다면) 좋은 모델이 아니다. 왜?
        - 새로운 Data가 들어오면, 말도 안 되는 수치가 나오기에.
        <br><br>
    - 그말인 즉슨, __'새로운 데이터에 대한 예측력이 떨어진다'__는 뜻이다.
        - __우리가 가지고 있는 데이터로 모형(Machine, Model)을 만들어서, 새로운 데이터가 들어왔을 때 잘 예측하는 게 목표인데...__
        - 우리가 가지고 있는 데이터는 잘 설명하는데(Cost=0이니까), 새로운 데이터에 대한 설명력이 감소한다.
        - 가지고 있는 데이터로 평가해봤자 아무짝에도 쓸모가 없다
        - __Overfitting(과적합)__: 과하게 맞추다.

## 2-2-2. Underfitting (오적합)
- 1차 함수는 너무 단순해서, 우리가 가지고 있는 데이터조차 설명을 잘 하지 못한다.
<br><br>
- 모든 건 다 Capacity 때문에 발생하는 것이다.
    - 1차 함수는 Capacity가 너무 낮다, 9차 함수는 Capacity가 너무 높다.
		- 1차 함수는 우리가 가지고 있는 데이터 조차 너무 표현하기 어렵고, 9차 함수는 가지고 있는 데이터에 너무 잘 맞춰져 있다.
    <br><br>
    - 우리는 가장 적절한 Capacity를 찾는 모델이 필요하다.
    <br><br>
    - ML을 할 때, 일반적으로 Underfitting은 잘 안 일어난다. 왜냐면 우리가 사용하는 모델들이 기본적으로 Capacity가 높기 때문에.
    <br><br>
    - Overfitting이 정말 많이 일어난다. 극도로 경계해야하는 문제.
		- ML System을 Design할 때, 가장 신경써서 해결해야 할 문제가 Overfitting이다.
			- ex) 금융 : 삼성전자 주식 (2010~2017년) 데이터로 모델을 만들어서 내일의 주가를 예측하면? -> 망한다.
			- 금융에서는 __백테스팅__을 한다. 우리가 배우는 개념을 금융에서는 백테스팅이라고 부른다.

## 2-2-3. Underfitting, Overfitting은 상대적
    - 1,000개의 데이터에 99,000개를 모아서 넣는다면, 1000개의 데이터에서 관측하지 못했던 새로운 구조가 드러난다. 
		- 그러면 1, 3, 9차 함수를 통해서 우리가 가진 데이터를 모델링 해보자!
			- 1, 3, 9차 함수 모두 우리가 가진 데이터의 구조를 잘 표현하지 못했다. (Underfitting)   
- Overfitting / Underfitting 비교할 수 있는 정량적인 양을 [Bayes Error](http://newsight.tistory.com/127)라고 한다.
<br><br>
- Underfitting의 문제
    - 데이터를 빼야할까?
		- 그건 좋은 방법이 아니다.
        <br><br>
    - 구조를 더 잘 모델링하기 위해서 (무지막지하게) 차수를 높이면 된다?
		- 근데 그것도 좋은 방법이 아니다.
		- (0.01)^100 = 1e-200 (10에 - 200승, 10에 200승 분의 1)
        <br><br>
    - Overflow와 Underflow 문제
		- Underflow : 다 0이라고 계산하는 문제
		- Overflow : 예를 들어서 컴퓨터가 표현할 수 있는 수가 -10000 ~ 10000까지 인데, 10001을 입력하면 컴퓨터는 10001이 아니라 -10000으로 인식하는 문제가 발생
        <br><br>
    - 지금의 경우는 Underflow의 문제가 발생할 수 있다.
    <br><br>
    - (좋은 머신이 있으면 문제가 없겠지만) 단순히 차수를 높여가는 모델은 한계가 있을 수 밖에 없다. 좋은 아이디어가 아니다.
    <br><br>
    - 그래서 우리는 신경망 모델이나 의사결정나무에 기반한 모델을 사용한다.

## 2-2-4. 기타 모델들
- 다층퍼셉트론(신경망)
<br><br>
- 의사결정나무
<br><br>
- 랜덤포레스트 : 의사결정나무 수천 개를 평균해서 만든 것
<br><br>
- 현업에서 사용한다면 랜덤포레스트가 좋다.
    - 위에 모델들은 9차 함수보다 좋은 성능을 보인다.
<br><br>
- 그래서 우리는 Capacity가 높은 모델군들이 필요하다.
    - 우리가 더 많은 모델을 배우고자 하는 이유
<br><br>
- 데이터가 충분히 많아지면, 숨겨졌던 구조가 더 잘 드러나게 된다.
    - 데이터의 구조가 복잡하고, 데이터가 많기만 하면 뭐하나?
		- 그 구조를 정확하게 모델링할 수 있는, 정확하게 표현할 수 있는, 그 능력(Capacity)을 가진 모델들이 필요한 것
		- 그게 흔히 Deep Learning이 해주는 일이다.
		- 딥러닝 모델의 Capacity는 어마어마하게 크다.
		- 그래서 두 개가 만났을 때, 좋은 성능을 보여준다.
<br><br>
- 데이터가 (상대적으로) 적은데, 모델 Capacity가 (상대적으로) 작다. 그러면 Underfitting의 문제가 일어난다.
    - 근데 실제로는 잘 일어나지 않는다.
<br><br>    
- (상대적으로) 데이터가 충분히 많지 않음에도 불구하고, 모델 Capacity가 너무 커버리면 Overfitting의 문제가 발생한다. 
    - 이런 문제가 더 자주 발생하고, 더 중요하다.
    - __데이터의 수, Capacity는 상대적이다__

## 2-2-5. Overfitting의 문제를 해결하려면__
    - 1) 데이터를 무지하게 많이 모은다. Capacity 높은 모델이 Big Data를 때려 넣는다.
    - 2) (더 모을 수 없는 상황이라면) 모델 Capacity를 제한하면 된다.
        - 더 작은 차수를 쓰도록 Hypothesis를 바꿔준다.
    - 3) (그게 아니라면) 9차 함수를 쓰기는 쓰되, 러닝 알고리즘을 바꿔준다.
        - 학습하는 과정에서 우리가 가진 데이터에 너무 잘 맞지 않게끔 패널티를 줄 수 있다.
        - regularization :  http://gnujoow.github.io/ml/2016/01/30/ML4-Regularization/

## 2-2-6. Overfitting 해결 방안, 1줄 요약
    - 데이터를 만들거나, 더 작은 차수의 모델을 쓰거나, 함수의 차수를 그대로 쓰되 러닝 알고리즘을 변경하면 된다.
<br><br>
- 질문
    - Cost Function
		- Cost Function 값을 가지고 아무 것도 판단할 수 없다.
		- 판단할 수 있는 유일한 건 우리가 선택한 모델이 우리가 가진 데이터를 얼마나 잘 설명했는가?
		- __어떤 모델이 좋고 나쁜지를 가리기 위해서 새로운 선택 기준이 필요하다.__
		- 그걸 Cost라 하지 않고 앞으로는 Train이라고 한다.
- - -
2-3. Training Error(이하 T.R)와 Generalization Error(일반화 오류, 이하 G.E), Statistical Learning Theory, Basic Terminology, Structural Risk Minimization & Empirical Risk Minimization
===
## 2-3-1. Training Error
- training set: 모델을 훈련시키는데 사용하는 데이터
<br><br>
- training set을 사용해서 학습 시킨 모델이 우리가 가진 training set을 얼마나 잘 설명하고 있는지를 나타내주는 척도
<br><br>
- (cost값은 cost값인데)학습이 끝난 후의 cost값이다.
<br><br>
- model의 Capacity가 높아지면 높아질수록 training error는 무조건 줄어든다.
<br><br>
    - Capacity가 높아진다는 건 모델의 기억력이 늘어난다는 얘기와 같음
    <br><br>
    - 모델의 기억력이 늘어난다는 건,
		- (모델이) train set을 암기해버리는 사태가 발생한다.
		- 그게 바로 __overfitting__
		- 나는 암기하는 게 아니라 실제로 training set을 이해하고, 일반화 시켜주는 작업을 모델에 적용시키고 싶은데
		- Capacity가 높으면 단순히 암기하는 결과를 내뱉어주는 암기 머신에 불과하다.
		- 그 경우가 overfitting이고, 우리는 그 경우를 방지해야 한다. 

## 2-3-2. Generalization Error
    - 모델이 Training set을 가지고 일반화를 했는데, 그 일반화한 결과에 얼마나 오류가 있을 것인가에 대한 양
- 그런데 일반적으로 측정할 수가 없는 양이다.
    - 새로운 데이터가 없다는 뜻으로, 일반적으로는 측정이 불가능하다.
<br><br>
- (G.E를 구하는)대신에 우리는 Data를 두 개로 쪼갠다.
    - 그래서 G.E를 어떤 식으로 추측(추정)할 것인지 배워볼 것이다.
    - 그전에 이거부터 배울 것이다.
<br><br>
- 우리는 이전에 모델한테 '우리가 가진 Training Set을 가장 잘 설명하는 함수를 찾아봐'라고 얘기해줬다.
<br><br>
    - T.R(Cost, Loss)의 최소화
    <br><br>
    - 우리가 실제로 하고 싶었던 건, __Training Error를 낮추는 게 아니라, Generalization Error를 제일 낮추는 것__이었다.
    <br><br>
    - __일반적으로 G.E를 낮추는 건 불가능__하다.
    <br><br>
    - G.E를 낮추고 싶지만, 그럴 수 없으니까 __대신에 T.R를 낮추는 모델__을 만들기로 함
    <br><br>
    - 그렇게 선택한 모형이 과연 G.E도 낮출 것인가?
    <br><br>
    - 아니라면 그 둘은 얼마나 차이가 날 것인가?
    <br><br>
    - 그걸 이론적으로 분석한 학문이 Statistical Learning Theory다.

## 2-3-3. Statistical Learning Theory
- 통계적 학습이론에서 가장 중요한 부등식
<br><br>
- G.E는 T.E보다 높을까 낮을까?
<br><br>
    - Training Set을 우리가 모델을 Training하는데 썼으니까 당연히 모델의 T.R는 낮을 것이다(낮추는 방향으로 학습했으니까!)
    <br><br>
    - 새로운 데이터가 들어오면 에러는 당연히 T.R보다 높을 수밖에 없다.
    <br><br>
    - 그러면 얼마나 높을 것인가?

## 2-3-4. Basic Terminology
- 새로운 데이터를 구하기 어려우니까, 기존의 데이터를 나눠서 훈련으로 모델링을 한 다음에 테스트를 한다!
<br><br>
- 일반적으로 G.E가 T.R보다는 높다.
<br><br>
    - 부등식이 말해주는 건, T.R보다는 커도, T.R + @ 보다는 작다는 것이다.
    <br><br>
    - __T.R + e >= G.E >= T.R__
		-  영희의 키(168) + e >= 철수의 키 >= 영희의 키(168) ??
        <br><br>
    - e의 값이 작으면 작을수록 좋다.
		- 영희의 키에 더해주는 'e' 값이 작으면 작을수록 철수의 키를 더 정확하게 말할 수 있으니까.
        <br><br>
    - 우리는 e값이 작아지기를 원한다.
    <br><br>
    - 작아야 G.E가 저 범위 안에 들어갈 것이라는 것을 Guarantee할 수 있으니까
    <br><br>
    - n은 트레이닝 데이터의 개수
		- __데이터를 많이 모으면 루트 안의 값이 작아진다(값이 낮으면 좋은 것).__
        <br><br>
    - D는 Model의 Capacity임.
		- D가 커지면 루트 안의 값이 커진다.
		- __이 값을 줄이기 위해서는 데이터를 많이 모아야 하고, Capacity를 줄여야한다.__
        <br><br>

- 왜 그런 결과들이 발생했는지 이론적으로 조금이나마 이해해볼 수 있게 되었다.
<br><br>
- 얘는(?) 데이터가 많으니까(n이 크니까), 루트 안의 값이 작아져서 G.E와 T.R 거의 비슷해졌다. 그러니까 overfitting이 발생하지 않았다고 해석할 수 있게 되었다.

## 2-3-5. Structural Risk Minimization & Empirical Risk Minimization
- Training Error를 줄이는 게 아니라, e값을 줄여버리면 되지 않겠느냐?
    - __Structural Risk Minimization__ (구조적 위협을 최소화하는 것)
    <br><br>
- 계산하는 게 너무 어렵기 때문에, T.R를 최대한 줄여라. 그러면 그 모델의 G.E도 작을 것이다.
    - T.R를 줄이는 방향으로 학습시키는 방법 : __Empirical Risk Minimization__ (경험적인)
		- 관측할 데이터를 가지고 loss(cost)를 최소화 시켜라.
		- 그렇게 만든 모델이 새로운 데이터에 대한 예측력도 나쁘지 않을 것이라고 생각하고 학습을 시킴
		- 머신러닝에서 무조건 이 방법을 사용함

## 2-3-6. 요약
- 모델의 capacity가 높아지면 기억력이 좋아지기 때문에 Training Error는 무조건 줄어든다.
- (일반화된 결과를 뱉어줘야 하는데, 암기한 결과만 뱉어주니까) 새로운 데이터에 대한 예측력이 떨어진다.
- Generalization Error를 제일 낮추는 Optimal한 최적의 Capacity를 찾자!
- - -
2-4. K-Fold Cross Validation
===
## 2-4-1. Test Error의 본질 (대부분의 사람들이 실수하는 개념)
- 768개의 Data Set이 있다면 ...
    - 일반적으로 70%는 Training Set, 30%는 Test Set으로 나눈다.
    - Training Set을 통해 학습하고, 학습한 모델이 나온다.
    - Test Set에는 Input도 있고 Output도 있다.
		- Test set에 있는 Input을 기계(모형)에 넣어서 Output을 예측하게 한 다음에
		- 두 개가 얼마나 차이가 나는지 본다.
			- maen((y - y_hat)^2)
			- y는 실제값, y_hat은 예측값(추정치)
<br><br>
    - mean(y - y_hat_n)^2
		- 거기에서 나온 게 Test Error
			- Test Error가 가장 낮은 모형을 선택해야 할까?
			- Training Error는, 높은 차수의 모델이 가장 낮을 것이지만
			- Test Error는 그렇지 않다.
			- 그래서 우리는 Test Set에 대한 Error가 가장 낮아지는 모형을 선택할 것인가?
			- 틀린 이야기다.
<br><br>
    - Generalization Error는 측정할 수 없다.
        - 측정할 새로운 데이터가 없기에, 대신에 우리가 가지고 있는 Train Set을 두 개로 쪼개서 하나는 Train Set, Test Set으로 만든다.
        - 새로운 데이터를 모델이 얼마나 잘 예측하는지 보겠다는 것.
<br><br>
- Generalization Error에 대한 추정치가 Test Error(T.E)다.
    - T.E는 G.E를 최대한 정확하게 추정하기 위해서 필요한 세트다.
    - T.E와 G.E는 최대한 비슷해야 된다.

## 2-4-2. 적절한 Capacity와 적절한 Training Error
- 차수가 낮을 때는 Underfitting 현상이 일어나기 때문에 Test Error가 높다.
- 차수가 높을 때는 Overfitting 현상이 일어나기 때문에 Test Error가 높다.
    - Cost의 관점에서 Training error 가 낮은 게 좋지만 그렇다고 무조건 Capacity가 높아서는 안 된다.
    - Test Error가 높아지기 때문이다.
    - Capacity가 높은 모델의 Test Error가 늘어나는 이유는 모델이 Training Set을 너무 잘 기억해서 Overfitting 현상이 일어나기 때문이다.

## 2-4-3. 요약
    - Underfitting과 Overfitting이 안 일어나는 가장 적절한 Capacity를 찾는 게 목표

## 2-4-4.  K-Fold Cross-Validation
<img src = "https://raw.githubusercontent.com/qingkaikong/blog/master/2017_05_More_on_applying_ANN/figures/figure_1.jpg">
- 단순히 Training Set을 두 개로 쪼개서 평가하는 방식은 변동성이 크다
- Training Set을 임의로 K 등분한다.
    - Training Set을 K등분으로 Test Set과 Training Set을 나누는 것
    - 데이터를 K번 반복(교체)하며 검증을 진행
- K개의 Test Error를 평균해서 최종 Test Error를 사용한다.
- 변동성이 적은 Test Error를 얻을 수 있음
- 모델을 K번 만든다. 계산 시간이 더 오래 걸리는 대신에 더 좋은(변동성, 분산이 적은) Generalization Error에 대한 추정치를 얻을 수 있다.

## 2-4-5. Leave-One-Out Cross-Validation
<img src = "https://smlee729.github.io/img/2015-03-19-1-loocv/loocv1.png">
- 계산을 데이터의 개수만큼 한다.
- 데이터가 10만 개라면, 10만 번 한다.
- 모델 1개를 계산하는데 1초가 걸린다면, 10만 초가 걸린다.
- 일반적으로 loocv는 k-fold CV보다 안 좋다.
- 가지고 있는 데이터가 극단적으로 적을 경우에 사용한다.

## 2-4-6. 요약 1
    - Test Set Train Set을 어떤 식으로 나누느냐에 따라서 결과의 변동성이 심하다.
    - 데이터가 작을 때 Validation Set Approach는 옳지 않다. LOOCV
    - K-Fold Cross Validation이 일반적인 교차검증 방식이다. K는 일반적으로 5~10 정도 사용한다.
    - K는 자원이 허락하는 만큼 계산을 5~10번 한다.
    - 소규모 데이터 : LOOCV
    - 중규모 데이터 (1~100 mb) : K-Fold Cross Validation Approach
    - 대규모 데이터 : Validation Set Approach

## 2-4-7. 요약 2
- Test Set을 따로 떼어 놓는 이유
    - Test의 역할은 G.E를 최대한 정확하게 추정하는데 본질이 있다.
        <br><br>
    - G.E : Model을 Training하는데 사용하지 않은(Model이 한 번도 본적이 없는) Data의 Error
        <br><br>
    - Train Set과 Test Set만 나눌 경우의 문제(2등분의 문제)
        - 각각의 Model의 Test를 확인하고, 가장 작은 걸 선택한다.
        - 세 개의 Model 중에서 마지막 Model을 선택했다는 건, 직접적으로 Training Set을 사용한 것이다.
        - 세 개의 Model 중에 하나를 선택하는 과정 중에 우리는 무엇을 사용했는가?
            - Test Set을 사용함. 10차 함수는 간접적으로 Test Set을 본 것과 다름 없다.
            - __Test Set은 모델이 전혀 본적이 없는 데이터를 추정하는데 쓰이는 게 본질.__
            - 허나 봤음... Test Set이 오염 됐다.
            - 다른 데이터가 있어야 한다. 그래서 데이터가 2등분이 아니라 3등분을 해야한다.
                <br><br>
    - Training Set과 Test set 외에 Data Set(Validation Set)이 필요하다.
        - Training Set // Validation Set // Test Set
            - Train Set : Model Training
            - Validation Set : 모델을 추정하고 선택 (Error Check)
            - Test Set : 훈련되고, 선택된 모델의 G.E를 정확하게 추정하게 되는데 사용하는 데이터
                <br><br>
- [IBM Watson 아주대병원 사례](http://news.chosun.com/site/data/html_dir/2018/01/10/2018011002828.html)
    - 질병 예측 < 의사의 소견
        - Test Set과 Training Set의 구분을 모호하게 했음
        - 오염된 Test Set을 사용
        - 새로운 데이터에 대한 예측력이 떨어졌다.
        - Test Set으로 추정했던 Generalization Error가 더 낮아지는
        - 통계적으로 Bias 되는 현상(Underestimate)이 발생한다.
            <br><br>
    - Test Set은 끝까지, 최후까지 남기는 건 굉장히 중요하다.

## 2-4-8. 질문
- 현업에서는 두 가지만 쓰는 경우가 종종 있는데?
    - 실제로 Test Set 없이, Train Set과 Validation Set만 가지고 함.
    - 굳이 정확한 Generalization Error에 대한 얼마가 될 건지 알 필요 없이 가장 좋은 모델을 선택해야할 때,
    - 그렇게 되면 새로운 데이터가 들어왔을 때, Error가 어느 정도 될지 말할 수 없다.
    - 그럴 때 Test Set이 필요하다.
    <br><br>
- 데이터를 나누는 비율
    - (중규모) 6:2:2 / (대규모) 9:1 or 8:2
