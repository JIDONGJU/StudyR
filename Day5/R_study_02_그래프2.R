## 그래프2
# 원그래프(Pie chart)
favorite <- c('WINTER', 'SUMMER', 'SPRING', 'SUMMER', 'SUMMER',
              'FALL', 'FALL', 'SUMMER', 'SPRING', 'SPRING')
ds <- table(favorite) # 도수분포 계산
ds
pie(ds, main='선호 계절', # 원그래프 작성
    radius=1)

# 원그래프2
install.packages('plotrix')
library(plotrix)

pie3D(ds, main = '선호계절',
      labels = names(ds),
      labelcol = 'blue',
      labelcex = 1.0,
      col = c('brown','green','blue2','white'))

# 선그래프
month = 1:12                        # x축 데이터
late = c(5,8,7,9,4,6,12,13,8,6,6,4) # y축 데이터
plot(month, late,          # x축 y축
     main = '지각생 통계', # 제목
     type = 'l',           # 그래프의 종류 선택(알파벳)
     lty = 1,              # 선의 종류(line type) 선택
     lwd = 1,              # 선의 굵기 선택
     xlab = 'Month',       # x축 레이블
     ylab = 'Late cnt')    # y축 레이블블

# 선그래프 2개 이상
late1 = c(5,8,7,9,4,6,12,13,8,6,6,4)
late2 = c(4,6,5,8,7,8,10,11,6,5,7,3)
plot(month, late1,              # x축 y축
     main = 'Late students',    # 제목
     type = 'b',                # 그래프 종류
     lty = 1,                   # 선 종류
     col = 'red',               # 선 색상
     ylim = c(0,15),            # y축 길이
     xlab = 'month',            # x축 제목
     ylab = 'late cnt'          # y축 제목
     )
lines(month, late2,             # x축 y축
      type = 'b',               # 선 종류
      col = 'blue')             # 선 색상상
# plot()함수로 작성한 그래프 위에 lines()함수로 선을 겹쳐서 그림


## LAB
install.packages('DAAG')
library(DAAG)

View(science)
str(science)

ds <- table(science$like)
pie(ds, radius = 1,
    main = '선호 점수별 비율',
    col = rainbow(length(ds)))  # pie의 색 지정
    #radius = 1)                 # pie의 크기 지정

install.packages('plotrix')
library(plotrix)

ds <- table(science$State)
pie3D(ds, main = '주별 학생 비율',
      labels = names(ds),      # 파이별 레이블 지정
      labelcex = 1.0,          # 레이블의 폰트 크기
      explode = 0.1,           # 파이 간 간격
      radius = 1.5,            # 파이의 크기
      col = c('brown','green'))# 파이의 색 지정정


## 산점도 (분포와 관계)
wt <- mtcars$wt               # 중량 데이터
mpg <- mtcars$mpg             # 연비 데이터
plot(wt, mpg,                 # x축, y축
     main='중량-연비 그래프', # 제목
     xlab='중량',             # x축 레이블
     ylab='연비(MPG)',        # y축 레이블
     col='red',               # point의 색상
     pch=19)                  # point의 종류

# 아래 세가지 산점도 모두 동일
plot(mtcars$wt, mtcars$mpg)
plot(mtcars[,c('wt','mpg')])
plot(mpg-wt, data=mtcars)

vars <- c('mpg','disp','drat','wt') # 대상 변수
target <- mtcars[,vars]             # 대상 데이터 생성
head(target)
plot(target,                        # 대상 데이터
     main='Multi plots')

## IRIS
iris.2 <- iris[,3:4]              # 데이터준비
levels(iris$Species)              # 그룹 확인
group = as.numeric(iris$Species)  # 점의 모양과 색
group                             # group 내용 출력
color = c('red','green','blue')   # 점의 컬러
plot(iris.2,
     main = 'Iris plot',
     pch = group,
     col = color[group],
     xlab = '꽃잎 길이',
     ylab = '꽃잎 넓이',
     las = 1)
legend(x='bottomright', legend = levels(iris$Species),
       pch=(1:3), col = color.4[1:3])


## 호주의 사회복지서비스와 만족도 분석하기
# 데이터 불러와서 확인
library(DAAG)
str(socsupport) # 데이터의 구조 확인
help(socsupport) # 변수별 의미 확인

# 조사대상자의 연령별 비율 3차원 원그래프
library(plotrix)
ds <- table(socsupport$age)
pie3D(ds, main='연령 분포',
      labels=names(ds),        # 파이별 레이블 지정
      labelcex=1.0,            # 레이블의 폰트 크기
      explode=0.1,             # 파이 간 간격
      radius=1.5,              # 파이의 크기
      col=rainbow(length(ds))) # 파이의 색 지정

# 정서적 지원제도에 대한 점수분포
# 호주와 아닌 지역으로 나누어 상자그림 표현
boxplot(socsupport$emotional~socsupport$country,
        main='정서적 지원 제도 비교')

# 정서적지원제도에 대한 
boxplot(socsupport$emotional~socsupport$country,
        main='정서적 지원 제도 비교')

boxplot(socsupport$emotionalsat~socsupport$age,
        main='정서적 지원 제도 만족도 비교',
        col=rainbow(5))

group <- as.numeric(socsupport$gender)
color <- c('blue','red') #여-blue, 남-red s
plot(socsupport[,c('emotionalsat','tangiblesat','age')],
     pch=group,
     col=color[group])







