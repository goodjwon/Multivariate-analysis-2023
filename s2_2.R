#변수명 속성 
#date        (수치형) : 날짜
#quarter     (범주형) : 해당 월 중 날짜가 속한 주차
#department  (범주형) : 소속 부서
#day         (범주형) : 요일
#team        (범주형) : 작업에 결부된 팀 번호
#target      (수치형) : 목표생산성
#smv         (수치형) : 소요시간
#wip         (수치형) : 진행 중 작업 아이템 수
#over_time   (수치형) : 초과근무 시간(분)
#incentive   (수치형) : 인센티브
#idle_time   (수치형) : 외 부요인으로 인해 생산이 중단된 시간
#idle_men    (수치형) : 생산중단으로인해발생된유휴인력
#numchange   (수치형) : 제품의 스타일 변경 수
#numworkers  (수치형) : 각 팀에 배정된 작업 인력 
#productivity(수치형) :실제 작업으로 인해 측정된 생산성

prod <- read.csv("./maing/productivityORG.csv")
prod$date <- as.Date(prod$date, format='%m/%d/%Y')
prod$quarter <- factor (prod$quarter)
prod$department <- factor (prod$department)
prod$day <- factor(prod$day)
prod$team <- factor (prod$team)
summary (prod)
# 범주형 변수임을 인식할 수 있도록 함수를 이용하여 지정해주어야하는데,이를위해factor 함수 사용.

attach(prod)
par(mfrow=c(3,4))
boxplot (target, col="cyan3", xlab="Target Productivity")
boxplot(smv, col="cyan3", xlab="Standard Minute Value") 
boxplot (wip, col="cyan3", xlab="Work in Progress")
boxplot (over_time, col="cyan3", xlab="OverTime")
boxplot (incentive, col="cyan3", xlab="incentive")
boxplot(idle_time, col="cyan3", xlab="idle_time")
boxplot(idle_men, col="cyan3", xlab="Idle Men")
boxplot (numchange, col="cyan3", xlab= "Number of Changes ni Style")
boxplot(numworkers, col="cyan3", xlab="Number of Workers")
boxplot (productivity, col="cyan3", xlab="Productivity")
detach(prod)



#변수명
#fixed      (수치형) : 고정산
#volatile   (수치형) : 휘발산
#citric     (수치형) : 구연산
#residsugar (수치형) : 잔여당분
#chlorides  (수치형) : 염화물
#freeSD     (수치형) : 유리이산화황
#totalSD    (수치형) : 총이산화황
#density    (수치형) : 밀도
#pH         (수치형) : 산도
#sulphates  (수치형) : 황산염
#alcohol    (수치형) : 알콜올 향
#quality    (범주형) : 와인의 품질

wineOrg <-read.csv('./maing/winequalityORG.csv', header=T)
# 이상치 확인.
attach(wineOrg)
par(mfrow=c(3,4))
boxplot (fixed, col ="cyan3", xlab = "Fixed Acidity")
boxplot (volatile, col= "cyan3", xlab="Volatile Acidity")  
boxplot(citric, col = "cyan3", xlab = "Citric Acid")
boxplot (residsugar, col = "cyan3", xlab = "Residual Sugar")
boxplot (chlorides, col = "cyan3", xlab = "Chlorides")
boxplot (freeSD,col = "cyan3",xlab = "Free Sulfur Dioxide")  
boxplot (totalSD,col = "cyan3", xlab = "Total sulfur Dioxide") 
boxplot (density, col = "cyan3", xlab = "Density")
boxplot (pH, col="cyan3", xlab="pH")
boxplot (sulphates, col = "cyan3", xlab = "sulphates")
boxplot (alcohol, col = "cyan3", xlab = "Alcohol")


