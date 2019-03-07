# let's load dplyr
library(_)

# we are going to use the select function to obtain columns of interest
comps %>% 
  _(Name, SalaryCY, BonusCY)


# this also works with column names in quotes
comps %>% 
  _('Name', 'SalaryCY', 'BonusCY')

# filter is another function that allows us pull rows of interest
comps %>% _(Region == 'Americas')

# and
# Region == 'Americas'
# Title == 'VP'
comps %>% _(Region == _ & Title == _)

# or
# Region == 'Americas'
# Region == 'Switzerland'
comps %>% _(_ == 'Americas' | _ == 'Switzerland')

# slice allows us to define rows of interest numerically
comps %>% _(10:50)
comps %>% _(1:10)
comps %>% _(_)

# mutate allows us to create new columns
comps %>% select(Name, SalaryCY, BonusCY) %>%
    _(SalaryCY + BonusCY) 

# let's name this column TotComp
comps %>% select(Name, SalaryCY, BonusCY) %>% 
    _(TotComp = SalaryCY + BonusCY)

# we can string together multiple functions together
comps %>% select(Name, SalaryCY, BonusCY) %>% 
    mutate(TotComp = SalaryCY + BonusCY) %>% 
    mutate(DoubleComp = TotComp * 2)

# or we can just add them into one function
comps %>% select(Name, SalaryCY, BonusCY) %>% 
    mutate(TotalComp = SalaryCY + BonusCY, 
           DoubleComp = TotComp * 2)

# let's take the mean SalaryCY
comps %>% summarize(_(SalaryCY))

# this time we'll rename it AvgSal
comps %>% summarize(AvgSal = _(SalaryCY))

# this time we will group our means by Region
comps %>% 
    group_by(_) %>% 
    summarize(AvgSal = mean(SalaryCY))

# and now with Region and Title
comps %>% 
    group_by(_, _) %>% 
    summarize(AvgSal = mean(SalaryCY))

# using Region we can summarize more than one calculation
comps %>% 
    group_by(_) %>% 
    summarize(AvgSal = mean(SalaryCY), TotalSal = sum(SalaryCY))

# we are going to use arrange to order by AvgSal

comps %>% 
    group_by(Region) %>% 
    summarize(AvgSal = mean(SalaryCY), TotalSal = sum(SalaryCY)) %>% 
    _(AvgSal)

# by using desc we can get a descending order

comps %>% 
    group_by(Region) %>% 
    summarize(AvgSal = mean(SalaryCY), TotalSal = sum(SalaryCY)) %>% 
    _(_(AvgSal)) 

# lastly we can use count to get the number of entries by Title

comps %>% 
    _(Title)


