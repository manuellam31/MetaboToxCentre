library(RColorBrewer)
library(ggplot2)
library(readxl)

################CCS plot########################
#colors
setwd("C:/Users/manue/Desktop")
df <- read_excel("example_data_CCS_plot.xlsx")


#manual palette (selecting colors for different lipid classes)
#19colors
c19 <- c("dodgerblue2", "#E31A1C", # red
         "green4",
         "#6A3D9A", # purple
         "#FF7F00", # orange
         "black",
         "skyblue2", # lt pink
         "palegreen2", # lt purple
         "#FDBF6F", # lt orange
         "gray70", "khaki2",
         "maroon", "orchid1", "pink1", "blue1",
         "darkturquoise",
         "burlywood1",
         "brown3",
         "blueviolet"
)

#change to dataframe format
df<-as.data.frame(df)


ggplot(data = df, aes(x = mz,y = ccs))+
  geom_point(aes(col=Subclass, shape=polarity),size=5)+
  scale_color_manual(values = c19)+
  scale_size_binned()+
  xlim(c(100, 1000)) + 
  ylim(c(150,340)) + 
  labs(y= expression(paste("CCS value (", ring(A)^2,")")),
       x=expression(italic("m/z")), 
       title="HepaRG IC", #change based on your sample
       subtitle = "LC-IM-MS",
       col = "Lipid MAPS Subclass",
       shape= "Mode")+
  theme_light()+
  theme(plot.title = element_text(hjust = 0.5,size = 30),
        plot.subtitle = element_text(hjust = 0.5,size = 25),
        axis.text = element_text(size = 25,),
        text = element_text(size=25))
