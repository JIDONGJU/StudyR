## 다중변수 데이터
# 데이터 확인
head(cars)
str(cars)

# 산점도의 작성
plot(cars$speed, cars$dist,
     main = '자동차 속도와 제동거리',
     xlab = '속도',
     ylab = '제동거리'
     )

# 상관계수 (속도와 제동거리)
cor(cars$speed, cars$dist)
# 0.8068949 강한 양의관계

# 데이터 확인2
st <- data.frame(state.x77) # 매트릭스를 데이터프레임으로 변환
head(st)
str(st)
View(st)

# 다중 산점도 작성
plot(st)

# 다중 상관계수
cor(st)

## LAB 경제지표 데이터 분석하기
str(longley)
head(longley)
View(longley)
df <- longley[,c('GNP','Unemployed','Armed.Forces','Population','Employed')]
df

plot(df)
cor(df)

getwd()
load('./result_sales_dt.RData')
save(result_sales_dt, file = './result_dt.RData')


## LAB 주택담보대출 데이터 탐색하기
install.packages('Ecdat')
library(Ecdat)
str(Hdma)

tbl <- table(Hdma$deny)
tbl <- tbl / sum(tbl)
tbl
names(tbl) = c('승인','거절')

barplot(tbl, main = '주택담보대출 승인/거절',
        col = c('green','yellow'),
        ylim = c(0,1),
        ylab = '비율'
        )

hist(Hdma$lvr, main = '주택가격대비 대출금 비율',
     col = rainbow(10),
     ylim = c(0,1200)
     )

df <- Hdma[, c('dir','hir','ccs','mcs')]
point.col <- c('green','red')
plot(df, col=point.col[Hdma$deny])

cor(df)
