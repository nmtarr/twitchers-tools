# find a species list for a us county
library("tidyverse")
library("rebird")

# arguments -------------------------------------------------------------------
county <- "US-OR-047"
startyr <- 2015
birders_list <- "/users/nmtarr/Documents/eBirding/EdCoreyBirds.csv"
ß
# get the birder's spp list ---------------------------------------------------
ed <- read_csv(birders_list)
# WORK HERE reformat to match species list from freq
lifelist <- unique(ed$Species) %>%
  str_split(" - ", simplify = TRUE) %>%
  .[,1]

# get frequency data from ebird -----------------------------------------------
freq <- ebirdfreq(loctype = "counties", loc = county, startyear = startyr)
sitelist <- unique(freq$comName)

# find spp that would be lifers -----------------------------------------------
new_lifers <- setdiff(sitelist, lifelist)
new_life_df <- filter(freq, comName %in% new_lifers)
write_excel_csv(new_life_df, "/users/nmtarr/Documents/eBirding/EdCorey_new_spp.csv")
