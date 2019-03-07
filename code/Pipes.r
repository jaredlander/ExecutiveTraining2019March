# we're going to load the magrittr package
library(_)

# take a look at the first rows of the iris data set
# the data are about flowers
head(_)
# now with pipes
iris %>% head

# take a look at the first four rows of iris
head(_, n=4)

# print the fourth row, by taking the first four rows 
# and then taking the last row
tail(head(iris, _), _)

# let's do the same thing with pipes
iris %>% head(_) %>% tail(_)
