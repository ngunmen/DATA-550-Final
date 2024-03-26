here::i_am(
  "code/01_make_output.R"
)

Demoraphics_Table <- cbind(
  Gender = table(ocd_data$Gender),
  Ethnicity = table(ocd_data$Ethnicity),
  `Marital Status` = table(ocd_data$`Marital Status`),
  `Education Level` = table(ocd_data$`Education Level`)
)


saveRDS(
  Demoraphics_Table,
  file = here::here("output", "Demographics_Table.rds")
)
