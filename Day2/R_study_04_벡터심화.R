## 벡터심화

## 산술연산
d <- c(1,4,3,7,8)
f <- 2+d
f
2*d
d*3-2

## 벡터연산2
v1 <- c(1,2,3)
v2 <- c('john','tom','jane')
v1
v2
v3 <- c(v1, v2)
v4 <- c(v1, T, F, v3)

## 벡터 사용 함수
datas = 1:10
datas
sum(datas)
sum(2*datas)
length(datas)
mean(datas)
median(datas)
max(datas)
min(datas)
sort(datas)
sort(datas, decreasing = T)
v3 <- sort(datas, decreasing = T)
v2 <- sum(datas) / length(datas)

var(datas)
sd(datas)
range(datas)
range(v3)

## 논리연산자
d <- 1:9
d
d >= 5
d[d > 5]
sum(d[d>5])
d == 5
condi <- d > 5 & d < 8 # &는 and
condi
