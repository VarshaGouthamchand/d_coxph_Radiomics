
source("Client.R")
source("dl_coxph.R")
client <- Client("http://35.157.139.38:5000/api", "varsha", "password", 1) #please replace with correct username and password
client$authenticate()

# Parameters used to interpret the hub's datastore
#expl_vars <- c("wavelet.HLH_glrlm_GrayLevelNonUniformity",
#               "original_glrlm_GrayLevelNonUniformity", "original_shape_Sphericity",
#               "original_shape_MeshVolume", "original_firstorder_Energy")
expl_vars <- c("original_shape_MeshVolume", "original_shape_Sphericity")
time_col <- "overall_survival_in_days"
censor_col <- "event_overall_survival"
results <- dcoxph(client, expl_vars, time_col, censor_col)
results

# # #create input from results
#wavelet.HLH_glrlm_GrayLevelNonUniformity = c(results$coef[1])
#original_glrlm_GrayLevelNonUniformity = c(results$coef[2])
original_shape_Sphericity = c(results$coef[2])
original_shape_MeshVolume = c(results$coef[1])
#original_firstorder_Energy =c(results$coef[5])
#inputDf1 = data.frame(wavelet.HLH_glrlm_GrayLevelNonUniformity,original_glrlm_GrayLevelNonUniformity,original_shape_Sphericity,original_shape_MeshVolume,original_firstorder_Energy)
inputDf1 = data.frame(original_shape_MeshVolume, original_shape_Sphericity)
library(jsonlite)
input=toJSON(inputDf1)
input

original_shape_MeshVolume <- 0.15944
original_shape_Sphericity <- -0.25179 
input_test = data.frame(original_shape_MeshVolume, original_shape_Sphericity)
input_test_data=toJSON(input_test)
input_test_data

# # # create and post task
source("validate_task.R")
task = postTask(client,input_test_data)
print(task)
