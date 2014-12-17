source("funciones.R")

t1 <- graficaLineaTrim(dfvt1$"1_01")
preview(t1)
exportarLatex("VT1/1_01.tex", t1)

t2 <- graficaCol(dfvt1$"1_02")
t2 <- etiquetasVerticales(t2)
t2 <- rotarEtiX2(t2)
preview(t2)
exportarLatex("VT1//1_02.tex", t2)

t3<- graficaBar(dfvt1$"1_02")
t3 <- etiquetasBarras(t3)
preview(t3)
exportarLatex("VT1//1_03.tex", t3)