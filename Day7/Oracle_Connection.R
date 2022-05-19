## Oracle 연결
## RJava, rjdbc, ROracle

# 1. RODBC 설치
install.packages("RODBC") # ROracle Open DataBase Connectity
                          # JDBC JAVA DB Connectity
# 2. Library 연결
library(RODBC)

## ODBC 데이터원본(64비트) 설정
conn1 = odbcConnect('SCOTT_DSN', uid = 'scott', pwd='tiger',
                    DBMSencoding = 'euc-kr',
                    believeNRows = F)

## 4. 연결 확인
summary(conn1)

## 5. 쿼리 실행
res = sqlQuery(conn1, 'SELECT * FROM dept')
str(res)

sqlQuery(conn1, 'SELECT * FROM emp')
res = sqlQuery(conn1, 'SELECT * FROM memberTBL')

## 6. 접속
odbcClose(conn1)
conn1
View(res)
