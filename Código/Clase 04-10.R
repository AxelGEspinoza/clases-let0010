## CLASE 04-10-22 ----
library(readr)
library(dplyr)
library(ggplot2)
library(ggtext) #para editar anotaciones y etiquetas
library(gghighlight) #para destacar valores en grafico

desarrollo <- read_csv("Datos/datos-desarollo.csv")

#subset de datos -> solo paises de sudamerica

sudamerica <- filter(desarrollo,pais %in% c("Chile","Argentina","Uruguay","Paraguay","Bolivia","Perú","Colombia","Ecuador","Venezuela","Brasil","Suriname","Guyana"))

# ejemplo 1
#vertical
sudamerica %>% 
  filter(anio==2020) %>% 
ggplot(aes(reorder(pais, -esperanza_vida),esperanza_vida)) + geom_col(fill = "gold4") + 
geom_text(aes(label = esperanza_vida),
          vjust = 1.5,#posicion
          color="white",
          fontface="bold") + #grosor
  labs(title = "Esperanza de Vida en 2020", subtitle = "Países de Sudamerica",x=NULL, y = "Esperanza de Vida") +
  theme_bw()

#Horizontal
sudamerica %>% 
  filter(anio==2020) %>% 
  ggplot(aes(y = reorder(pais, -esperanza_vida),esperanza_vida)) + geom_col(fill = "gold4") + 
  geom_text(aes(label = esperanza_vida),
            hjust = 1.5,#posicion
            color="white",
            fontface="bold") + #grosor
  labs(title = "Esperanza de Vida en 2020", subtitle = "Países de Sudamerica",y=NULL, x = "Esperanza de Vida") +
  theme_bw()

#destacar info importante 
ggplot(sudamerica,aes(anio,pib,color = pais)) + geom_line(size=2) +
  gghighlight(pais == "Chile", unhighlighted_params = aes(color = "skyblue")) + 
  scale_color_manual(values = "blue") + 
  labs(title = "PIB de Chile vs Sudamerica",x="Año",y="PIB") + theme_bw()

#Ejemplo 3; anotar nuestros graficos

desarrollo %>% filter(pais=="Ruanda") %>% 
  ggplot(aes(anio,esperanza_vida)) + geom_line(size=2,color = "darkblue") + 
  geom_label(x=1995,y=10,label="1993: Año de genocidio \nde poblacion Tutsi",
             hjust = 0.001,
             fill = "darkblue",
             color = "white",
             fontface = "bold")  +
  scale_y_continuous(limits = c(0,80)) + 
  scale_x_continuous(breaks = seq(1960,2020,by=10)) + 
  labs(title = "Esperanza de Vida en Ruanda",x=NULL,y=NULL) + 
  theme_bw()

#Ejemplo 4: etiquetar grafico (alternativa a la "leyenda")

sudamerica %>%  filter(pais %in% c("Uruguay","Argentina")) %>% 
  ggplot(aes(anio,pib,color=pais)) + geom_line(size=2,show.legend = F) + 
  scale_color_manual(values = c("Argentina"="#f07197","Uruguay"="#0081a7")) + 
  labs(title = "Evolucion del PIB en <b style=color:'#f07197'>Argentina</b> y <b style=color:'#0081a7'>Uruguay</b>",x=NULL,y=NULL) + 
  theme_bw() + 
  theme(plot.title = element_markdown()) #corre el texto como markdown
