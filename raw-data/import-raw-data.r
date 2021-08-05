
ProjectTemplate::reload.project(
  reset = TRUE,
  data_loading = FALSE
)

memory.limit(size = 10000000000000)

# Import data from UCR ----------------------------------------------------

ucrpath <- "./raw-data/SWEDEHF_SCREAM/"

# oldvals <- read_sas(paste0(ucrpath, "dat183_formats_old.sas7bdat"))

newshf <- read_sasdata(path = ucrpath, filename = "sos_nya_rs_dat332_export")
oldshf <- read_sasdata(path = ucrpath, filename = "sos_gamla_rs_dat332_bas_ej_migr")

# Store as RData in /data folder ------------------------------------------

save(file = "./data/rawData_shf.RData", list = c(
  "newshf",
  "oldshf"
))
