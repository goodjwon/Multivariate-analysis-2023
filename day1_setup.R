##day1 *은 중요표시.
survey = read.csv("./mva/survey.csv")
head(survey,3)

survey$sex = factor(survey$sex, levels=c(1:2), labels=c("Male", "Female"))
survey$marriage = factor(survey$marriage, levels=c(1:3), labels=c("Unmarried","Married","Divorced"))
survey$job = factor(survey$job, levels=c(1:8), labels=c('a','b','c','d','e','f','g','other'))
survey$edu = ordered(survey$edu, levels=c(1:5), labels=c('none','elem','med','high','college'))

table(survey$sex)
table(survey$edu)


## day2  single value chart
edu_tb = table(survey$edu)
edu_tb
rownames(edu_tb) = c('none','elem','med', 'high', 'colleage')
barplot(edu_tb)
dev.new() # *디바이스를 만든다.
pie(edu_tb, main="study pie chart")
dev.off()



sex_edu = list(survey$sex, survery$edu)
sex_edu_tb = table(sex_edu)
sex_edu_tb
#컬럼에 명칭 주기
colnames(sex_edu_tb) <- c('none','elem','med', 'high', 'colleage')
sex_edu_tb

barplot(sex_edu_tb, legend.text = rownames(sex_edu_tb), col=c(2,4))
title("Stacked Barplot")

hist(survery$salary)
stem(survery$salary)
stem(survery$salary, scale=2)

boxplot(salary ~ sex, data=survery)


## day2  two value chart
plot(co2)
lines(smooth(co2), col=4)
write.csv(co2, file='./mva/co2.csv')


# Visualization of Multivariate Data
install.packages("HSAUR2")
library("HSAUR2")
install.packages("MVA")
library(MVA)
data(USairpollution)
head(USairpollution, 3)

x = USairpollution[, c(3,4)]
bvbox(x, xlab='manu', ylab='popul', pch=19)
title('Bivariate Boxplot')
dev.new()
identify(x) #점에 수치 확인. 마우스로 찍으면 나타난다.
dev.off()
rownames(x)[c(7,9,14,30)]

plot(wind~temp,data=USairpollution,pch=9)

with(USairpollution, symbols(temp, wind, circle=SO2, inches=0.5, add=T))
title("Bubble plot")


# R 산점도 행렬.
social = read.table('./mva/social.txt', header = T)
head(social)
pairs(social) # 산점도 행렬을 표시한다.
round(cor(social, use='complete.obs'), 3)

# R 별그림.
social
social2 = social[, -1]
social2
year = social[,1]
year
rownames(social2)<-year
stars(social2)
