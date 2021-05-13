## ----setup, include=FALSE---------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ----Protocolo, eval=FALSE, include=TRUE------------------------------------
## "Protocolo:
## 
##  1. Daniel Felipe Villa
## 
##  2. Lenguaje: R
## 
##  3. Tema: Gráficos con R: tortas, barras, boxplots, histogramas, gráficos de dispersión (realice al menos dos ejercicios que requieran cargar archivos externos, leer y procesar la información del archvo leído, y guardar las respuestas a los ejercicios en archivos independientes)
## 
##  4. Fuentes:
##     https://bookdown.org/jboscomendoza/r-principiantes4/datos-usados-en-el-capitulo.html"


## ---------------------------------------------------------------------------
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


## ---------------------------------------------------------------------------
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


## ---------------------------------------------------------------------------
# Cargamos la base de datos:
BaseBoxplot <- read.table(file = "BaseBoxplot.txt", header = T, sep = ",")

print(BaseBoxplot)

##Convertimos en factor la 1ra columna:
BaseBoxplot$Marcas <- as.factor(BaseBoxplot$Marcas)

## Ahora fabricamos el boxplot y lo exportamos:
png("AccionesMarcasBoxplot.png")

boxplot(Precio ~ Marcas, data = BaseBoxplot, xlab = "Marcas", ylab = "Acciones en 1 año", main = "Acciones de las marcas (x mes) en un año", las = 2)

dev.off()


## ---------------------------------------------------------------------------
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


## ---------------------------------------------------------------------------
# Cargamos la base de datos:
BaseDis <- read.csv(file = "BasePlotDis.csv", header = T, sep = ",", dec = ".")

## Ahora graficamos y exportamos:

png("RelacionDis.png")

plot(BaseDis$Estatura, BaseDis$Peso, xlab = "Estatura en Cm", ylab = "Peso en Kg", main = "Grafico de Dispersión entre peso y estatura")

dev.off()

