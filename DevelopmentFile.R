
## Load libraries and set working directory
library(devtools)
library(roxygen2)
setwd("C:/Users/Alex Petri/Downloads/GithubASP/PS5") #This will need to be changed to match your directory




# Now the NAMESPACE

## This can be run many times as the code is updates
current.code <- as.package("integrateIt")
load_all(current.code)
document(current.code)
test(current.code)




