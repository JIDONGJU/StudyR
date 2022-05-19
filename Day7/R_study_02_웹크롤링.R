## 웹크롤링
# 1. rvest 패키지 설치
install.packages("rvest")
library(rvest)
library(stringr)

# 2. 보배드립 url 검색 -> url 가져오기
url = 'https://www.bobaedream.co.kr/cyber/CyberCar.php?gubun=I&search_cat=C4_s0&page=1&order=S11&view_size=20'
usedcar = read_html(url)

# 3. HTML tit.ellipsis 가져오기
carinfos <- html_nodes(usedcar, css='.mode-cell.title')
carinfos

# 4. .tit.ellipsis 안에 있는 나머지 요소 제거
cartitles <- carinfos %>% html_nodes('.tit.ellipsis') %>% html_text()
cartitles

# 5. 불필요한 요소 제거
cartitles <- gsub(' ', '', cartitles)
cartitles
cartitles <- gsub('\r\n\t', '', cartitles)
cartitles

# 6. 연식 가져오기
caryears <- html_nodes(usedcar, css='.mode-cell.year')
caryears <- carinfos %>% html_nodes('.text') %>% html_text()
caryears <- gsub(' ', '', cartitles)
caryears

# 7. css text 있는 정보 가져오기
caryears <- caryears %>% html_nodes('.text') %>% html_text()
caryears

# 8. 연료 정보 가져오기
carfuels <- html_nodes(usedcar, css='.mode-cell.fuel')
carfuels

# 9. css text 정보 가져오기
carfuels <- carfuels %>% html_nodes('.text') %>% html_text()
carfuels <- carfuels[2:length(carfuels)]
carfuels <- factor(carfuels)
carfuels

# 10. 합치기
data.frame(cartitles,caryears,carfuels)



# 12. 데이터셋
ds <- table(carUesd$carfuels)
ds <- data.frame(ds)

# 13. 차트
library(ggplot2)

ggplot(data = ds. aes(Var1, y=Freq, color=rainbow(2))) +
  geom_bar(stat = 'identity')+
  ggtitle('보배드림 1페이지 외제차 연료별') +
  theme(plot.title = element_text(size = 16,
                                  face = 'bold',
                                  color = 'steelblue',
                                  hjust = 0.5)) +
  labs(x = '연료별', y = '차량수')