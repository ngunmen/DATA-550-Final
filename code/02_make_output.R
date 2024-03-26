here::i_am(
  "code/02_make_output.R"
)

ggplot_data <- ggplot(ocd_data, aes(x = Gender, y = `Duration of Symptoms (months)`, fill = Gender)) +
  geom_boxplot() +
  labs(title = "Relationship between Gender and Duration of Symptoms",
       x = "Gender",
       y = "Duration of Symptoms (months)") +
  theme_minimal() +
  facet_wrap(~ `Obsession Type`, scales = "free", ncol = 2) +
  geom_boxplot(aes(x = `Obsession Type`, y = `Y-BOCS Score (Obsessions)`, fill = `Obsession Type`), position = "dodge", alpha = 0.7) +
  labs(title = "Relationship between Obsession Type and Y-BOCS Score",
       x = "Obsession Type",
       y = "Y-BOCS Score (Obsessions)") +
  geom_boxplot(aes(x = `Compulsion Type`, y = `Y-BOCS Score (Compulsions)`, fill = `Compulsion Type`), position = "dodge", alpha = 0.7) +
  labs(title = "Relationship between Compulsion Type and Y-BOCS Score",
       x = "Compulsion Type",
       y = "Y-BOCS Score (Compulsions)") +
  theme(legend.position = "bottom")
print(ggplot_data
)

saveRDS(
  ggplot_data,
  file = here::here("output", "ggplot_data.rds")
)
