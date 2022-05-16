## 제어문
# if문
job.type <- 'A'

if(job.type == 'B') {
  bouns <- 200
} else {
  bonus <- 100
}

print(bonus)

a <- 10; b <- 20
if (a>5 & b>5) {
  print(a*b)
}

# ifelse문
a <- 10; b <- 20
if (a> b) {
  c <- a
} else {
  c <- b
}

c <- ifelse(a>b , a, b)

# for문
for (i in 1:5) {
  cat(i, '') # print(i)
}

for (y in 1:9) {
  cat('2 x', y, '=', 2*y, '\n') # 간단한 구구단 2단
}

for (x in 1:9) {
  for (y in 1:9) {
    cat(x, 'x', y, '=', x*y, '') # 간단한 구구단 전체
  }
  cat('\n')
}

for (i in 1:20) {
  if (i %% 2 == 0) { # 짝수만 골라내기
    cat(i, '')
  }
}

# iris 꽃잎 크기 분류

## while문
sum <- 0
i <- 1
while (i <= 100) {
  sum <- sum + i # sum에 i 값을 누적
  i <- i + 1     # i 값을 1 증가시킴
}
print(sum)

## 사용자 정의 함수
mymax <- function(x,y) {
  num.max <- x
  if (y > x) {
    num.max <- y
  }
  return(num.max)
}

mymax(10,15)
a <- mymax(20,15)
b <- mymax(31,45)
print(a+b)

#
mydiv <- function(x,y=2) {
  result <- x/y
  return(result)
}
mydiv(x=10,y=3) # 매개변수 이름과 매개변수값을 쌍으로 입력
mydiv(10,3) # 매개변수값만 입력
mydiv(10) # x에 대한 값만 입력(y값이 생략됨)

#
myfunc <- function(x,y) {
  val.sum <- x+y
  val.mul <- x*y
  return(list(sum=val.sum, mul=val.mul))
}

result <- myfunc(5,8)
s <- result$sum
m <- result$mul
cat('5+8 =', s, '\n')
cat('5*8 =', m, '\n')

# 내장함수 apply()
apply(iris[,1:4], 2, max)
