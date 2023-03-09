library(survival)
library(survminer)

tb <- read.csv("C:\\Users\\P70070487\\OneDrive - Maastro - Clinic\\Radiomics\\Clipped\\All_except_opc.csv")
#View(tb)
f1_4 <- coxph(Surv(overall_survival_in_days, event_overall_survival) ~ 1, data = tb)
f1_4
basehaz(f1_4,centered=FALSE)
f_4 <- basehaz(f1,centered=FALSE)
f_4
plot(f_4)

