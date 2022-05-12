total = 50
total

d <- c(1,2,3,4,5,6,7,8)
d
d[1]
d[1:3]
d[c(1,3,7)]
d[seq(1,5,2)]
d[2]
d[-2] # 파이썬과 상이, -는 번호인덱스 빼고 출력(여집합)
d[-seq(1,5,2)]

e <- 1:10
e
e <- 10:1 #10에서 1까지 저장
e

## !~4월까지 1분기 매출액
sales <- c(640,720,680,540)
names(sales) <- c('M1','M2','M3','M4')
sales
sales[1] # 인덱스1번 매출액
sales['M2'] # M2 2월달 매출액
sales[c('M1','M2')] # 1,2월 매출액

# 벡터의 원소값 변경
v1 <- c(1,5,7,8,9)
v1
v1[2] <- 4
v1

## LAB 만기적금액 계산
customer <- c('kim','lee','park','choi','seo')
deposit <- c(5000000,4500000,4000000,5500000,6000000)
rate <- c(3.5, 3, 4, 5, 4.5)
period <- c(2, 2, 5, 7, 4)

names(deposit) <- customer
names(rate) <- customer
names(period) <- customer

kim_total <- deposit['kim'] * ( 1 *+ rate['kim'] / 100)^ period['kim']
kim_total

who <- 'kim'

sum <- deposit[who] * ( 1 *+ rate[who] / 100)^ period[who]
sum




