copresence_gephi <- function(base, copresence, by, simple = F){ #erro arg must be a symbol
  `%>%` <- magrittr::`%>%`
  if(simple == T){
    basic <- base %>%
      dplyr::group_by({{copresence}}, {{by}}) %>%
      dplyr::summarise() %>%
      dplyr::ungroup() %>%
      dplyr::group_by({{copresence}}) %>%
      dplyr::summarise(count = n()) %>%
      dplyr::filter(count > 1) %>%
      dplyr::select(f = {{copresence}})
    base %>%
      dplyr::filter({{copresence}} %in% basic$f) %>%
      dplyr::group_by({{by}}) %>%
      dplyr::summarise(gephi = paste({{copresence}}, collapse = ","))
  } else {
  base %>%
    dplyr::group_by({{ by }}) %>%
    dplyr::summarise(relations = paste({{ copresence }}, collapse = ","))
}}

#This function is to be used with the gephi package convert excel and csv files into network with both type of agents beeing "relations", and clicking to have connection between relations and relations.

#For each value:
#base : The data-set to be used
#copresence : the variable you want to be associated by copresence, for instance, if you want to see the copresence of students in a class, you should put students here
#by : by wich value should it be copresent, for instance, if you want to see the copresence of students in a classroom, you should put the class-room here
#simple : Only nodes that are in at least two events will be counted as valuable
