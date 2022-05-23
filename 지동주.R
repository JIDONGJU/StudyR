# 1. 아래를 확인하여 아래의 두 문제를 푸세요.
v1 <- seq(1.0, 3.0, 0.2)
v1

x <- 1:11
rep(x[1:3],3)

# 2. 아래를 확인하여 문제를 푸세요.
max.temp <- c(22,27,26,24,23,26,28)
barplot(max.temp, main = '주간 최대 기온',
        col = rainbow(7),
        xlab = '섭씨',
        ylab = '요일',
        horiz = T,
        names = c('월','화','수','목','금','토','일'),
        las =2
)

# 3. 아래를 확인하여 문제를 푸세요.
trees
plot(trees$Girth, trees$Volume,
     main = '나무 둘레-용적 산점도',
     xlab = '둘레',
     ylab = '용적',
     col = 'skyblue',
     pch = 20
     )

# 4. 아래를 확인하여 문제를 푸세요.
airquality
par(mfrow = c(2,2),      # 1행 3열 레이아웃 분할
    mar = c(5,4,4,2)) # 레이아웃 사이즈

color.5 <- rep('#a8dadc',9)
color.5[1] <- '#1D3557'
hist(airquality$Ozone,
     main = '오존분포',
     xlab = "오존",
     breaks = 10,
     col = color.5)
color.5 <- rep('#a8dadc',6)
color.5[4] <- '#1D3557'
hist(airquality$Temp, 
     main = '기온분포',
     xlab = "기온",
     breaks = 5,
     col = color.5)
color.5 <- rep('#a8dadc',6)
color.5[6] <- '#1D3557'
hist(airquality$Solar.R,
     main = '자외선분포',
     xlab = "자외선",
     breaks = 10,
     col = color.5)
color.5 <- rep('#a8dadc',6)
color.5[2] <- '#1D3557'
hist(airquality$Wind,
     main = '풍량분포',
     xlab = "풍량",
     breaks = 5,
     col = color.5)

# 5. 아래를 확인하여 문제를 푸세요.
install.packages("ggthemes")
install.packages("tidyverse")
library(carData)
library(tidyverse)
library(ggplot2)
library(dplyr)
library(ggthemes)

titanic <- data.frame(TitanicSurvival)
sum(is.na(titanic$age))
titanic <- titanic %>% filter(!is.na(titanic$age))
str(titanic)

ggplot(titanic, aes(x=passengerClass, fill=survived)) + 
  theme_bw() +
  geom_bar() +
  labs(title="타이타닉 클래스별 생존자") +
  theme(legend.position = c(0.2,0.8), axis.title.x=element_blank(),
          axis.title.y=element_blank()) + 
  theme(legend.title = element_blank()) +
  theme(legend.text = element_text(colour = "black"))
  
