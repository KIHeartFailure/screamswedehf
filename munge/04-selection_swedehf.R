
flow <- c("No of posts in SwedeHF", nrow(shfdata))

# remove duplicated indexdates
shfdata <- shfdata %>%
  group_by(LopNr, shf_indexdtm) %>%
  arrange(shf_source) %>% 
  slice(n()) %>% # select New SHF if available
  ungroup()

flow <- rbind(flow, c("Remove posts with duplicated index dates", nrow(shfdata)))