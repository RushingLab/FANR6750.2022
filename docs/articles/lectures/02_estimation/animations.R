library(ggplot2)
library(gganimate)

set.seed(623451)

samp <- data.frame(Experiment = 1:100,
                   time = 1:100,
                   Estimate = numeric(length = 100),
                   SE = numeric(length = 100))

for(i in 1:100){
  x <- rnorm(25, 70, 2)
  samp$Estimate[i] <- mean(x)
  samp$SE = sd(x)/sqrt(25)
}


p <- ggplot(samp, aes(x = Experiment, y = Estimate)) +
  geom_point() +
  geom_hline(yintercept = 70, color = "red", linetype = "longdash") +
  scale_y_continuous(name = "", limits = c(68, 72), breaks = seq(from = 68, to = 72)) +
  scale_x_continuous(limits = c(0, 100)) +
  theme_classic() +
  geom_segment(aes(y = 74.75, yend = 74.75, x = 1, xend = 12),
               color = "red", linetype = "longdash") +
  annotate(x = 15, y = 74.75, label = "True parameter value", geom = "text", hjust = 0) +
  geom_point(aes(y = 74.25, x = 6)) +
  annotate(x = 15, y = 74.25, label = "Sample mean", geom = "text", hjust = 0) +
  transition_time(time) +
  shadow_mark(past = T, future = F, alpha=1)
  # enter_appear() +
  # theme(legend.position = 'none')
p

gganimate::anim_save(animation = p,
                     filename = "lectures/02_estimation/samples.gif",
                     width = 642.8, height = 400)


samp <- dplyr::mutate(samp, LCI = Estimate - 1.96 * SE,
                      UCI = Estimate + 1.96 * SE,
                      Coverage = ifelse(LCI <=70 & UCI >= 70, "Yes", "No"))
ggplot(samp, aes(x = Experiment, y = Estimate)) +
  geom_errorbar(aes(ymin = LCI, ymax = UCI, color = Coverage), width = 0) +
  geom_point(aes(color = Coverage)) +
  scale_color_manual(values = c("red", "black")) +
  geom_hline(yintercept = 70, color = "red", linetype = "longdash") +
  scale_y_continuous(name = "", limits = c(68, 73), breaks = seq(from = 68, to = 72)) +
  scale_x_continuous(limits = c(0, 100)) +
  theme_classic() +
  geom_segment(aes(y = 72.75, yend = 72.75, x = 1, xend = 12), 
               color = "red", linetype = "longdash") +
  annotate(x = 15, y = 72.75, label = "True parameter value", geom = "text", hjust = 0) +
  geom_point(aes(y = 72.25, x = 6)) +
  annotate(x = 15, y = 72.25, label = "Sample mean and 95% confidence interval", geom = "text", hjust = 0) 

wing_df <- data.frame(z = seq(from = 63, to = 77, by = 0.1),
                      pr_z = dnorm(x = seq(from = 63, to = 77, by = 0.1), 70, 2))

ggplot() + 
  geom_histogram(data = samp, aes(x = Estimate, y = ..density..), 
                 fill = "#999999", alpha = 0.75, color = "#999999", bins = 60) +
  geom_rug(data = samp, aes(x = Estimate), color = "#D47500") +
  geom_path(data = wing_df, aes(x = z, y = pr_z), color = "#446E9B") +
  scale_y_continuous("Density") +
  scale_x_continuous("Estimate", expand = c(0, 0))
