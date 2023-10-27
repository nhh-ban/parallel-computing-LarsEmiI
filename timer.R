library(tictoc)
library(tidyverse)


printTicTocLog <- # Function copied from BAN400 lecture about parallell computing
  function() {
    tic.log() %>%
      unlist %>%
      tibble(logvals = .) %>%
      separate(logvals,
               sep = ":",
               into = c("Function type", "log")) %>%
      mutate(log = str_trim(log)) %>%
      separate(log,
               sep = " ",
               into = c("Seconds"),
               extra = "drop")
  }



# -------------------------------- REGULAR LOOPS ------------------------------- 
tic("Regular Loop")

source("Scripts/Solution-witouth-PC.R") # Sourcing from the Solution without parallell computing

toc(log = TRUE)


printTicTocLog() %>%
  knitr::kable()


# ---------------------------- PARALLELL COMPUTING -----------------------------
tic("Parallell Computing")

source("Scripts/Solution-with-PC.R")

toc(log = TRUE)

printTicTocLog() %>%
  knitr::kable()


# ---------------------------- USING MULTIPLE CORES ----------------------------
tic("split_M_sim")

source("Scripts/Solution-splitM_sim.R")

toc(log = TRUE)

printTicTocLog() %>%
  knitr::kable()


# In the final result we can see that the 3rd option is faster than parallelizing 
# the final loop. And the slowest is the regular loop. The parallel options is faster
# because these utilize more hardware which gives better performance and more cores being used
# The difference between 2 and 3, I have no clue on why. I am also not sure if I understood the
# the last option correctly. 














