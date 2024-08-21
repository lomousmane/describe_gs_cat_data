library(tidyverse)
library(here)
library(gt)
library(prettyR)
# visualiser les 1er lignes
gss_cat %>%
  head(10) %>% 
  gt() %>% 
  gt::cols_align(align="center")
# structure et dimension
str(gss_cat)
dim(gss_cat)
# summary
describe(gss_cat)
# summarise the tvhours by marital
tab<-gss_cat %>% 
  filter(age<30) %>%
  group_by(marital) %>% 
  summarise(mean_tv_hours=mean(tvhours,na.rm = T))
# enregister le tableau
write.csv(tab,here("mean_hours_by_marital.csv"))
# visualisation
tab=table(gss_cat$marital)
tab
barplot(tab,col=rainbow(6),main="Distribution du statut marital")
# Distribution de lage
hist(gss_cat$age, breaks = 8,col="blue",xlab="age")
  

