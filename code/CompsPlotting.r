# Plotting

#let's load some libraries
library(ggplot2)
library(dplyr)

# we learned some dplyr let's make some data to visualize
origComps <- comps
comps <- comps %>% 
    mutate(TotalCompCY = SalaryCY + BonusCY,
           TotalCompPY = SalaryPY + BonusPY) %>% 
    filter(TotalCompCY > 0 & TotalCompPY > 0 & !is.na(TotalCompCY) & !is.na(TotalCompPY)) %>%
    mutate(PercentChange = ((TotalCompCY-TotalCompPY)/TotalCompPY) * 100) %>% 
    filter(PercentChange < 200)

# let's add comps to our function ggplot
ggplot(_)

# now we will add PercentChange as our x value
ggplot(comps, aes(x = _))

# to create a histogram we need to add geom_histogram()
ggplot(comps, aes(x = PercentChange)) + _

# to create a density plot we use geom_density()
ggplot(comps, aes(x = PercentChange)) + _

# to change the color we will add this argument color='red' in geom_density
ggplot(comps, aes(x = PercentChange))+ geom_density(_)

# that's great let's add fill='blue' to geom_density too
ggplot(comps, aes(x = PercentChange)) + geom_density(color='red', _)


## first we are going to downsample to reduce the number of rows
set.seed(1234)

compsSamp <- comps %>% 
group_by(Region) %>% 
sample_frac(.05) 

## now we need two variables to plot
## we will add x = SalaryCY, y = BonusCY

ggplot(compsSamp, aes(x = _, y = _)) + geom_point(aes(color = Region))

## we can also incase ggolot(compsSamp) into a variable p
_ <- ggplot(compsSamp)

##let's call p to string other arguments
_ + geom_point(aes(x = SalaryCY, y = BonusCY))
_ + geom_density(aes(x = PercentChange))

# we will now color our scatterplot by color=Region 
ggplot(compsSamp, aes(x = SalaryCY, y = BonusCY)) + geom_point(aes(color = _))


# here is an example of adding a trend line
ggplot(compsSamp, aes(x = SalaryCY, y = BonusCY)) + 
    geom_point(aes(color=Region)) + 
    geom_smooth(color='green')

# line for each group
ggplot(compsSamp, aes(x = SalaryCY, y = BonusCY)) + 
    geom_point(aes(color=Region)) + 
    geom_smooth(aes(color=Region))

# let's change the shape of our points add shape=1 to geom_point()
ggplot(compsSamp, aes(x = SalaryCY, y = BonusCY, color = Region)) + 
    geom_point(shape=1)

# we can also control the shape by a variable add shape = Region now
ggplot(compsSamp, aes(x = SalaryCY, y = BonusCY, color = Region )) + 
    geom_point(aes(_))

## Sometimes there might be too much data and lots of overlaping data
## we can change the transparency with alpha = 1/2
ggplot(compsSamp, aes(x = SalaryCY, y = BonusCY, color = Region )) + 
    geom_point(shape = 1, size = 1, _)

# to create a violin plot wi will add geom_violin()
ggplot(compsSamp, aes(x=Region, y=TotalCompCY)) + geom_violin()


## we will now load ggthemes
library(_)

# let's assign our plot to a variable g
g <- ggplot(compsSamp, aes(x = SalaryCY, y = BonusCY, color = Region)) + 
    geom_point(shape=1)

g

# let's add theme_economist() to our plot
g + _

# this time let's also add scale_color_economist()
g + theme_economist() + _


# let's look at theme_fivethirtyeight()
g + _

# this time with theme_tufte()
g + _

# we can still make it look like excel...
g + theme_excel() + scale_color_excel()

## we can also break our plots by variables
## let's add facet_wrap( ~ Region)to create
## individual plots for each Region
ggplot(compsSamp, aes(x = SalaryCY, y = BonusCY, color = Region)) + 
    geom_point(shape=1) + _

## So far we only used one variable Region
## we can also plot against another variable
## let's add Title
ggplot(compsSamp, aes(x = SalaryCY, y = BonusCY, color = Region)) + 
    geom_point(shape=1) + facet_grid(_ ~ Region)

# Let's look at PerformanceRatingCY
ggplot(compsSamp, aes(x = PercentChange, color = Region)) + geom_density() +
    facet_wrap(~ _)

# and finally how about with Region and Performance Rating
ggplot(compsSamp, aes(x = PercentChange, color = Region)) + geom_density() +
    facet_grid(_ ~ PerformanceRatingCY)

# let's make a complex violin plot
ggplot(compsSamp, aes(x=Region, y=TotalCompCY)) + 
    geom_jitter(alpha=1/5, size=1, shape=1, width=.35, aes(color=SalaryCY)) + 
    geom_violin(alpha=1/2, color='grey50', draw_quantiles=c(.25, .5, .75)) +
    scale_color_gradient('Salary', low='#c91010', high='#56B1F7') +
    labs(x='Region', y='Total Comp')
