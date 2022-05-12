## 매트릭스와 데이터프레임
z <- matrix(1:20, nrow=4,ncol=5)
z

z1 <- matrix(1:20, nrow=4, ncol=5, byrow=T)
z1

z[1,3]
z[3,4]
z[4,5]

z1[3,1]

x <- 1:4
y <- 5:8
z3 <- matrix(1:20, nrow=4, ncol=5, byrow=T)
z3

m1 <- cbind(x, y) # 세로로 정렬 colnum
m1
m2 <- rbind(x, y) # 가로로 정렬
m2

m3 <- rbind(m2, y)
m3

cbind(m2, x)

m4 <- cbind(z,x)
m4

rbind(z,x)
x
z
z[2,] # 2행 조회
z[,3] # 3열 조회회






