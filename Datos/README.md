### Datos

Aqui se guardaran los datos que vayamos creando

## datos-desarrollo.csv

Este set de datos contiene siete variables:

| Variable         | Tipo      | Descripcion                                                                                           |
|------------------|-----------|-------------------------------------------------------------------------------------------------------|
| `pais`           | caracter  | Nombre del País                                                                                       |
| `anio`           | Numérica  | Año de la obsevacion (1960 - 2020)                                                                    |
| `esperanza_vida` | Numérica  | Esperanza de vida al nacer en años                                                                    |
| `pib`            | Numérica  | PIB per cápita en dolares                                                                             |
| `poblacion`      | Numérica  | Poblacion                                                                                             |
| `iso3`           | Caracter  | Codigo ISO de tres caracteres                                                                         |
| `continente`     | Caracter  | El continente en que se encuentra el país. America del Norte, Centro y Sur, aparecen como "Americas". |

Los datos fueron obtenidos del sitio del Banco Mundial en el caso de la variable `pib` y de la pagina del proyecto Gapminder en el caso de las variables `esperanza_vida` y `poblacion` . Los archivos utilizados se encuentran en la `/carpeta /datos/datos-sin-procesar/`.

El código utilizado para crear este set de datos se encuentra disponible en `/codigo/Clase 13-09.R`.
