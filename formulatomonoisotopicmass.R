library(OrgMassSpecR)
setwd("C:/Users/manue/Desktop")
xbib<- as.data.frame(read_excel("formulatomonoisotopicmass_input_example.xlsx"))
x<-xbib$Formula

j=1
i=1
MM=c()
for(i in 1:length(x)){
  MM[j]=MonoisotopicMass(formula = ListFormula(x[i]))
  j=j+1}
xbib$MM<-MM
write.csv(xbib, "xlib.csv")
