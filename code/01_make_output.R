here::i_am(
  "code/01_make_output.R"
)

pacman::p_load(
  gtsummary
)

ocd_data<-readRDS(
  file=here::here("data/ocd_data.rds")
)


Demoraphics_Table <- ocd_data %>%
  select(Gender, Ethnicity, Marital.Status, Education.Level) %>%
  tbl_summary(
    by= Ethnicity
) 


saveRDS(
  Demoraphics_Table,
  file = here::here("output", "Demographics_Table.rds")
)
