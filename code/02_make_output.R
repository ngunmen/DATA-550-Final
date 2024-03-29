here::i_am(
  "code/02_make_output.R"
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
