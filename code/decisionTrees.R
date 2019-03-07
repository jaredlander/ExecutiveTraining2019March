## let's load rpart
library(rpart)

## using the same notation formula
## we are going to predict pstive or negative change in Total Comp
## based on Title, Region, Country, TotSalCY, TotSalPY, TotVarCY, TotVarPY, and PerformanceRatingCY

# we will create a Postive or Negative label in chngType
comps$ChangeDirection <- if_else(comps$PercentChange >= 0, "Postive", "Negative")

# now we will use rpart to model chngType
changeTree <-  _(ChangeDirection ~ Title + Region + Country + SalaryPY + 
                     BonusPY + PerformanceRatingCY + PerformanceRatingPY, 
                 data=comps)

## let's take a look at our results
changeTree

## we are now going to load rpart.plot
library(_)

## and we are going to add creditTree
## to plot out our results
rpart.plot(changeTree, extra = 104)
