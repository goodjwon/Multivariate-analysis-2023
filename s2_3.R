




#선형회귀모형 함수.
# lm (linear model.), y~x1+x2... : 선형 모형
# glm : 로지틱스 회기 모형. (General linear model.)
# step : ("both", "backward", "forward")
# predict


prod<-read.csv('./maing/productivityREG.csv', header=T)

# factor 범주형 변수라고 인지시킴.
prod$quarter = factor(prod$quarter)
prod$department = factor(prod$department )
prod$day = factor(prod$day)
prod$team = factor(prod$team)
head(prod)

# productivity : 목표치.
fit.all <- lm(productivity ~ ., data=prod)
summary(fit.all)

fit.step = step(fit.all, direction = "both")
fit.step$anova

pred.reg = predict (fit.step, newdata=prod, type="response") 
print(pred.reg)

mean ((prod$productivity - pred.reg)^2) # MSE
mean (abs (prod$productivity - pred.reg)) # MAE

## 로지스틱 선형회계 확인.


wine<-read.csv('./maing/winequalityCLASS.csv', header=T)
attach(wine)
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

head(wine)

fit.all = glm(quality ~ ., family=binomial, data=wine)
fit.step = step(fit.all, dicrtion="both")
fit.step$anova
summary(fit.step)
head(wine)

# Making predictions
p= predict(fit.step, newdata=wine, type="response") # prediction
cutoff = 0.5 #cutoff
yhat = ifelse(p  cutoff, 1, 0)
yhat

# Evaluation
tab = table(wine$quality, yhat, dnn=c("Observed", "Predicted"))
tab
sum(diag(tab))/sum(tab) # accuracy
tab[2,2]/sum(tab[2,]) # sensitivity
tab[1,1]/sum(tab[1,]) # specificity

