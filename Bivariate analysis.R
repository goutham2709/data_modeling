### R Useful commands.

## Bivariate analysis

# Continuous & categorical
by(DATA$COL1, DATA$COL2, mean) # Applies mean on COL1, split by COL2

boxplot(DATA$COL1~DATA$COL2, notch = TRUE, col = c("green", "grey, .....")) # y~group

library(sm) # Summary information package
sm.density.compare(DATA$COL1, DATA$COL2) # Density plots grouped by factor levels
legend_add <- factor(DATA$COL, labels = c("XXX","XXX"))
cofill <- c(2:(2+length(levels(DATA$COL))))
legend(locator(1), levels(legend_add), fill = colfill) # Add legend to the density plot above

# Categorical & categorical
xtabs(~ CAT_VARIABLE1 + CAT_VARIABLE2, DATA) # Cross tabulation # kinda funny. The function is different from the rest
plot(xtabs(~ CAT_VARIABLE1 + CAT_VARIABLE2, DATA))

library(gmodels)
CrossTable(DATA$COL1, DATA$COL2) # Gives levels of significance with Chi-square
          # Use Chi-squared to find p-value, which will show significance
          # P-value > 0.05 is NOT significant # P is low(< 0.05), NULL must go --> Significant

# Continuous & continuous
scatter.smooth(VAR, VAR) # Gives the line of best fit
