## 함수

y <- sqrt(100)
y

# 매개변수 : 프로그래밍에서 함수의 입력값을 받는 변수 = 파라미터
d <- c(1,7,4,2,3)
sort(d) # 기본값 오름차순
sort(d, decreasing = T) # 내림차순

##LAB paste()함수로 문자열 붙이기
paste('hello','world','!','this','is','R')
str <- paste('good','morning', sep =' / ')
str

a <- '나의 나이는'
b <- 20
c <- '입니다'
paste(a,b,c, sep = ' ')

a <- 1:12
b <- '월'
c <- paste(a,b,sep = ' ')
c

## 월별 매출액 분석하기

sales <- c(750,740,760,680,700,710,850,890,700,720,600,730)
names(sales) <- paste(1:12, '월', sep = '')
sales

sales['7월'] # 7월 매출액
sales['7월'] + sales['8월'] # 7,8월 매출액 합계
sales[7:8]
max.month <- sort(sales, decreasing = T)
max.month # 매출액 내림차순

sum(sales[1:6]) # 상반기 매출액 합계






