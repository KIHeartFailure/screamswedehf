
# Version number

version <- "001"

assign(paste0("shfdata", version), shfdata)

dir.create(paste0("./data/v", version))

# RData

save(
  file = paste0("./data/v", version, "/shfdata", version, ".RData"),
  list = c(paste0("shfdata", version))
)