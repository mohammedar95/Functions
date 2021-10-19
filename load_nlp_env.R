load_NLP_env <- function(func_dir){
  
  set.seed(123456789)
  options(stringsAsFactors = F)
  
  packages <- c(
    "plyr",
    "dplyr",
    "reshape2",
    "ggplot2",
    "textclean",
    "tm",
    "textstem",
    "Rcpp",
    "data.table",
    "text2vec",
    "Matrix",
    "tidytext",
    "NLP",
    "widyr",
    "broom",
    "tibble",
    "irlba"
    
  )
  
  # install packages if they do not exist
  new_packages <- packages[!(packages %in% installed.packages()[, "Package"])]
  if(length(new_packages)) {install.packages(new_packages)}
  
  # load packages
  sapply(packages, library, character.only = TRUE)
  
  for (i in list.files(func_dir, pattern = "\\.[RrSsQq]$", recursive =TRUE)) {
    source(file.path(func_dir, i))
  }
  
  print(paste("functions loaded: ", paste(unlist(list.files(func_dir, pattern = "\\[RrSsQq]$", recursive = TRUE)), collapse = ", ")))
  
}

