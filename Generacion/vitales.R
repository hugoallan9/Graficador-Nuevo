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
t3 <- rotarEtiX(t3)
exportarLatex("HT1//1_03.tex", t3)

t4 <- graficaCol(dfht1$"1_04", ordenar = F)
t4 <- etiquetasHorizontales(t4)
exportarLatex("HT1//1_04.tex", t4)

t5 <- graficaBar(dfht1$"1_05")
t5 <- etiquetasBarras(t5)
exportarLatex("HT1//1_05.tex", t5)

t6 <- graficaCol(dfht1$"1_06")
t6 <- etiquetasHorizontales(t6)
exportarLatex("HT1//1_06.tex", t6)

# t7 <- graficaCol(dfht1$"1_07")
# t7 <- etiquetasHorizontales(t7)
# exportarLatex("HT1//1_07.tex", t7)

t8 <- graficaBar(dfht1$"1_08")
t8 <- etiquetasBarras(t8)
exportarLatex("HT1//1_08.tex", t8)




t9 <- graficaLineaTrim(dfht1$"1_09")
exportarLatex("HT1/1_09.tex", t9)


t10 <- graficaCol(dfht1$"1_10")
t10 <- etiquetasHorizontales(t10)
exportarLatex("HT1//1_10.tex", t10)


t11 <- graficaLineaTrim(dfht1$"2_01")
exportarLatex("HT1/2_01.tex", t11)


t12 <- graficaCol(dfht1$"2_02")
t12 <- etiquetasVerticales(t12)
t12 <- rotarEtiX2(t12)
exportarLatex("HT1//2_02.tex", t12)


t13 <- graficaCol(dfht1$"2_03", ordenar = F)
t13 <- etiquetasHorizontales(t13)
exportarLatex("HT1//2_03.tex", t13)


#t14 <- graficaBar(dfht1$"2_04")
#t14 <- etiquetasBarras(t14)
#exportarLatex("HT1//2_04.tex", t14)


t15 <- graficaLineaTrim(dfht1$"2_05")
exportarLatex("HT1/2_05.tex", t15)


t16 <- graficaCol(dfht1$"2_06")
t16 <- etiquetasHorizontales(t16)
exportarLatex("HT1//2_06.tex", t16)


t17 <- graficaBar(dfht1$"2_07")
t17 <- etiquetasBarras(t17)
exportarLatex("HT1//2_07.tex", t17)


t18 <- graficaLineaTrim(dfht1$"3_01")
exportarLatex("HT1/3_01.tex", t18)

t19 <- graficaCol(dfht1$"3_02")
t19 <- etiquetasVerticales(t19)
t19 <- rotarEtiX2(t19)
exportarLatex("HT1//3_02.tex", t19)

t20 <- graficaCol(dfht1$"3_03", ordenar = F)
t20 <- etiquetasHorizontales(t20)
exportarLatex("HT1//3_03.tex", t20)

t21 <- graficaCol(dfht1$"3_04", ordenar = F)
t21 <- etiquetasHorizontales(t21)
exportarLatex("HT1//3_04.tex", t21)

t22 <- graficaBar(dfht1$"3_05")
t22 <- etiquetasBarras(t22)
exportarLatex("HT1//3_05.tex", t22)

t23 <- graficaCol(dfht1$"3_06")
t23 <- etiquetasHorizontales(t23)
exportarLatex("HT1//3_06.tex", t23)

t24 <- graficaBar(dfht1$"3_07")
t24 <- etiquetasBarras(t24)
exportarLatex("HT1//3_07.tex", t24)

t25 <- graficaLineaTrim(dfht1$"4_01")
exportarLatex("HT1/4_01.tex", t25)

t26 <- graficaCol(dfht1$"4_02")
t26 <- etiquetasVerticales(t26)
t26 <- rotarEtiX2(t26)
exportarLatex("HT1//4_02.tex", t26)

t27 <- graficaCol(dfht1$"4_03", ordenar = F)
t27 <- etiquetasHorizontales(t27)
exportarLatex("HT1//4_03.tex", t27)

t28 <- graficaBar(dfht1$"4_04")
t28 <- etiquetasBarras(t28)
exportarLatex("HT1//4_04.tex", t28)


t29 <- graficaLineaTrim(dfht1$"5_01")
exportarLatex("HT1/5_01.tex", t29)

t30 <- graficaCol(dfht1$"5_02")
t30 <- etiquetasVerticales(t30)
t30 <- rotarEtiX2(t30)
exportarLatex("HT1//5_02.tex", t30)
