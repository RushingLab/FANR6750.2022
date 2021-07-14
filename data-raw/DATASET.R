## code to prepare data sets for lab activities

treedata <- data.frame(elevation = factor(rep(c("Low", "High"), each = 10), levels = c("Low", "High")),
                       density = c(rnorm(10, 17, 2), rnorm(10, 5, 2)))

usethis::use_data(treedata, overwrite = TRUE)

treeHt <- read.csv("data-raw/treeHt.csv")

usethis::use_data(treeHt, overwrite = TRUE)

sawData <- read.csv("data-raw/sawData.csv")

usethis::use_data(sawData, overwrite = TRUE)

warblerWeight <- read.csv("data-raw/warblerWeight.csv")

usethis::use_data(warblerWeight, overwrite = TRUE)

infectionRates <- read.csv("data-raw/infectionRates.csv")

usethis::use_data(infectionRates, overwrite = TRUE)

plantData <- read.csv("data-raw/plantData.csv")

usethis::use_data(plantData, overwrite = TRUE)

dietData <- read.csv("data-raw/dietData.csv")
dietData <- dplyr::mutate(dietData, length = girth)
dietData <- dplyr::select(dietData, -girth)
usethis::use_data(dietData, overwrite = TRUE)

jayData <- read.csv("data-raw/jayData.csv")
usethis::use_data(jayData, overwrite = TRUE)

cruzData <- read.csv("data-raw/cruzData.csv")
usethis::use_data(cruzData, overwrite = TRUE)

frogData <- read.csv("data-raw/frogData.csv")
usethis::use_data(frogData, overwrite = TRUE)

crowData <- read.csv("data-raw/crowData.csv")
usethis::use_data(crowData, overwrite = TRUE)

caterpillar <- data.frame(location = 1:12,
                          untreated = c(23,18,29,22,33,20,17,25,27,30,25,27),
                          treated = c(19,18,24,23,31,22,16,23,24,26,24,28))
usethis::use_data(caterpillar, overwrite = TRUE)


