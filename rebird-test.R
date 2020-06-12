# find a species list for a us county
library("tidyverse")
library("rebird")

# arguments -------------------------------------------------------------------
county <- "US-OR-047"
startyr <- 2015
birders_list <- "/users/nmtarr/Documents/eBirding/EdCoreyBirds.csv"

# get the birder's spp list ---------------------------------------------------
ed <- read_csv(birders_list)
# WORK HERE reformat to match species list from freq
lifelist <- unique(ed$Species) %>%
  str_split(" - ", n = 2)

# get frequency data from ebird -----------------------------------------------
freq <- ebirdfreq(loctype = "counties", loc = county, startyear = startyr)
spplist <- unique(freq$comName)

# find spp that would be lifers -----------------------------------------------
