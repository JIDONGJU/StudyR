## 기본 그래프
# 막대그래프 = Bar chat
favorite.season = c('WINTER','SUMMER','SPRING','SUMMER','SUMMER','FALL'
             ,'FALL','SUMMER','SPRING','SPRING')
favorite.season
ds <- table(favorite.season) # 도수분포
ds

barplot(ds, main = '좋아하는 계절절')

barplot(ds, main = '좋아하는 계절', 
        col = c('aliceblue', 'plum', 'steelblue1', 'pink'))

barplot(ds, main = '좋아하는 계절절', # plot 타이틀
        col = rainbow(4), # 막대 컬러
        xlab = '계절', # x축 이름
        ylab = '빈도수', # y축 이름
        horiz = F, # T는 가로로, F는 세로로 막대
        names = c('가을','봄','여름','겨울'), # 각 라벨이름
        las =2 # 테이블 회전
               # 0 축에평행, 1 수평방향, 2 축에직각, 3 수직방향
        )

colors()
