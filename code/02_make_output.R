here::i_am(
  "code/02_make_output.R"
)
pacman::p_load(
  ggplot2, dplyr
)

ggplot_data <- ggplot(ocd_data, aes(x = Gender, y = ocd_data$Duration.of.Symptoms..months., fill = Gender)) +
  geom_boxplot() +
  labs(title = "Gender and Duration of Symptoms",
       x = "Gender",
       y = "Duration of Symptoms (months)") +
  theme_minimal() 

ggsave(
  plot = ggplot_data, 
  device = "png", 
  file.path(here::here("output", "ggplot_data.png")
))

# Create the duration and severity plot by obsession type
obsession_duration <- ggplot(ocd_data, aes(x = Obsession.Type, y = ocd_data$Duration.of.Symptoms..months., fill = Obsession.Type)) +
  geom_bar(stat = "summary", fun = "mean") +
  labs(title = "Obsession Type & Avg. Duration of Symptoms",
       x = "Obsession Types",
       y = "Duration of Symptoms (months)") +
  scale_y_continuous(breaks = seq(0, max(ocd_data$Duration.of.Symptoms..months.), by = 5)) +
  theme_minimal() 

obsession_severity <- ggplot(ocd_data, aes(x = Obsession.Type, y = ocd_data$Y.BOCS.Score..Obsessions., fill = Obsession.Type)) +
  geom_bar(stat = "summary", fun = "mean") +
  labs(title = "Obsession Type & Severity",
       x = "Obsession Types",
       y = "Obsession Severity Score") +
  scale_y_continuous(breaks = seq(0, max(ocd_data$Y.BOCS.Score..Obsessions. ), by = 5)) +
  theme_minimal()

# Create the compulsive type and duration plot
compulsion_duration <- ggplot(ocd_data, aes(x = Compulsion.Type, y = Duration.of.Symptoms..months., fill = Compulsion.Type)) +
  geom_bar(stat = "summary", fun = "mean") +
  labs(title = "Compulsion Type & Avg. Duration of Symptoms",
       x = "Compulsion Types",
       y = "Duration of Symptoms (months)") +
  scale_y_continuous(breaks = seq(0, max(ocd_data$Duration.of.Symptoms..months.), by = 5)) +
  theme_minimal()

compulsion_severity <- ggplot(ocd_data, aes(x = Compulsion.Type, y = ocd_data$Y.BOCS.Score..Compulsions., fill = Compulsion.Type)) +
  geom_bar(stat = "summary", fun = "mean") +
  labs(title = "Compulsion Type & Severity",
       x = "Compulsion Types",
       y = "Compulsions Severity Score") +
  scale_y_continuous(breaks = seq(0, max(ocd_data$Y.BOCS.Score..Compulsions.), by = 5)) +
  theme_minimal()

# Saving the graphs
ggsave(
  filename = "output/obsession_duration.png",
  plot = obsession_duration,
  device = "png"
)

ggsave(
  filename = "output/compulsion_duration.png",
  plot = compulsion_duration,
  device = "png"
)

ggsave(
  filename = "output/compulsion_severity.png",
  plot = compulsion_severity,
  device = "png"
)

ggsave(
  filename = "output/obsession_severity.png",
  plot = obsession_severity,
  device = "png"
)

