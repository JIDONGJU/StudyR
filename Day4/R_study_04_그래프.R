## 기본 그래프
favorite.season <- c('WINTER','SUMMER','SPRING','SUMMER','SUMMER','FALL','FALL','SUMMER','SPRING','SPRING', 'SUMMER','SUMMER')

f.season <- table(favorite.season)
str(f.season)

barplot(f.season, main = '좋아하는 계절', col = rainbow(4),
        xlab = '계절', ylab = '빈도수', horiz = F,
        names = c('가울','봄','여름','겨울'), las = 1)

## 중첩 막대그래프
# 데이터입력
age.A <- c(13709,10974,7979,5000,4250)
age.B <- c(17540,29701,36209,33947,24487)
age.C <- c(991,2195,5366,12980,19007)
ds <- rbind(age.A, age.B, age.C)
ds

colnames(ds) <- c('1970','1990','2010','2030','2050')
ds

par(mfrow=c(1,1), mar=c(3,3,3,5)) # plot의 여백조정
barplot(ds, main = '인구수 추정',
        col = rainbow(3),
        horiz = F,
        beside = T, # beside=T 그래프 따로그리기
        legend.text = c('0~14세','15~64세','64세이상'),# legend.text=T 범례, c(~~~~) 범례 내용
        args.legend = list(x='topright', # args.legend = list(x='') 범례 위치
        bty='y', # bty 박스타입
        inse=c(-0.15,0)) # inse=c(0,0) 범례위치 상세조정
        )
        
## LAB 사업부문별 매출액 그래프
HA <- c(54659,61028,53307,46161,54180)
HE <- c(31215,29863,32098,39684,29707)
MC <- c(15104,16133,15222,13208,9986)
VS <- c(13470,14231,13401,13552,13193)
BS <- c(16513,14947,15112,14392,17091)
ds <- rbind(HA,HE,MC,VS,BS)

colnames(ds) <- c('19.1Q','19.2Q','19.3Q','19.4Q','20.1Q')
ds

par(mfrow=c(1,1), mar=c(4.5,3.5,2.5,4)) # plot의 여백조정
barplot(ds, main = '사업부문별 매출액(분기)',
        col = rainbow(5),
        horiz = T,
        las = 1,
        xlab = '억원',
        beside = T,
        legend.text = c('H&A','HE','MC','VS','BS'),
        args.legend = list(x='topright', bty='n', inset=c(-0.15,0))
        )

## 히스토그램
dist <- cars[,2]
str(dist)

par(mfrow=c(1,1), mar=c(5,5,5,5)) # plot의 여백조정
hist(dist, main = '제동거리', # hist() 히스토그램
     xlab = '제동거리', ylab = '빈도수',
     border = 'blue', # 히스토그램 테두리 색
     col = 'skyblue',
     las = 1,
     breaks = seq(0, 120, 10) # 막대 수
     )

## LAB 다이아몬드 시세
library(Stat2Data)
data("Diamonds")
ds <- Diamonds$PricePerCt # 캐럿당 가격

color <- rep('#a8dadc', 9)
color[3] <- '#1d3557'

hist(ds, main = '1캐럿당 가격 분표',
     breaks = 9,
     xlab = '캐럿당 가격($)', ylab = '빈도수', las = 1,
     col = color,
     border = '#457b9d')








