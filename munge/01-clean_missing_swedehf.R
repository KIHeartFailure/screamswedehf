rep_func_new <- function(var) {
  var <- na_if(var, ".A")
  var <- na_if(var, ".N")
}

newshf <- newshf %>%
  mutate(across(where(is.character), rep_func_new))


# check if variables have other vals than 9 as unknown and vice versa
# koll <- oldvals %>% filter(LABEL == "Okänt") %>% count(START) # NYHA vid fu har 0 = missing
# koll <- oldvals %>% filter(START == 9, LABEL != "Okänt") # LANDSTING, DOSARNI, NAMNBETA

rep_func_old <- function(var) {
  var <- na_if(var, 9)
}

vars_old <- c(
  "CIVILSTATUS", "BOFORM", "VARDGIVARE", "KLINIK", "ORSAKTILLINLAGGNING", "UTLOSANDEFAKTORER", "TIDIGAREINLAGGNING",
  "DURATIONHJARTSVIKT", "ROKNING", "ALKOHOL", "PRIMARETIOLOGI", "IHD",
  "TIDIGAREHJARTINFARKT", "HYPERTONI", "FORMAKSFLIMMER", "DIABETES", "LUNGSJUKDOM",
  "KARVOC", "DCM", "HCM", "TIDIGARESTROKE", "NJURSJUKDOM",
  "DEPRESSION", "MALIGNSJUKDOM", "REVASKULARISERING", "KLAFFOP", "DEVICETERAPI",
  "HJARTTRANSPLATION", "EKGSENAST", "LBBB", "EKOSENAST", "RONTGEN", "ARBETSPROV", "SPIROMETRI",
  "NYHA", "FATIGUE", "OUTOFBREATH", "LIVSKVALITET", "MOBILITY", "HYGENE", "ACTIVITIES", "PAIN_TROUBLES",
  "DISCOMFORT_SADNESS", "ACEHAMMARE", "OEJNACE", "A2BLOCKERARE", "OEJNA2",
  "EJRAASBLOCKAD", "BETABLOCKERARE", "OEJNBETA", "EJBEHBETABLOCK", "DIURETIKA", "ALDOSTERONANTAGONIST",
  "DIGITALIS", "STATINER", "INOTROPTSTOD", "NITRATER", "ANTIKOAGULANTIA", "ASATRC",
  "ANTOVRLAKEM", "AMIODARONE", "FYSTRANING", "UPPF_VARDNIVA", "UPPF_HSVIKT", "ALKOHOLVECKA", "ALKOHOLTILLFALLE",
  "ROKVANOR", "SNUSNING", "OTHERDISEASE", "LVEFMETOD", "TIDIGAREVARDTILLFALLE", "ARNI", "JARNIV", "SINUS", "GENDER",
  "d_lvefprocent"
)

oldshf <- oldshf %>%
  mutate(across(all_of(vars_old), rep_func_old))
