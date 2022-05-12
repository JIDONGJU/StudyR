## 팩터와 리스트
bt <- c('A','B','B','O','AB','A') # 문자형 벡터 bt정의
bt.new <- factor(bt)              # 팩터 bt.new 정의
bt                                # 벡터 bt의 내용출력
bt.new                            # 팩터 bt.new의 내용 출력
bt[5]                             # 벡터 bt의 5번째 값 출력
bt.new[5]                         # 팩터 bt.new의 5번째 값 출력
levels(bt.new)                    # 팩터에 저장된 값의 종류 출력
as.integer(bt.new)                # 팩터의 문자값을 숫자로 바꾸어 출력
bt.new[7] <- 'B'                  # 팩터 bt.new의 7번째에 'B' 저장
bt.new[8] <- 'C'                  # 팩터 bt.new의 8번째에 'C' 저장
                          #ERROR  # 팩터레벨이 올바르지 않아 NA 생성
bt.new

# 리스트
# 자료형이 다른 값들을 한곳에 저장하고 다룰 수 있음
# 벡터는 안됨
h.list <- c('balling','tennis','ski') # 취미를 벡터에 저장
person <- list(name='Tom',age=25,student=T,hobby=h.list) # 리스트 생성
person       # 리스트에 저장된 내용을 모두 출력
person[1]    # 리스트 첫 번째 값 출력
person$name  # 리스트에서 값의 이름이 name인 값 출력 
person[4]    # 리스트 네 번째 값 출력

## 카페의 매출액 분석하기(리스트와 팩터 이용)
# 리스트 생성해 판매량, 가격, 이름을 저장
cafe <- list(esp = c(4,5,3,6,5,4,7),
             ame = c(63,68,64,68,72,89,94),
             lat = c(61,70,59,71,71,92,88),
             price = c(2000, 2500, 3000),
             menu = c('espresso','americano','latte'))
# 리스트에서 메뉴만 추출해 팩터로 변경
cafe$menu <- factor(cafe$menu)
cafe$menu
# 리스트 내 가격 벡터를 선택해 이름을 메뉴명으로 설정
names(cafe$price) <- cafe$menu
cafe$price
# 리스트에서 가격 벡터를 선택하고,
# 그 벡터에서 메뉴명에 해당하는 가격 정보를 선택
# 리스트에서 메뉴명에 해당하는 판매량 선택하여 곱셈,
# 각 메뉴마다 반복하여 메뉴의 요일별 매출액을 구해 새로운 변수에 저장
sale.esp <- cafe$price['espresso']*cafe$esp
sale.ame <- cafe$price['americano']*cafe$ame
sale.lat <- cafe$price['latte']*cafe$lat
# 요일별, 총, 평균, 평균 매출, 평균매출 이상인 요일 구하기
sale.day <- sale.esp + sale.ame + sale.lat
names(sale.day) <- c('Mon','Tue','Wed','Thu','Fri','Sat','Sun')
sale.day                                         # 요일별 매출액
sum(sale.day)                                    # 총매출액
mean(sale.day)                                   # 평균 매출액
names(sale.day[sale.day >= mean(sale.day)])      # 평균 매출액 이상인 요일 추출


## 월별 감전사고 통계 분석하기
accident <- c(31,26,42,47,50,54,70,66,43,32,32,32)
mon <- 1:12
mon.name <- paste('M', mon, sep = '')
mon.name
names(accident) <- mon.name
accident

sum(accident)
mean(accident)
min(accident)

accident - (accident * 0.1 ) # 사고율이 10% 감소하면
accident * 0.9

names(accident[accident>=50])

accident[accident >= mean(accident)]
