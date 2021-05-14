```{r Protocolo, eval=FALSE, include=TRUE}
"Protocolo:

 1. Daniel Felipe Villa
 
 2. Lenguaje: R

 3. Tema: Gráficos con R: tortas, barras, boxplots, histogramas, gráficos de dispersión (realice al menos dos ejercicios que requieran cargar archivos externos, leer y procesar la información del archvo leído, y guardar las respuestas a los ejercicios en archivos independientes)
 
 4. Fuentes:https://bookdown.org/jboscomendoza/r-principiantes4/datos-usados-en-el-capitulo.html"
```

# Graficos en R:

R es una herramienta potente para la generación de gráficas de todo tipo y algunas pueden interactivas (Shiny Web App).

# Grafico de Sectores

Un gráfico de sectores, también conocido como gráfico circular, gráfico de pastel, de tarta, de torta o pie chart, por su nombre en inglés, es un gráfico circular que representa proporciones o porcentajes en sectores, donde el área y la longitud del arco de cada sector es proporcional a la cantidad representada.

> Nota: Los gráficos de sectores han sido criticados debido a la dificultad que supone leer ángulos para los ojos humanos. En la mayoría de casos se recomienda usar gráficos de barras en su lugar, ya que son más fáciles de leer.

## ¿Cómo crear un gráfico de sectores R?

Un gráfico circular se puede crear con la función `pie` de R base.

## Ejercicio:

Exportamos una base de datos

Una empresa hace una encuesta, para saber las preferencias de los comensales al escoger la comida (anonima)

```{r}
# Importamos la base dada:

BasePie <- read.csv(file = "BasePie.csv", header = T)
print(BasePie)

## Convertimos en factor la columna Comida:
BasePie$Comida <- as.factor(BasePie$Comida)
print(BasePie$Comida)

## AHORA vamos a hacer un data frame con el conteo de comida:

comida <- data.frame(table(BasePie$Comida))
print(comida)

## Ahora vamos a fabricar el Grafico de Torta y guardarlo en png():

png("GraficoPieComida.png")
pie(comida$Freq, labels = comida$Var1, radius = 1)
dev.off()
```


# Gráfico de barras en R

Este es quizás el tipo de gráfico mejor conocido de todos. Una gráfica de este tipo nos muestra la frecuencia con la que se han observado los datos de una variable discreta, con una barra para cada categoría de esta variable.

La función `plot()` puede generar gráficos de barra si damos como argumento `x` un vector de factor o cadena de texto, sin dar un argumento `y`.

## La función barplot en R

Para crear un gráfico de barras en R, puedes usar la función de R base `barplot`.

## Ejercicio:

Una perosna hace una encuesta y saca un porcentaje sobre el uso de las tarjetas en cierto hotel y encontro que:

```{r}
# Importamos la base dada:

BaseBarplot <- read.csv(file = "BaseBarplot.csv", header = T)
print(BaseBarplot)

## Convetimos en factor la 1ra columna:
BaseBarplot$CardCredit <- as.factor(BaseBarplot$CardCredit)

## Ahora graficaremos y exportaremos la grafica dada:
png("BarPlotCard.png")

barplot(BaseBarplot$Freq,
        main = "Uso de Tarjetas de Credito",
        xlab = "Tarjeta de Credito",
        ylab = "Porcentaje %",
        legend = levels(BaseBarplot$CardCredit),
        col = c("red","orange","yellow","green","blue","violet"),
        ylim = c(0,100))
dev.off()
```

# BoxPlot

Los box plots, también conocidos como diagramas de cajas y bigotes, son una representación gráfica que permite resumir las características principales de los datos (posición, dispersión, asimetría, …) e identificar la presencia de valores atípicos.

## La función boxplot en R

En R base se puede crear un gráfico caja y bigotes con la función boxplot. Puedes dibujar este tipo de gráfico desde diferentes entradas, como vectores o data frames

## Ejercicio

Precio de las acciones de empresas de coches a largo del año, comparadas:

```{r}
# Cargamos la base de datos:
BaseBoxplot <- read.table(file = "BaseBoxplot.txt", header = T, sep = ",")

print(BaseBoxplot)

##Convertimos en factor la 1ra columna:
BaseBoxplot$Marcas <- as.factor(BaseBoxplot$Marcas)

## Ahora fabricamos el boxplot y lo exportamos:
png("AccionesMarcasBoxplot.png")

boxplot(Precio ~ Marcas, data = BaseBoxplot, xlab = "Marcas", ylab = "Acciones en 1 año", main = "Acciones de las marcas (x mes) en un año", las = 2)

dev.off()
```

# Histogramas

Un histograma en R es el gráfico más habitual para representar datos continuos. Este tipo de gráfico es similar a un diagrama de barras, pero que representa las frecuencias en las que aparecen las mediciones agrupadas en ciertos intervalos y cuenta cuántas observaciones caen en cada intervalo.

## ¿Cómo hacer un histograma en R? La función ``hist()``

Puedes dibujar un histograma en R con la función hist. Por defecto, la función creará un histograma de frecuencias.

## Ejercicio:

Vamos a crear una base aletoria de una distribución normal

```{r}
# Cargamos la base dada:
Basehist <- read.table(file = "BaseHist.txt", header = T)

## Convertimos la variable en numerica:
Basehist$Normal <- as.numeric(Basehist$Normal)

## Ahora vamos a graficar la columna:
png("DisNormHist.png")

hist(Basehist$Normal,
     xlab = "Intervalo",
     main = "Distribución normal aleatoria",
     col = "green")

dev.off()
```


# Graficos de dispersión

Los diagramas o gráficos de dispersión, también conocidos como nubes de puntos, scatter plots o scatter chart por su nombre en inglés, representan las observaciones de las variables (generalmente dos, pero también pueden ser tres).

## ¿Cómo hacer un gráfico de dispersión en R?

Puedes crear un diagrama de dispersión en R con la función plot, especificando los valores de xx en el primer argumento y los valores de yy en el segundo, siendo xx e yy vectores numéricos de la misma longitud.

Al pasar estos parámetros, la función plot creará un gráfico de dispersión de forma predeterminada. También puedes especificar el símbolo de las observaciones de datos o incluso el color, entre otros parámetros gráficos.

## Ejercicio:

Vamos a ver los datos de los estudiantes, su peso y estatura y ver su relación con el siguiente grafico

```{r}
# Cargamos la base de datos:
BaseDis <- read.csv(file = "BasePlotDis.csv", header = T, sep = ",", dec = ".")

## Ahora graficamos y exportamos:

png("RelacionDis.png")

plot(BaseDis$Estatura, BaseDis$Peso, xlab = "Estatura en Cm", ylab = "Peso en Kg", main = "Grafico de Dispersión entre peso y estatura")

dev.off()
```


