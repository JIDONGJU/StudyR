## 패키지 설치 및 로드

install.packages("ggplot2")
library(ggplot2)

ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width)) +
  geom_point()

## cowsay 패키지
install.packages("cowsay")
library(cowsay)
say(what='hi', by='cat')
say(what='hi', by='cow')
say(what='hi', by='cow', by_color='blue')

Sys.Date()
Sys.time()

## 생일 맞추기 (((M*4)+9)*25)+D
# 소윤 931 주연 754 민철 1029 석준 1139 현석 1442

# (((M*4)+9)*25)+D >>> M*100+D+225 >>> 결과값에서 225를 뺀 후 100을 나누어서 몫은 월, 나머지는 일
(931 - 225) %% 100
((931 - 225) - ((931 - 225) %% 100)) / 100
