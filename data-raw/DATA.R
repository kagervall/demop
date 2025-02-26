

species_data <- read.csv2("data-raw/ArterData.csv", na.strings = c("NULL", "")) |>
  dplyr::select(code = ArtbestKod, name = ArtbestNamn, alpha = ArtbestFaktora,
                beta = ArtbestFaktorb, min_length = ArtbestMinlangd,
                max_length = ArtbestMaxlangd, min_weight = ArtbestMinvikt,
                max_weight = ArtbestMaxvikt) |>
  dplyr::mutate(alpha = as.numeric(alpha), beta = as.numeric(beta),
         min_length = as.numeric(min_length), max_length = as.numeric(max_length),
         min_weight = as.numeric(min_weight), max_weight = as.numeric(max_weight))

usethis::use_data(species_data, overwrite = TRUE)

