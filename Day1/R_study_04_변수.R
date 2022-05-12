## 변수
total = 5050

cat('합계는',total)
# print('합계는', total) # Error

a <- 10
b <- 20
c <- a + b
a
b
c

## 변수명
a = 1
A = 1 # 대소문자 구별 a, A 다른 변수

# 알파벳 .(점)으로 시작
a <- 1
.a <- 1

# _(밑줄)이나 .(마침표) 끝에 가능
a_ = 1
a. = 1

# 특수문자, -(하이픈) 안됨
a? = 1 # Error
a-b <- 1

# 숫자나 _(밑줄)은 첫글자 안됨
1a = 1 # Error
_a = 1 # Error


# R에서 변수 특이점 . 허용
abs <- 80
mid <- 10
mid.sum <- mid + abs
mid.sum

10 / 0 # Inf 양의 무한대
-10 / 0 # -Inf 음의 무한대
sqrt(-2) # NaN 정의불가능값
val <- NULL
val

## 숫자형 변수
age.1 <- 20
age.2 <- 25
print(age.1 + age.2)
name.1 <- 'John'
print(age.1 + name.1) # Error
print(age.1 * name.1) # Error
  
## 논리형  
5 > 3
2 > 7  
a <- TRUE  
a  
b <- F
b
a1 <- NA # 결측값, 누락값
a1


## 소금물의 농도
## 변수 salt 소금양
## 변수 water 물의양
## 변수 result 농도
## 결과를 '소금 = * mg, 물 = * ml, 농도 = **%'
salt <- 10 # mg
water <- 100 # ml
result <- (salt / (salt + water)) * 100
cat('소금 =', salt, '물 =', water, 'ml:농도 =', result, '%')
