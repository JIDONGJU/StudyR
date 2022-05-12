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

## 카페 매출액 분석하기
# 메뉴별로 벡터를 생성해 판매량 요일순 저장
esp <- c(4,5,3,6,5,4,7)
ame <- c(63,68,64,68,72,89,94)
caf <- c(61,70,59,71,71,92,88)
# 메뉴별 판매량에 가격을 곱해 요일별 매출액
price <- c(2000, 2500, 3000)
names(price) <- c('esp','ame','caf')
price
sale.esp <- 2000 * esp
sale.ame <- 2500 * ame
sale.caf <- 3000 * caf

sale.esp
sale.ame
sale.caf
# 요일별 매출액, 요일 설정
sale.day <- sale.esp + sale.ame + sale.caf
sale.day
names(sale.day) <- c('월','화','수','목','금','토','일')
sale.day
# 요일별 매출액 합산 = 일주일 총 매출액
sum(sale.day)
sale.mean <- mean(sale.day)
sale.mean
# 각 요일 매출액과 평균 매출액을 비교, 평균이상 요일
good = names(sale.day[sale.day >= sale.mean])

cat('총 매출액', sum(sale.day), '원')
cat('평균 매출액', mean(sale.day), '원')
cat('평균 매출보다 매출액이 높은 요일은', good)

