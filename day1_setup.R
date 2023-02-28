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

barplot(sex_edu_tb, legend.text = rownames(sex_edu_tb), col=c(2,4))

hist(survery$salary)
stem(survery$salary)
stem(survery$salary, scale=2)

boxplot(salary ~ sex, data=survery)


## day2  two value chart
