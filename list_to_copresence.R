copresence_gephi <- function(base, copresence, by){
  `%>%` <- magrittr::`%>%`
  base %>%
    dplyr::group_by({{ by }}) %>%
    dplyr::summarise(relations = paste({{ copresence }}, collapse = ","))
}
