source("run_coxph.R")
library(testthat)
library(survival)

digits <- 5
  
  # Run the regular implementation
df <- read.csv("C:\\Users\\P70070487\\OneDrive - Maastro - Clinic\\cox-validation-ci-main\\cox-validation-ci-main\\cox_val_sparql\\cox_val_combined\\Book1.csv")
cox_result <- coxph(
    Surv(df$overall_survival_in_days, df$event_overall_survival) ~ df$lp,
    method="breslow"
  )
  
cox_coefficients <- round(cox_result$coefficients, digits)
cox_coefficients
  
# Run the distributed implementation with one dataset
dlcox_result <- mock.SEER(splits=2)
dlcox_result
dlcox_coefficients <- round(dlcox_result$coef, digits)
names(dlcox_coefficients) <- rownames(dlcox_result)
  
  # Compare results
expect_equal(dlcox_coefficients, cox_coefficients)
  
dlcox_coefficients
