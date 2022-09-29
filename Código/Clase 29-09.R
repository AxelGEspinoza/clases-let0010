#cargamos paquete ----
library(readr)
library(dplyr)
library(ggplot2)
library(forcats) #para trabajar con variables tipo factor
#importar datos ----
desarrollo <- read_csv("Datos/datos-desarollo.csv")
#filtramos
#grafica pib de chile ----
desarrollo %>% 
  filter(pais == "Chile",anio >= 2000) %>% 
  ggplot(aes(x=anio , y = pib)) + geom_line(color = "green") + geom_point(color = "purple", size = 2) + 
  scale_y_continuous(limits = c(0,14000),labels = scales::dollar) + 
  labs(title = "PIB de Chile", subtitle = "Entre los años 2000 y 2020", y = "PIB en dólares", x = NULL,caption = "Fuente de datos: Banco Mundial") + 
  theme_bw()

#guardar grafico con comando 
ggsave("Figuras/linea-PIB-Chile.png",width = 10,height = 7)

#2do grafico con mas paises ----
colores_paises <- c("Chile" = "Red", "Argentina"="blue2","Uruguay" = "#3b83bd")

desarrollo %>% 
  filter(pais %in% c("Chile","Argentina","Uruguay")) %>% 
  ggplot(aes(anio,esperanza_vida,color = fct_reorder2(pais, anio,esperanza_vida))) + 
  geom_line() + 
  scale_y_continuous(limits = c(0,85)) + 
  scale_x_continuous(breaks = seq(1960,2020,10)) + 
  scale_color_manual(values = colores_paises) +
  labs(title="Evolución de Esperanza de vida en Chile, Argentina Y Uruguay", 
       subtitle = "(1960,2020)", 
       y = "Esperanza de Vida", 
       x = NULL, 
       color=NULL) + 
  theme_bw() +
  theme(legend.position = "bottom") #cambia la posicion de la leyenda

#funcion fct_reorder2 reordena las leyendas segun la ultima aparecion en el grafico
