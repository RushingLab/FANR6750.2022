library(ggplot2)
library(gganimate)

set.seed(623456)

samp <- data.frame(Experiment = 1:100,
                   time = 1:100,
                   Estimate = numeric(length = 100),
                   SE = numeric(length = 100))

for(i in 1:100){
  x <- rnorm(25, 5, 3)
  samp$Estimate[i] <- mean(x)
  samp$SE = sd(x)/sqrt(25)
}


p <- ggplot(samp, aes(x = Experiment, y = Estimate)) +
  geom_point() +
  geom_hline(yintercept = 5, color = "red", linetype = "longdash") +
  scale_y_continuous(name = "", limits = c(0, 10), breaks = seq(from = 0, to = 10)) +
  theme_classic() +
  geom_segment(aes(y = 9.75, yend = 9.75, x = 1, xend = 12), 
               color = "red", linetype = "longdash") +
  annotate(x = 15, y = 9.75, label = "True parameter value", geom = "text", hjust = 0) +
  geom_point(aes(y = 9.25, x = 6)) +
  annotate(x = 15, y = 9.25, label = "Sample mean", geom = "text", hjust = 0) +
  transition_time(time) +
  shadow_mark(past = T, future = F, alpha=1)
  # enter_appear() +
  # theme(legend.position = 'none')
p

gganimate::anim_save(animation = p, 
                     filename = "lectures/01_basic_stats/samples.gif",
                     width = 642.8, height = 400)


samp <- dplyr::mutate(samp, LCI = Estimate - 1.96 * SE,
                      UCI = Estimate + 1.96 * SE,
                      Coverage = ifelse(LCI <=5 & UCI >= 5, "Yes", "No"))
ggplot(samp, aes(x = Experiment, y = Estimate)) +
  geom_errorbar(aes(ymin = LCI, ymax = UCI, color = Coverage), width = 0) +
  geom_point(aes(color = Coverage)) +
  scale_color_manual(values = c("red", "black")) +
  geom_hline(yintercept = 5, color = "red", linetype = "longdash") +
  scale_y_continuous(name = "", limits = c(0, 10), breaks = seq(from = 0, to = 10)) +
  scale_x_continuous(limits = c(0, 100)) +
  theme_classic() +
  geom_segment(aes(y = 9.75, yend = 9.75, x = 1, xend = 12), 
               color = "red", linetype = "longdash") +
  annotate(x = 15, y = 9.75, label = "True parameter value", geom = "text", hjust = 0) +
  geom_point(aes(y = 9.25, x = 6)) +
  annotate(x = 15, y = 9.25, label = "Sample mean and 95% confidence interval", geom = "text", hjust = 0) 
