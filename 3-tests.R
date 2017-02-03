
# T-TEST --------------------------------------------------------------------------------------------------------------

t.test(maritzburg$time, hillcrest$time)

# PAIRED T-TEST -------------------------------------------------------------------------------------------------------

t.test(merged$maritzburg, merged$hillcrest, paired = TRUE)

# DISTRIBUTION TEST ---------------------------------------------------------------------------------------------------

# Apply tests on underlying distribution.

# LINEAR REGRESSION ---------------------------------------------------------------------------------------------------

# This is also using paired data.

fit.simple <- lm(maritzburg ~ hillcrest, merged)

summary(fit.simple)

# A more physically realistic model.

fit.physical <- lm(maritzburg ~ hillcrest + 0, merged)

summary(fit.physical)

# Compare summary of two fits, particularly R-squared.

AIC(fit.simple)
AIC(fit.physical)

BIC(fit.simple)
BIC(fit.physical)

anova(fit.physical, fit.simple)

# Can we apply a t-test to check if slope is different from 1?

fit.coefficients <- summary(fit.physical)$coefficients
