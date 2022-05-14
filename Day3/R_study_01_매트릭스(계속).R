## 매트릭스 계속
z <- matrix(1:20, nrow=4, ncol=5, byrow=T)
z

x <- c(20,25,30,35)
x

m1 <- cbind(z,x) # 열기준 결합
m1

y <- c(36:41)
y

m2 <- rbind(m1, y) # 행기준 결합
m2

# 값추출
m2[1,3]
m2[1,6]
m2[1,7]

z
z[1,] # 1행 좌라락
z[,1] # 2행 좌라락
z[2,1:3] # 2행 1~3열까지
z[2,c(1,2,4)]
z[1:2,]
z
z[1:2,-c(2,4)] # -붙이면 여집합합
z[,c(1,4)]


# 매트릭스 이름붙이기
score <- matrix(c(90,85,69,78,85,96,49,95,90,80,70,60),
                nrow = 4)
score
# 행의 이름 붙이거나 출력할 때
rownames(score) <- c('john','tom','mark','jane')
# 열의 이름 붙이거나 출력할 때
colnames(score) <- c('english','math','science')
score

score['john','math']
score['tom', c('math','science')]
score['mark',]      
score[,'english']
rownames(score)
colnames(score)
colnames(score)[2]

## LAB 햄버거 영양성분 정보
burger <- matrix(c(514, 917,11,533,853,13,566,888,10),
                 nrow = 3,
                 byrow = T)
burger
rownames(burger) <- c('M','L','B')
colnames(burger) <- c('열량','나트륨','포화지방')

burger['M','나트륨']
burger['L',]


# 데이터프레임
physicals <- matrix(c(168.4,169.5,172.1,185.2,173.7,175.2,62.4,65.3,59.8,46.5,49.8,58.7),
                    ncol=2,
                    byrow = F)
physicals


## LAB2 햄버거 영양정보2
burger <- matrix(c(514, 917,11,533,853,13,566,888,10),
                 nrow = 3,
                 byrow = T)
burger
kcal <- c(514,533,566)
na <- c(917,853,888)
fat <- c(11,13,10)

rownames(burger) <- c('M','L','B')
colnames(burger) <- c('kcal','na','fat')
menu <- c('새우','불고기','치킨')
burger2 <- data.frame(kcal, na, fat, menu)
burger2

burger.sum <- burger2[,'na'] * burger2[,'fat']
burger.sum

##
dim(iris)        # 행과 열의 개수 보이기
nrow(iris)       # 행의 개수 보이기
ncol(iris)       # 열의 개수 보이기
colnames(iris)   # 열 이름 보이기, names()함수와 동일
head(iris)       # 데이터셋 앞부분 일부 보기
tail(iris)       # 데이터셋 뒷부분 일부 보기

str(iris)               # 데이터셋 요약 정보 보기
iris[,5]                # 품종 데이터 보기
levels(iris[,5])        # 품종의 종류 보기(중복 제거)
table(iris[,"Species"]) # 품종의 종류별 행의 개수 세기

colSums(iris[-5])    # 열별 합계
colMeans(iris[,-5])  # 열별 평균
rowSums(iris[,-5])   # 행별 합계
rowMeans(iris[,-5])  # 행별 평균

# 행과 열 방향 변환
z <- matrix(1:20, nrow = 4, ncol = 5)
z
t(z)

# 조건에 맞는 행과 열의 값 추출하기
ir.1 <- subset(iris, Species='setosa')
ir.1
ir.2<- subset(iris, Sepal.Length>5.0 &
                Sepal.Width > 4.0)
ir.2
ir.2[, c(2,4)]


## LAB 벚나무 판매하기
class(trees)
str(trees)

girth.mean <- mean(trees$Girth)

candidate <- subset(trees, Girth>=girth.mean &
                           Height > 80 &
                           Volume > 50)
candidate
nrow(candidate)

## LAB2 종업원 팁 계산하기
install.packages('reshape2')
library(reshape2)
tips

# 매트릭스인지 확인
is.matrix(tips)
class(tips) # 데이터프레임
# 처음 6개 관측값 출력
head(tips)
# str() 함수로 데이터구조 알아보기
str(tips) # 244개 관측값, 7개 열로 구성

# tips에서 요일별 팁을 받는 빈도 구하기
table(tips$day)
# 시간대가 Dinner와 Lunch인 경우로 나누어보기
dinner <- subset(tips, time=='Dinner')
lunch <- subset(tips, time=='Lunch')
dinner
lunch

table(dinner$day)
table(lunch$day)

# dinner와 lunch를 이용해 평균구하기
colMeans(dinner[c('total_bill','tip','size')])
colMeans(lunch[c('total_bill','tip','size')])

# 결제금액 대비 평균적으로 몇 퍼센트를 팁으로 주었는지
tip.rate <- tips$tip/tips$total_bill # 손님별 팁의 비율
mean(tip.rate) # 평균 팁의 비율