## 고급 그래프
# treemap
install.packages("treemap")
library(treemap)

data(GNI2014)
str(GNI2014)
GNI2014$country

treemap(GNI2014,
        index = c('continent', 'iso3'),
        vSize = 'population',
        vColor = 'GNI',
        title = '대륙간 인구수/GNI',
        type = 'value',
        na.rm = T,
        # bg.labels = 'yellow' 이제 안됨
        )

## LAB 미국 주요도시 통계데이터 분석
library(carData)
head(Ericksen)
str(Ericksen)

ds <- subset(Ericksen, city == 'state')
View(ds)
ds$stname <- rownames(ds)
treemap(ds,
        index = 'stname',
        vSize = 'poverty',
        vColor = 'crime',
        type = 'value',
        title = '미국 막장도시 찾기'
        )


## 레이다 차트
install.packages('fmsb')
library(fmsb)

score = c(80,60,95,85,40)
max.score = c(rep(100,5))
min.socre = c(rep(0,5))
ds <- rbind(max.score, min.socre, score)
ds
class(ds)
ds <- data.frame(ds)
class(ds)
colnames(ds) = c('국어','영어','수학','물리','음악')
ds


colorS()
## 매개변수(옵션)
## R에서는 RGB(RR,GG,BB,AA)
radarchart(ds,                            # 데이터프레임
           pcol = 'darkgreen',            # 다각형 선의 색
           pfcol = rgb(0.2,0.5,0.5,0.5),  # 다각형 내부 색
           # pfcol = '#ff0000' 으로도 가능
           plwd = 3,                      # 다각형 선의 두께
           cglcol = 'gray',               # 거미줄의 색
           cglty =  1,                    # 거미줄 타입
           cglwd = 0.2,                   # 축의 레이블 타입
           axistype = 1,                  # 축의 눈금 분할
           axislabcol = 'gray',           # 축의 레이블 색
           seg = 4                        # 축의 레이블 값
           )

## LAB 종교 유무 조사데이터 분석
head(WVS)
str(WVS)
head(WVS)

pop = table(WVS$country)
pop
tmp = subset(WVS, religion == 'yes')
tmp
rel = table(tmp$country)
stat = rel/pop
stat


## ggplot
library(ggplot2)

month <- c(1,2,3,4,5,6)
rain <- c(55,50,45,50,60,70)
df <- data.frame(month,rain) # 그래프를 작성할 대상 데이터
df

ggplot(df, aes(x=month,y=rain)) + # 그래프를 작성할 데이터 지정
  geom_bar(stat='identity',       # 막대그래프의 형태 지정
           width=0.7,             # 막대의 폭 지정
           fill='steelblue')      # 막대의 색 지정