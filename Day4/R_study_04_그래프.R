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
        