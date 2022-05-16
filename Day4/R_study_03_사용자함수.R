## 외부 파일 함수 실행
getwd()

source('myFunc.R') # 외부파일 함수 불러오기 import같은거

result <- mydiv(109, 6)
result

## 자격증 합격여부

sub1 <- c(14,16,12,20,8,6,12,18,16,10)
sub2 <- c(18,14,14,16,10,12,10,20,14,14)
sub3 <- c(44,38,30,48,42,50,36,52,54,32)
score <- data.frame(sub1,sub2,sub3)

source('determine.R') 

result <- determine(score)
result

result <- determine(head(score, 3))
result

## 조건에 맞는 데이터 위치 리턴 함수
score <- c(76,84,69,50,95,60,82,71,88,84)
which(score==69) # 성적이 69인 학생은 몇번째에 있나?
which(score>=85) # 성적이 85이상인 학생은 몇번째에 있나?
max(score)       # 최고 점수는 몇 점인가?
which.max(score) # 최고 점수는 몇 번째에 있나?
min(score)       # 최저 점수는 몇 점인가?
which.min(score) # 최저 점수는 몇 번째에 있나?

idx <- which(score <= 60)
idx              # 성적이 60이하인 값들의 인덱스
score[idx] <- 61 # 성적이 60이하인 값들은 61점으로 성적 상향조정
score            # 상향조정된 성적 확인

idx <- which(score >= 80) # 성적이 80이상인 값들의 인덱스
score.high <- score[idx]  # 성적이 80이상인 값들만 추출하여 저장
score.high                # score.high의 내용확인

## iris 꽃잎 길이가 5.0 이상인것
idx <- which(iris$Petal.Length > 5.0)
idx
iris.big <- iris[idx,]
iris.big
# 다르게 표현한것
str(subset(iris, iris$Petal.Length > 5.0))


## LAB 언어발달 상황진단 프로그램
install.packages('Stat2Data')
library(Stat2Data)

data(ChildSpeaks)
ChildSpeaks
str(ChildSpeaks)

# 개월수에 따라 등급 환산 m1에 저장 
idx <- which(ChildSpeaks$Age < 9)
ChildSpeaks[idx, 'm1'] <- 5
idx <- which(ChildSpeaks$Age >= 9 & ChildSpeaks$Age < 15)
ChildSpeaks[idx, 'm1'] <- 4
idx <- which(ChildSpeaks$Age >= 15 & ChildSpeaks$Age < 21)
ChildSpeaks[idx, 'm1'] <- 3
idx <- which(ChildSpeaks$Age >= 21 & ChildSpeaks$Age < 27)
ChildSpeaks[idx, 'm1'] <- 2
idx <- which(ChildSpeaks$Age >= 27)
ChildSpeaks[idx, 'm1'] <- 1
View(ChildSpeaks)

# 언어점수를 등급으로 환산하여 m2에 저장
idx <- which(ChildSpeaks$Gesell < 70)
ChildSpeaks[idx, 'm2'] <- 1
idx <- which(ChildSpeaks$Gesell >= 70 & ChildSpeaks$Gesell < 90)
ChildSpeaks[idx, 'm2'] <- 2
idx <- which(ChildSpeaks$Gesell >= 90 & ChildSpeaks$Gesell < 110)
ChildSpeaks[idx, 'm2'] <- 3
idx <- which(ChildSpeaks$Gesell >= 110 & ChildSpeaks$Gesell < 130)
ChildSpeaks[idx, 'm2'] <- 4
idx <- which(ChildSpeaks$Gesell >= 130)
ChildSpeaks[idx, 'm2'] <- 5
View(ChildSpeaks)

# ChildSpeaks 데이터셋에 total 열을 추가하고, m1과 m2를 합산해서 저장
ChildSpeaks$total <- ChildSpeaks$m1 + ChildSpeaks$m2

idx <- which(ChildSpeaks$total < 3)
ChildSpeaks$result[idx] <- '매우 느림'
idx <- which(ChildSpeaks$total >= 3 & ChildSpeaks$total < 5)
ChildSpeaks$result[idx] <- '느림'
idx <- which(ChildSpeaks$total >= 5 & ChildSpeaks$total < 7)
ChildSpeaks$result[idx] <- '보통'
idx <- which(ChildSpeaks$total >= 7 & ChildSpeaks$total < 9)
ChildSpeaks$result[idx] <- '빠름'
idx <- which(ChildSpeaks$total >= 9)
ChildSpeaks$result[idx] <- '매우 빠름'
View(ChildSpeaks)
