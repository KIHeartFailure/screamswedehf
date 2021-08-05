# delete tmp and fix order of variables

shfdata <- shfdata %>%
  select(
    LopNr, 
    shf_source, shf_indexdtm, shf_indexhosptime, shf_indexyear, shf_type,
    contains("shf_ef"),
    contains("shf_"),
  )

shfdata <- shfdata %>%
  mutate(across(where(is.character), as.factor))

shfdata_levs <- shfdata %>%
  sapply(levels) %>%
  unlist()

shfdata_levs <- bind_cols(level = shfdata_levs, var = names(shfdata_levs)) %>%
  mutate(
    variable = str_replace(names(shfdata_levs), "\\d+$", "")
  ) %>%
  group_by(variable) %>%
  ungroup() %>%
  select(variable, level)

write.xlsx(shfdata_levs, "./metadata/meta_factorlevels.xlsx")

# create Excel where nice labels/units can be written and comments "good to know"
write.xlsx(names(shfdata), "./metadata/tmp_meta_variables.xlsx")
