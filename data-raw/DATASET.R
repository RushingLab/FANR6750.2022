## code to prepare data sets for lab activities

treedata <- data.frame(elevation = factor(rep(c("Low", "High"), each = 10), levels = c("Low", "High")),
                       density = c(rnorm(10, 17, 2), rnorm(10, 5, 2)))
treedata <- read.csv("data-raw/treedata.csv")

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


mothData <- data.frame(Treatment = rep(c("Control", "Bt", "Dimilin"), each = 4),
                       Region = rep(c(1:4), 3),
                       caterpillar = c( 25, 10, 15, 32, 16, 3, 10, 18, 14, 2, 16, 12))


usethis::use_data(mothData, overwrite = TRUE)

pineData <- read.csv("data-raw/pineData.csv")
usethis::use_data(pineData, overwrite = TRUE)

microtusData <- read.csv("data-raw/microtus_data.csv")
usethis::use_data(microtusData, overwrite = TRUE)

acidityData <- read.csv("data-raw/acidityData.csv")
usethis::use_data(acidityData, overwrite = TRUE)

fishData <- read.csv("data-raw/fishData.csv")
usethis::use_data(fishData, overwrite = TRUE)

mothData2 <- read.csv("data-raw/gypsyData.csv")
usethis::use_data(mothData2, overwrite = TRUE)

meatData <- read.csv("data-raw/meat.csv")
usethis::use_data(meatData, overwrite = TRUE)

yieldData <- read.csv("data-raw/yieldData.csv")
usethis::use_data(yieldData, overwrite = TRUE)

plantData <- read.csv("data-raw/plantData.csv")
usethis::use_data(plantData, overwrite = TRUE)

swissData <- read.csv("data-raw/swissData.csv")
usethis::use_data(swissData, overwrite = TRUE)

switzerland <- read.csv("data-raw/Switzerland.csv")
usethis::use_data(switzerland, overwrite = TRUE)

vegData <- read.csv("data-raw/vegData.csv")
usethis::use_data(vegData, overwrite = TRUE)

salinityData <- read.csv("data-raw/salinityData.csv")
usethis::use_data(salinityData, overwrite = TRUE)

musselData <- read.csv("data-raw/musselData.csv")
usethis::use_data(musselData, overwrite = TRUE)
