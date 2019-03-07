## load the readxl library
library(_)
## load the purrr library
_

# We will now read all the file names in the Data_Science_Training directory
# with list.files
excel_files <- _('./data/Comps/', full.names = TRUE, pattern = 'xls')

# let's take a look at excel_files
excel_files

# we are now going to load one table in using read_excel
# na = '-' tells the function that - was used to indicate missing data
comp <- _(excel_files[1], na = '-')

## lets explore lot with head()
head(_)

# we will now combine all the tables in one line
# we iterate over each file name
# load them in one at a time
# and combine them into a single data.frame
comps <- map_df(excel_files, ~read_excel(.x, na = '-')) 

## we will explore the shape with dim()
_

## and we will now peak into the data with head()
_
