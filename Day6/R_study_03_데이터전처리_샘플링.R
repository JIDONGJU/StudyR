## 샘플링
x <- 1:100
y <- sample(x,           # 데이터
            size = 10,   # 추출개수
            replace = F) # 비복원추출
y

# 1~150 숫자 중 50개를 임의로 추출하여 idx에 저장
idx <- sample(1:nrow(iris), size = 50, replace = F)
iris.50 <- iris[idx,]   # 50개의 행 추출
dim(iris.50)            # 행과 열의 개수 확인
head(iris.50)

## set.seed()
sample(1:20, size = 5)
sample(1:20, size = 5)
sample(1:20, size = 5)
set.seed(100)
sample(1:20, size = 5)
set.seed(100)
sample(1:20, size = 5)
sample(1:20, size = 5)


## 조합
combn(1:5, 3) # 1~5에서 3개를 뽑는 조합
combn(1:5, 4)

x <- c('red','green','blue','black','white')
com <- combn(x,2)
com

for(i in 1:ncol(com)) {
  cat(com[,i], "\n")
}

## LAB 편두통 데이터
library(carData)
str(KosteckiDillon)

# 전체 데이터에 대한 평균 치료일수(dos) 구하기
tot.mean <- mean(KosteckiDillon$dos)
tot.mean

# 샘플링 비율을 달리하면서 평균 치료일수(dos)를 구하여
# tot.mean과 차이 확인
for (rate in (1:5)*0.1) {
  set.seed(100)
  idx <- sample(nrow(KosteckiDillon), nrow(KosteckiDillon)*rate)
  sam.data <- KosteckiDillon[idx,'dos'] # 샘플링 데이터 추출
  tmp.mean <- mean(sam.data)            # 샘플링 데이터 평균
  cat('Diff:', rate, tot.mean-tmp.mean, '\n')
}

# 5개의 열로 구성된 데이터셋에서 열을 3개씩 짝지어서 새로운 데이터셋 생성
cbn <- combn(1:5 , 3)
ncol(cbn) # 조합의 개수


## 데이터 집계
agg <- aggregate(iris[,-5], by = list(iris$Species),
                 FUN=mean)
agg

aggregate(iris[,-5], by = list(품종=iris$Species), FUN=mean)

## LAB 전국 선거 통계데이터 분석
data('CES11')
str(CES11)

# 낙태금지(abortion)에 대한 전체적인 찬성/반대 비율
table(CES11$abortion)
table(CES11$abortion)/nrow(CES11)

# 낙태금지(abortion)에 대해 성별(gender)에 따른 찬성/반대 비유
agg <- aggregate(CES11[,'abortion'], by=list(성별=CES11$gender),
                 FUN=table)
agg.2 <- agg[,2]                      # yes/no 빈도수 부분만 추출
agg.2[1,] <- agg.2[1,]/sum(agg.2[1,]) # female yes/no 비율 계산
agg.2[2,] <- agg.2[2,]/sum(agg.2[2,]) # male yes/no 비율 계산
rownames(agg.2) <- agg[,1]
agg.2

# 낙태금지(abortion)에 대해 도시지역(urban)과 비도시지역(rural)의 찬성/반대 비율
agg <- aggregate(CES11[,'abortion'], by = list(지역=CES11$urban),
                 FUN=table)
agg.2 <- agg[,2]                      # yes/no 빈도수 부분만 추출
agg.2[1,] <- agg.2[1,]/sum(agg.2[1,]) # 도시외 지역 yes/no 비율 계산
agg.2[2,] <- agg.2[2,]/sum(agg.2[2,]) # 도시지역 yes/no 비율 계산
rownames(agg.2) <- agg[,1]
agg.2


## 실전분석 칠레 대통령 선거 여론조사
library(carData)
help(Chile) # 데이터셋에 대한 도움말 확인
str(Chile)

#결측값 확인, 결측값 제거, ch에 저장
sum(is.na(Chile)) # 결측값 개수 확인
ch <- Chile[complete.cases(Chile),] # 결측값 제거

#60%의 데이터를 샘플링
set.seed(100)
idx <- sample(nrow(ch), nrow(ch)*.6) # 60% 샘플링
ch60 <- ch[idx, ]
dim(ch60)

# 지역(region)별 인구(population) 내림차순 정렬
agg <- aggregate(ch60[,'population'], by=list(지역=ch60$region),
                 sum)
agg[order(agg$x, decreasing = T),]

# 여론조사 응답 결과(vote)확인(A:기권, N:반대, U:결정못함, Y:찬성)
table(ch60$vote)

# 성별별 찬성 비율
no.people <- table(ch60$sex)    # 여성, 남성 응답자수
tmp <- subset(ch60, vote=='Y')  # 찬성만 추출
agg <- aggregate(tmp[,'vote'], by=list(성별=tmp$sex), length)
yes.ratio <- agg$x / no.people  # 찬성 비율 계산
yes.ratio

# 지역별 찬성 비율
no.region <- table(ch60$region) # 지역별 응답자수
tmp <- subset(ch60, vote=='Y')  # 찬성만 추출
agg <- aggregate(tmp[,'vote'], by=list(지역=tmp$region), length)
yes.ratio <- agg$x / no.region  # 찬성 비율 계산
yes.ratio