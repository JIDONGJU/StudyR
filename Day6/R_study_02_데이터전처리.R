## 데이터 전처리
z <- c(1,2,3,NA,5,NA,8) # 결측값이 포함된 벡터
sum(z)                  # 정상 계산이 되지 않음
is.na(z)                # NA 여부 확인
sum(is.na(z))           # NA의 개수 확인
sum(z, na.rm = T)       # NA를 제외하고 합계를 계산

z1 <- c(1,2,3,NA,5,NA,8) # 결측값이 포함된 벡터
z2 <- c(5,8,1,NA,3,NA,7) # 결측값이 포함된 벡터
z1[is.na(z1)] <- 0       # NA를 0으로 치환
z1
z3 <- as.vector(na.omit(z2)) # NA를 제거하고 새로운 벡터 생성
z3

## 2차원 결측값
iris.na <- iris
iris.na[1,2] <- NA
iris.na[1,3] <- NA
iris.na[2,3] <- NA
iris.na[3,4] <- NA
head(iris.na)

## 결측값 확인
for (i in 1:ncol(iris.na)) {
  this.na <- is.na(iris.na[,i])
  cat(colnames(iris.na)[i], '\t', sum(this.na), '\n')
}

## apply 함수
col_na <- function(y) {
  return(sum(is.na(y)))
}
na_count <- apply(iris.na, 2, FUN=col_na)
na_count

## 결측값 확인 (행별)
result <- rowSums(is.na(iris.na))
sum(result > 0)
sum(is.na(iris.na))

## 매트릭스 NA 제외 전처리
head(iris.na)
iris.na[!complete.cases(iris.na),]     # NA가 포함된 행들을 나타냄
iris.na[!complete.cases(iris.na)==F,]  # NA가 포함된 행들 제외한 나머지

iris.comp <- iris.na[complete.cases(iris.na),] # NA가 포함된 행들을 제거
head(iris.comp)

## LAB 전세계 통계데이터
library(carData)
str(UN)
head(UN)

col_na <- function(y){
  return(sum(is.na(y)))
}
apply(UN, 2, FUN=col_na)
length(UN$region)

mean(UN$lifeExpF, na.rm = T) # NA 제외하고 계산

tmp <- UN[,c('pctUrban','infantMortality')]
tmp <- tmp[complete.cases(tmp),] # NA 제거
colMeans(tmp)

tmp.asia <- subset(UN, region=='Asia') # 아시아국가 추출
mean(tmp.asia$fertility, na.rm = T) 


## 데이터 정렬
# 벡터 정렬(숫자)
v1 <- c(1,7,6,8,4,2,3)
v1 <- sort(v1) # 오름차순
v1
v2 <- sort(v1, decreasing=T) # 내림차순
v2

# 벡터 정렬(문자열)
name <- c('정대일','강재구','신현석','홍길동')
sort(name) # 오름차순
sort(name, decreasing=T) # 내림차순

# sort( ) 함수 : 값의 크기에 따라 값들을 정렬하는 함수
# order( ) 함수 : 값의 크기에 따라 값들의 인덱스(순서)를 정렬하는 함수
name <- c('정대일','강재구','신현석','홍길동')
order(name) # 오름차순
order(name, decreasing=T) # 내림차순
idx <- order(name)
name[idx] # 오름차순 정렬

# 매트릭스와 데이터프레임 정렬
head(iris)
order(iris$Sepal.Length)
iris[order(iris$Sepal.Length),] # 오름차순으로 정렬
iris[order(iris$Sepal.Length, decreasing=T),] # 내림차순으로 정렬
iris.new <- iris[order(iris$Sepal.Length),] # 정렬된 데이터를
저장
head(iris.new)
# 정렬 기준이 2개인 경우
iris[order(iris$Species, decreasing=T, iris$Petal.Length),]


## LAB 고속도로 교통사고 데이터
library(carData)
str(Highway1)

# 사고율(rate)을 기준으로 내림차순 정렬
Highway1[order(Highway1$rate, decreasing = T),]

# 구간의 길이(len)가 가장 긴 상위 10개 구간의 총 길이
tmp <- Highway1[order(Highway1$len, decreasing = T),'len']
tmp
sum(tmp[1:10])

# 일일교통량(adt)이 적은 하위 10개 구간의
# 일일교통량(adt),사고율(rate) 구하기
tmp <- Highway1[order(Highway1$adt),c('adt','rate')]
tmp
tmp[1:10,]

# 제한속도(slim)가 높은 상위 5개 구간의
# 길이(len), 일일교통량(adt), 사고율(rate) 구하기
tmp <- Highway1[order(Highway1$slim, decreasing = T),
                c('len', 'adt', 'rate')]
tmp
tmp[1:5,]
