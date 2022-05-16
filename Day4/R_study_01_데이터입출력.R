## 데이터 입출력
setwd('C:/STUDY/StudyR/Day4') # working 디렉토리 설정
print('Hello R')

# 실행결과를 저장
sink('result txt', append =  T) # append >- 이전 문서 다음 뒤, 계속 붙이기 # F하면 앞에 내용 다 날아감감
a <- 10; b <- 20
cat('a+b=',a+b, \n)


sink('result txt', append =  T)
iris
hey <-tail(iris)
hey
sink()

## TXT 파일 일기 / 구분자 공백기는 탭
air.txt = read.table("./airquality.txt", header = T, sep = ' ') # header=T 제목줄 존재여부부
air.txt

# csv파일도 raed.table()로 불러오기 가능 sep=','
air.csv = read.table("../day3/airquality.csv", header = T, sep = ',')
air.csv


## LAB 체질량 지수 계산 2
library(svDialogs) # 팝업을 위한 svDialogs 패키지 로드
height <- dlgInput('input height (cm) ')$res # 키 입력 팝업 및 값 저장
weight <- dlgInput('input weight (kg) ')$res # 몸무게 입력팝업 및 값 저장
height <- as.numeric(height) # 정수형으로 전환
weight <- as.numeric(weight) # 정수형으로 전환
height <- height / 100 # 키 단위 변환
bmi <- weight / (height^2) # BIM 계산
bmi

sink('bmi.txt', append = F) # append=T 새로운결과 계속 이어붙이기 
cat('height','weight','bmi\n')
cat(height*100, weight, bmi)
cat('\n') # 줄바꿈
sink()

result <- read.table('bmi.txt', sep = " ")
result
result <- result[-1,] # 1행 제거


names(result) <- c('키','몸무게','체질량지수')
result
write.table(result, './bmi2.txt', row.names = F)

##엑셀 패키지
install.packages('readxl') # 엑셀읽기용
library(readxl)

air.xlsx <- read_xlsx('../day3/airquality.xlsx') 
air.xlsx

install.packages('openxlsx') # 엑셀쓰기용
library(openxlsx)

write.xlsx(result, 'bmi_result.xlsx', rownames = F)


## 실전분석 차정보 조회
library(svDialogs)
library(readxl)
library(openxlsx)
carprice.new <- read.csv('carprice.csv', header = T)
str(carprice.new)
carprice.new[,1]

input.type <- dlgInput('차량타입 입력\n(Compact,Small,Midsize,Large,Sporty,Van')$res
input.city <- dlgInput('최소 시내연비 입력')$res
input.city <- as.numeric(input.city)

result <- subset(carprice.new, Type == input.type &
                   MPG.city >= input.city)
print(result)
result

write.xlsx(result, './Van_result.xlsx', rownames=F)

getwd()

## Oracle 연동
install.packages('rJava')
install.packages('RJDBC')
library(rJava)
library(RJDBC)

# DB연결 설정
jdbcDriver <- JDBC(driverClass = 'oracle.jdbc.OracleDriver',
                   classPath = './day4/ojdbc6.jar') # 오류 남
# PASS
