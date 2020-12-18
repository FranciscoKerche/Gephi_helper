copresence_gephi <- function(base, copresence, by){
  `%>%` <- magrittr::`%>%`
  base %>%
    dplyr::group_by({{ by }}) %>%
    dplyr::summarise(relations = paste({{ copresence }}, collapse = ","))
}

#This function is to be used with the gephi package convert excel and csv files into network with both type of agents beeing "relations", and clicking to have connection between relations and relations.


#base : The data-set to be used
#copresence : the variable you want to be associated by copresence, for instance, if you want to see the copresence of students in a class, you should put students here
#by : by wich value should it be copresent, for instance, if you want to see the copresence of students in a classroom, you should put the class-room here
