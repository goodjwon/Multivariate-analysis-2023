survey = read.csv("./mva/survey.csv")
head(survey,3)

survey$sex = factor(survey$sex, levels=c(1:2), labels=c("Male", "Female"))
survey$marriage = factor(survey$marriage, levels=c(1:3), labels=c("Unmarried","Married","Divorced"))
survey$job = factor(survey$job, levels=c(1:8), labels=c('a','b','c','d','e','f','g','other'))
survey$edu = ordered(survey$edu, levels=c(1:5), labels=c('none','elem','med','high','college'))

table(survey$sex)
table(survey$edu)
