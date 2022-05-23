## 데이터탐색
# 단일범주 데이터
library(carData)
str(Titanic)
tData <- Titanic
tData2 <- TitanicSurvival$
str(tData2)

room.class <- TitanicSurvival$passengerClass
str(room.class)

room.class
tbl <- table(room.class)

sum(tbl)
str(tbl)

barplot(tbl, main = '선실별 탑승객',
        xlab = '선실등급',
        ylab = '탑승객 수',
        col = c('black','gray','wheat'),
        names = c('1등실','2등실','3등실'))

tbl / sum(tbl)

pie3D(tbl, main = '선실별 탑승객 비율',
      radius = 1.5,
      labels = c('1등실','2등실','3등실'),
      col = c('skyblue','yellow','pink'),
      labelcex = 1.0,
      labelcol = 'black',
      explode = 0.1
      )

# 단일변수 수치형
View(state.x77)
grad <- state.x77[, 'HS Grad'] # 주별 고등학교 졸업률
str(grad)

summary(grad)     # 사분위수
var(grad)         # 분산
sd(grad)          # 표준편차

# 히스토그램
hist(grad, main = '주별 졸업률',
     xlab = '졸업률',
     ylab = '주의 개수',
     col = 'orange')

boxplot(grad, main = '주별 졸업률',
        col = 'orange')

# 졸업률이 가장 낮은 주
idx <- which(grad == min(grad))
grad[idx]

# 졸업률이 가장 높은 주
idx <- which(grad == max(grad))
grad[idx]

# 졸업률이 평균 이하인 주
idx <- which(idx < mean(grad))
grad[idx]

## 영국 폐질환 사망자 분석하기
ds <- read.csv('./day5/fdeaths.csv', row.names = 'year')
ds

my.col <- c('black','blue','red','green','purple','darkgray')
my.lty <- 1:6

plot(1:12,                       # x데이터
     ds[1,],                     # y데이터
     main = '월별 사망자 추이',  # 그래프 제목
     type = 'b',                 # 그래프 종류
     lty = my.lty[1],            # 선의 종류
     xlab = 'Month',             # x축 제목
     ylab = '사망자수',          # y축 제목
     ylim = c(300,1200),         # y축 범위
     col = my.col[1],            # 선의 색
     )
for (i in 2:6) {
  lines(1:12,                    # x데이터
        ds[i,],                  # y데이터
        type = 'b',              # 그래프 종류
        lty = my.lty[i],         # 선의 종류
        col = my.col[i]          # 선의 색
        )
}
legend(x = 'topright',           # 범례의 위치
       lty = my.lty,             # 선의 종류
       lwd = 2,
       col = my.col,             # 선의 색상
       legend = 1974:1979,       # 범례의 내용
       inset = c(0,0)
       )

## LAB 다국적 자동차 판매가격 데이터
library(DAAG)
View(carprice)

carprice$Price
range(carprice$Price)
summary(carprice$Price)

hist(carprice$Price,
     main = '자동차 타입별 빈도수',
     xlim = c(0,50),
     ylim = c(0,20),
     xlab = '자동차 가격대',
     ylab = '빈도',
     col = 'skyblue'
     )
#x축 눈금 추가
axis(side=1,at=seq(0,45,5))
#y축 눈금 추가
axis(side=2,at=seq(0,20,5))

idx <- which(carprice$Price==max(carprice$Price))
carprice[idx, c('Type','Price')]

## 다중변수 탐색(분석)
str(pressure)

plot(pressure$temperature, # x축 데이터
     pressure$pressure,    # y축 데이터
     main = '온도와 기압', # 그래프 제목
     xlab = '온도(섭씨)',  # x축 레이블
     ylab = '기압'         # y축 레이블
     )
