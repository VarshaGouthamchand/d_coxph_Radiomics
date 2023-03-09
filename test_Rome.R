
source("Client.R")
source("dl_coxph.R")
client <- Client("http://35.157.139.38:5000/api", "benedetta", "password", 2) #please replace with correct username and password
client$authenticate()

# Parameters used to interpret the hub's datastore
expl_vars <- c("BP", "W")
time_col <- "T"
censor_col <- "C"
results_Rome <- dcoxph(client, expl_vars, time_col, censor_col)
results_Rome
