# linear regression

# we will be trying to predict current year bonuses, from previous bonuses, Title, Region,
#and Performance rating

# let's create a histogram with BonusCY
# to see the distribution of values
ggplot(comps, aes(x = _)) + 
    geom_histogram(bins = 100) + labs(x = "Bonus CY")

# we will see how BonusCY is distributed by Title
# let's add fill=Title
ggplot(comps, aes(x = BonusCY, fill = _)) + 
    geom_histogram(bins = 75) + labs(x = "Bonus CY")

## now let's use facet_wrap(~Title) to split each plot out
ggplot(comps, aes(x = BonusCY, fill = Title)) + 
    geom_histogram(bins = 75) + labs(x = "Bonus CY") + 
    _

# we will see how BonusCY is distributed by PerformanceRatingCY
# let's add fill=PerformanceRatingCY
ggplot(comps, aes(x = BonusCY, _)) + 
    geom_histogram(bins = 75) + labs(x = "Performance Rating CY")

## now let's use facet_wrap(~PerformanceRatingCY) to split each plot out
ggplot(comps, aes(x = BonusCY, fill = PerformanceRatingCY)) + 
    geom_histogram(bins = 75) + labs(x="Performance Rating CY") + _

## let's see how Title is distributed
ggplot(comps, aes(_)) + geom_histogram(stat = 'count')

# let's take a look at the BonusPY's distribution
ggplot(comps, aes(x = _)) + geom_histogram()

## let's look at the BonusPY distribution as a comparison of the non-log version
ggplot(comps, aes(x = _)) + geom_histogram()

## now let's plot BonusCY against BonusPY
ggplot(comps, aes(_, _)) + geom_point()

## let's add color=Region to see how BonusCY
## is affected by Region
ggplot(comps, aes(x = BonusPY, y = BonusCY)) + 
    geom_point(aes(_))


## we will now add a trend line
ggplot(comps, aes(x = BonusPY, y = BonusCY))+ geom_point() + 
    geom_smooth(method = "lm") + 
    labs(x = "Bonus PY", y = "Bonus CY")

# let's create a simple linear regression
# with the formula BonusCY ~ BonusPY
totalVarLM <- lm(_, data = comps)

# let's look at the results
totalVarLM

summary(totalVarLM)

## we will now do a multiple regression with extra predictors
## the new formula is
## BonusCY ~ BonusPY + PerformanceRatingCY + Region + Title
## in our lm function

totalVar1 <- lm(_, data = comps)

## let's view the summary of our model totalVar1
summary(_)

## to check on coefficients let's add $coefficients
totalVar1_

## we can also use coef() to view them
_(totalVar1)

# let's load the coefplot library
library(_)

## let's use coefplot() to view a plot of coefficients
_(totalVar1, sort = "mag")

## let's create a new model with interaction between
## log(SalaryCY) and log(BonusPY) let's add * between them
totalVar2 <- lm(BonusCY ~ BonusPY _ SalaryCY + Title + Region +
                    PerformanceRatingCY , data=comps)

## let's look at the coefficients of totalVar2
coef(totalVar2)

## and plot the coeffficient plot
_(totalVar2, sort = "mag")
