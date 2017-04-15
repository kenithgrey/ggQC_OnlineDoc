library(ggplot2)
library(ggQC)


set.seed(5555)
candle_df1t3 <- data.frame(
  Cycle = as.factor(rep(1:24, each=3)),
  candle_width = rnorm(n = 3*24, mean = 10, sd = 1),
  mold_cell = as.ordered(rep(1:3))
) 

candle_df4 <- data.frame(
  Cycle = as.factor(rep(1:24, each=1)),
  candle_width = rnorm(n = 1*24, mean = 11, sd = 2),
  mold_cell = as.ordered(rep(4, each=24))
)

candle_df <- rbind(candle_df1t3, candle_df4)

XbarR <- ggplot(candle_df, aes(x = Cycle, y = candle_width, group = 1)) + 
  stat_summary(fun.y = mean, geom = "point") +
  stat_summary(fun.y = mean, geom = "line") +
  stat_QC() + stat_QC_labels() +
  ylab("Candle Width") +
  # Show Individuals  
  geom_point(alpha= 1/5) +
  stat_QC(n=1, color.qc_limits = "orange") + 
  stat_QC_labels(n=1, color.qc_limits = "orange")   


XbarR
1152/672
c(1152,672(/300
n<-.7
ggsave(plot = XbarR, filename = "ggQC.png", width=7*n, height=3*1.423*n, dpi = 300)