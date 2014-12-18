source("funciones.R")
g1<- graficaLineaTrim(dfcet1$"1_01")
exportarLatex("CET1//1_01.tex",g1)

g2 <- graficaLineaTrim(dfcet1$"1_02")
exportarLatex("CET1//1_02.tex",g2)

g3 <- graficaLineaTrim(dfcet1$"1_03")
exportarLatex("CET1//1_03.tex",g3)

g4<- graficaLineaTrim(dfcet1$"1_04")
exportarLatex("CET1//1_04.tex",g4)


#g5 <- graficaCol(dfcet1$"1_05", ordenar = F)
#g5 <- etiquetasHorizontales(g5)
#g5 <- rotarEtiX(g5)
#exportarLatex("CET1//1_05.tex",g5)

g6 <- graficaLineaTrim(dfcet1$"1_06")
exportarLatex("CET1//1_06.tex",g6)

#g7<- graficaCol(dfcet1$"1_07")
#g7 <- etiquetasHorizontales(g7)
#g7 <- rotarEtiX(g7)
#exportarLatex("CET1//1_07.tex",g7)

#g8<- graficaCol(dfcet1$"1_08")
#g8 <- etiquetasHorizontales(g8)
#g8 <- rotarEtiX(g8)
#exportarLatex("CET1//1_08.tex",g8)

g9<- graficaCol(dfcet1$"1_09")
g9 <- etiquetasHorizontales(g9)
g9 <- rotarEtiX(g9)
exportarLatex("CET1//1_09.tex",g9)

g10<- graficaCol(dfcet1$"1_10")
g10 <- etiquetasHorizontales(g10)
g10 <- rotarEtiX(g10)
exportarLatex("CET1//1_10.tex",g10)


g11<- graficaBar(dfcet1$"1_11")
g11 <- etiquetasBarras(g11)
exportarLatex("CET1//1_11.tex",g11)

g12 <- graficaBar(dfcet1$"1_12")
g12 <- etiquetasBarras(g12)
exportarLatex("CET1//1_12.tex",g12)


g13<- graficaCol(dfcet1$"1_13")
g13 <- etiquetasHorizontales(g13)
g13 <- rotarEtiX(g13)
exportarLatex("CET1//1_13.tex",g13)

g14<- graficaBar(dfcet1$"1_14", ordenar = F)
g14 <- etiquetasBarras(g14)
exportarLatex("CET1//1_14.tex",g14)

