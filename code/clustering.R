## we have to set a seed to run the model
set.seed(888)

## let's plot x = log(TotSalCY)and y =  log(TotVarCY)
ggplot(compsSamp, aes(x = _, y = _)) + geom_point(aes(color = Region))

# we are going to clean up the same compSamp from our plotting script
_  %>% ungroup %>% 
  mutate(logTVC = log(TotVarCY), logTVP = log(TotVarPY)) %>% 
  filter(is.finite(logTVC) & is.finite(logTVP)) %>% 
  select(logTVC, logTVP,  PctChng, Region)-> compsSampCluster

## we will now run our kmeans algorithm with centers = 4
km1 <- kmeans(x = compsSampCluster[,1:2] , centers = _)

## let's take a look at km1
km1

# we can use table to compare our predicted cluster with 
# the actual compSampCLuster$Region
table(km1$cluster, compsSampCluster$Region)

# we are going to combine a new column names cluster to compSampCLuster
compsSampCluster %>% cbind(cluster = as.factor(km1$cluster)) -> km1plot

## let's visualize how well we did
## this time we will add shape=cluster in geom_point(aes())
ggplot(km1plot, aes(logTVC, logTVP, color = Region)) +
  geom_point(aes(_))

## let's run kmeans with three variables 1:3 
km2 <- kmeans(x = compsSampCluster %>% select(_), centers = 4)
km2
table(km2$cluster, compsSampCluster$Region)

compsSampCluster %>% cbind(cluster = as.factor(km2$cluster)) -> km2plot

# let's explore what they look like
ggplot(km2plot, aes(logTVC, logTVP, color = Region)) + geom_point(aes(shape=cluster))
ggplot(km2plot, aes(PctChng, logTVP, color = Region)) + geom_point(aes(shape=cluster))

# we are going to now explore this plotly
library(_)

# now we can add a third dimension Pctchngx
plot_ly(km2plot, x = ~logTVC,
        y = ~logTVP, z = ~_, 
        color = ~Region, symbol = ~cluster, 
        symbols = c('circle','x','o', 'triangle-up'))

# now we will start with a different seed and view the results
set.seed(20)

km3 <- kmeans(x=compsSampCluster %>% select(1:3), centers=4)
km3

table(km3$cluster, compsSampCluster$Region)

compsSampCluster %>% cbind(cluster = as.factor(km3$cluster)) -> km3plot

plot_ly(km3plot, x = ~logTVC,
        y = ~logTVP, z = ~PctChng, 
        color = ~Region, symbol = ~cluster, 
        symbols = c('circle','x','o', 'triangle-up'))
