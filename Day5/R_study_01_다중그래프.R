## 다중그래프
par(mfrow=c(2,2), mar=c(3,3,4,2)) # 화면분할 2x2

hist(iris$Sepal.Length,                 # 그래프 1
     main = '붓꽃 꽃받침길이',
     col = 'orange')

barplot(table(mtcars$cyl),              # 그래프 2
        main = '자동차 실린더',
        col = c('red','green','blue'))

barplot(table(mtcars$gear),             # 그래프 3
        main = '자동차 기어수',
        col = rainbow(3), horiz = T)

pie(table(mtcars$cyl),                  # 그래프 4
    main = '자동차 실린더',
    col = topo.colors(3),               # topo 팔레트 사용
    radius = 2)

par(mfrow=c(1.1), mar=c(5,4,4,2)+.1)    # 화면분할 취소소
par(mfrow=c(1.1))

## LAB
install.packages('carData')
library(carData)
ds <- Chile
colors <- rainbow(20) # 레인보우팔레트에서 20색 선택

# 화면을 2행 3열의 레이아웃으로 분할
par(mfrow = c(2,3))

# 지역별, 성별, 교육수준별 막대그래프 작성 (첫번째 행)
barplot(table(ds$region), main = '지역별 분포', col = colors[1:5])
barplot(table(ds$sex), main = '성별 분포', col = colors[6:7])
barplot(table(ds$education), main = '교육수준 분포', col = colors[8:10])

# 연령, 수입, 정책지지도에 대한 히스토그램 (두번째 행)
hist(ds$age, breaks =  6, main = '연령', xlab = 'age', col = colors[1:6])
hist(ds$income, breaks =  4, main = '수입', xlab = 'income', col = colors[11:14])
hist(ds$statusquo, breaks =  9, main = '정책 지지도', xlab = 'support', col = colors[15:20])

par(mfrow = c(1.1)) # 화면 레이아웃 초기화


## 종업원 팁 정보 그래프
library(reshape2)
str(tips)

#색상
color.6 <- rep('#a8dadc',6)
color.6[2] <- '#1D3557'
color.4 <- rep('#a8dadc', 4)
color.4[2] <- '#1d3557'
color.4[3] <- '#457b9d'
par(mfrow = c(2,2))

# 성별, 요일, 시간대, 인원별에 따라 그래프 작성
# 그래프마다 색을 넣어 강조하여 표현
barplot(table(tips$sex), main='성별', col=c('#a8dadc', '#1d3557'))
barplot(table(tips$day), main='요일별', col=color.4)
barplot(table(tips$time), main='시간대별', col=c('#1d3557', '#a8dadc'))
barplot(table(tips$size), main='인원수별', col=color.6)
par(mfrow = c(1,1))

# 1인당 주문금액과 팁을 주는것이 관련이 있는지
# perHead라는 새로운 열을 만들어 저장
tips.new <- tips
tips.new$perHead <- tips.new$total_bill / tips.new$size

color.5 <- rep('#a8dadc',6)
color.5[2] <- '#1D3557'

# 1인당 주문금액을 전체, 런치, 디너로 추출하여 그래프작성, 비교
par(mfrow = c(1,3),      # 1행 3열 레이아웃 분할
    mar = c(5,4,4,2)+.1) # 레이아웃 사이즈
                         # 아래, 왼, 위, 오 순서

hist(tips.new$perHead,        # 불러올 데이터
     main = '1인당 주문금액', # 그래프 타이틀
     breaks = 5,              # 간격
     xlab = '단위:달러',
     col = color.5)      # x축 이름
hist(tips.new[tips.new$time == 'Lunch', 'perHead'],
     main = '1인당 주문금액(런치)', breaks = 4,
     xlab = '단위:달러',
     col = color.5)
hist(tips.new[tips.new$time == 'Dinner', 'perHead'],
     main = '1인당 주문금액(디너)', breaks = 4,
     xlab = '단위:달러',
     col = color.5)
par(mfrow = c(1,1))   # 레이아웃 초기화

# 주문 금액 대비 받은 팁의 비율
tips.new$percent <- tips.new$tip / tips.new$total_bill * 100
par(mfrow = c(1,2))
res.lunch <- hist(tips.new[tips.new$time == 'Lunch', 'percent'],
                  main = '주문 금액 대비 팁의 비율(런치)',
                  xlab = 'percent(%)',
                  breaks = 5)
res.Dinner <- hist(tips.new[tips.new$time == 'Dinner', 'percent'],
                  main = '주문 금액 대비 팁의 비율(디너)',
                  xlab = 'percent(%)',
                  breaks = 10)
par(mfrow = c(1,1))

res.lunch
res.Dinner
res <- rbind(lunch = c(0, res.lunch$counts), dinner = res.Dinner$counts[1:6])
colnames(res) <- res.Dinner$breaks[2:7]

barplot(res, main = '식사 시간에 따른 팁 비율 분포',
        col = c('#1d3557', '#a8dadc'),
        legend.text = c('Lunch', 'Dinner'))














