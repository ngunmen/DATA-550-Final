pacman::p_load(
  here
)
here::i_am(
  "ocd_patient_dataset.csv"
)

absolute_path<-here::here("ocd_patient_dataset.csv")
ocd_data<-read.csv(absolute_path,header = TRUE)
ocd_data<-na.omit(ocd_data)


saveRDS(
  ocd_data,"data/ocd_data.rds"
) 
