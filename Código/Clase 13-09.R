#Scrip

#Paquetes ----
library(readxl) #lectura datos
library(readr) #idem
library(dplyr) 
library(tidyr)
library(stringr) #trabajar con cadenas de caracteres

#Importar ----
#sheet selecciona la hoja, puede ser por el numero de hoja o el nombre de esta
datos_paises <- read_excel("Datos/Datos sin procesar/datos-paises.xlsx",sheet = "ES")

esperanza_vida <- read_csv("Datos/Datos sin procesar/esperanza-de-vida.csv",skip = 4)
pib <- read_csv("Datos/Datos sin procesar/pib.csv",skip = 4)
poblacion <- read_csv("Datos/Datos sin procesar/poblacion.csv",skip = 4)

#Ordenar datos ----
esperanza_vida <- esperanza_vida %>% 
  pivot_longer(cols = "1960" : "2020",
               names_to = "anio",
               values_to = "esperanza_vida",names_transform = list(anio=as.integer))
pib <-  pib %>% 
  pivot_longer(cols = "1960" : "2020",
               names_to = "anio",
               values_to = "pib",names_transform = list(anio=as.integer))
poblacion <- poblacion %>% 
  pivot_longer(cols = "1960" : "2020",
               names_to = "anio", 
               values_to = "poblacion",
               names_transform = list(anio = as.integer)) %>% 
  mutate(poblacion = case_when(
    str_detect(poblacion, "B") ~ as.numeric(str_remove(poblacion, "B")) * 1000000000,
    str_detect(poblacion, "M") ~ as.numeric(str_remove(poblacion, "M")) * 1000000,
    str_detect(poblacion, "k") ~ as.numeric(str_remove(poblacion, "k")) * 1000,
    TRUE ~ as.numeric(poblacion)
    
  ))

#Consolidar en un solo objeto ----

datos_desarrollo <- esperanza_vida %>%  
  left_join(pib) %>% 
  left_join(poblacion) %>% 
  left_join(datos_paises)

#Guardad ----
write_csv(datos_desarrollo,"Datos/datos-desarollo.csv")
