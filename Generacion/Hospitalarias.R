source("funciones.R")


t1 <- graficaLineaTrim(dfht1$"1_01")
exportarLatex("HT1/1_01.tex", t1)

t2 <- graficaCol(dfht1$"1_02")
t2 <- etiquetasVerticales(t2)
t2 <- rotarEtiX2(t2)
exportarLatex("HT1//1_02.tex", t2)

#t3<- graficaBar(dfht1$"1_02")
#t3 <- etiquetasBarras(t3)
#preview(t3)
#exportarLatex("HT1//1_03.tex", t3)

t3 <- graficaCol(dfht1$"1_03", ordenar = F)
t3 <- etiquetasHorizontales(t3)
exportarLatex("HT1//1_03.tex", t3)

t4 <- graficaCol(dfht1$"1_04", ordenar = F)
t4 <- etiquetasHorizontales(t4)
t4 <- rotarEtiX(t4)
exportarLatex("HT1//1_04.tex", t4)

t5 <- graficaLineaTrim(dfht1$"1_05")
exportarLatex("HT1//1_05.tex", t5)

t6 <- graficaCol(dfht1$"1_06")
t6 <- etiquetasHorizontales(t6)
exportarLatex("HT1//1_06.tex", t6)

 t7 <- graficaCol(dfht1$"1_07")
 t7 <- etiquetasHorizontales(t7)
 exportarLatex("HT1//1_07.tex", t7)



t8 <- graficaLineaTrim(dfht1$"2_01")
exportarLatex("HT1/2_01.tex", t8)


t9 <- graficaCol(dfht1$"2_02")
t9 <- etiquetasVerticales(t9)
t9 <- rotarEtiX2(t9)
exportarLatex("HT1//2_02.tex", t9)


t10 <- graficaCol(dfht1$"2_03", ordenar = F)
t10 <- etiquetasHorizontales(t10)
exportarLatex("HT1//2_03.tex", t10)


t11 <- graficaCol(dfht1$"2_04", ordenar = F)
t11 <- etiquetasHorizontales(t11)
t11 <- rotarEtiX(t11)
exportarLatex("HT1//2_04.tex", t11)


t12 <- graficaLineaTrim(dfht1$"2_05")
exportarLatex("HT1/2_05.tex", t12)


t13 <- graficaCol(dfht1$"2_06")
t13 <- etiquetasHorizontales(t13)
exportarLatex("HT1//2_06.tex", t13)


t14 <- graficaCol(dfht1$"2_07")
t14 <- etiquetasHorizontales(t14)
exportarLatex("HT1//2_07.tex", t14)


t15 <- graficaCol(dfht1$"2_08")
t15 <- etiquetasHorizontales(t15)
exportarLatex("HT1//2_08.tex", t15)


t16 <- graficaLineaTrim(dfht1$"2_09")
exportarLatex("HT1//2_09.tex", t16)

t17 <- graficaCol(dfht1$"2_10")
t17 <- etiquetasHorizontales(t17)
exportarLatex("HT1//2_10.tex", t17)