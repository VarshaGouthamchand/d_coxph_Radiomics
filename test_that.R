#library(testthat)
#library(survival)
#source("run_coxph.R")
source("Client.R")
source("dl_coxph.R")

  # Run the regular implementation
 
  mock.SEER.custom.split <- function()  {
    # Load the entire dataset and split it into parts
    datasets <- list()
    datasets[[1]] <- read.csv("C:\\Users\\P70070487\\OneDrive - Maastro - Clinic\\cox-validation-ci-main\\cox-validation-ci-main\\cox_val_sparql\\cox_val_combined\\data_new_HN1.csv")
    datasets[[2]] <- read.csv("C:\\Users\\P70070487\\OneDrive - Maastro - Clinic\\cox-validation-ci-main\\cox-validation-ci-main\\cox_val_sparql\\cox_val_combined\\data_new_HN3.csv")
    datasets[[5]] <- read.csv("C:\\Users\\P70070487\\OneDrive - Maastro - Clinic\\cox-validation-ci-main\\cox-validation-ci-main\\cox_val_sparql\\cox_val_combined\\data_new_MDA.csv")
    datasets[[3]] <- read.csv("C:\\Users\\P70070487\\OneDrive - Maastro - Clinic\\cox-validation-ci-main\\cox-validation-ci-main\\cox_val_sparql\\cox_val_combined\\data_new_Mon.csv")
    datasets[[4]] <- read.csv("C:\\Users\\P70070487\\OneDrive - Maastro - Clinic\\cox-validation-ci-main\\cox-validation-ci-main\\cox_val_sparql\\cox_val_combined\\data_new_OPC.csv")
    
    #print("hello",datasets[2])
    
    client <- MockClient(datasets)
    #expl_vars <- c("wavelet.HLH_glrlm_GrayLevelNonUniformity", 
    #               "original_glrlm_GrayLevelNonUniformity", 
    #               "original_shape_Sphericity",
    #               "original_shape_MeshVolume", "original_firstorder_Energy")
    expl_vars <- c("lp")
    time_col <- "overall_survival_in_days"
    censor_col <- "event_overall_survival"
    
    results <- dcoxph(client, expl_vars, time_col, censor_col, call.method=mock.call)
    return(results)
  }
  
mock.SEER.custom.split()
