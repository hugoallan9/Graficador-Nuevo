####################MINIMAL EXAMPLE#############################
require(ggplot2)
require(tikzDevice)
require(grid)
require(extrafont)
require(gridExtra)
########################SETUP###################
gris <- rgb(200,200,200, maxColorValue = 255)
grisBase <- rgb(152,152,152, maxColorValue = 255)
color <- "black"
fontSize = 10
temaINE <- theme_gray(base_size = fontSize, base_family = "Open Sans Condensed Light")+ theme(
  text= element_text(family = "Open Sans Condensed Light", face = "plain", colour='black', size = fontSize),
  axis.text.x = element_text(family = "Open Sans Condensed Light", colour = "black", face = "plain", size = 10, hjust = 0.5, vjust =0.5, angle = 0, lineheight = 0.9),
  axis.text.y = element_text(family = "Open Sans Condensed Light", colour = "black", face = "plain", size = 10, hjust = 0.5, vjust =0.5, angle = 0, lineheight = 0.9),
  panel.background = element_rect(fill = NA),
  panel.grid = element_line(colour = NA),
  panel.grid.major = element_line(colour = NA),
  panel.grid.minor = element_line(colour = NA),
  panel.grid.major.y =  element_line(colour = NA),
  axis.line = element_line(colour = grisBase),
  plot.margin = rep(unit(0,"null"),4),
  axis.ticks = element_line(colour = NA),
  axis.ticks.x = element_line( size=NULL, color=NA ),
  axis.ticks.y = element_line(size = NULL, color=NA),
  plot.background = element_rect(fill = NA)
)

temaBarras <- temaINE
temaBarras <- temaBarras + theme(
  axis.line.y = element_line(colour = color),
  axis.line.x = element_line(colour = NA),
  axis.text.y = element_text(hjust = 1, vjust = 0.5)
) 

temaColumnas <- temaINE
temaColumnas <- temaBarras + theme(
  axis.line.x = element_line(colour = color),
  axis.line.y = element_line(colour = NA),
  axis.text.y = element_text(colour = NA)
)

options(tikzDefaultEngine = "xetex")
options(tikzXelatexPackages = c("\\usepackage{tikz}\n",
                                "\\usepackage{amsmath}",
                                "\\usepackage{amsfonts}",
                                "\\usepackage{amssymb}",
                                "\\usepackage{graphicx}",
                                "\\usepackage{pdfpages}",
                                "\\usepackage{setspace}",
                                "\\usepackage{xltxtra}",
                                "\\usepackage{enumitem}",
                                "\\usepackage[active,tightpage,xetex]{preview}\n",
                                "\\usepackage{fontspec,xunicode}\n",
                                "\\PreviewEnvironment{pgfpicture}\n",
                                "\\setlength\\PreviewBorder{0pt}\n",
                                "\\setmainfont{Open Sans Condensed Light}\n",
                                "\\newfontfamily\\Bold{Open Sans Condensed Bold}",
                                "\\newfontfamily\\Sans{Open Sans}",
                                "\\newfontfamily\\Italic{Open Sans Condensed Light Italic}"))

options(tikzUnicodeMetricPackages = c("\\usepackage[T1]{fontenc}\n","\\usetikzlibrary{calc}\n"))

options(tikzDocumentDeclaration= "\\documentclass[10pt,twoside]{book}")


#############################DATA########################################
data <- data.frame(
  x = c("Maya", "Garifuna", "Xinca", "Mestizo / Ladino", "Otro", "Ignorado"),
  y =c(44.19, 0.02,0.03,48.10,0.50,7.16)
  )

###########################SOME FUNCTIONS #############################
graficaBar <- function(data, color1="black", ancho = 0.6, ordenar = TRUE)
{
  theme_set(temaBarras)
  names(data)<- c("x","y")
  data$x <- factor(data$x, levels = data$x)
  grafica <- ggplot(data, aes(x, y))
  grafica <- grafica + 
    geom_bar(stat = 'identity',fill = rep(color1,length(data$x)), width = ancho, position =  "dodge")+
    labs(x="",y="")+
    scale_y_continuous(breaks=NULL, expand= c(0.0,0.0))+
    coord_flip()+
    theme(
      plot.margin = unit(c(0,0,0,0),"mm"))
  print(grafica)
  return(grafica)
}

t1 <- graficaBar(data)
tikz("minimal.tex", standAlone = TRUE, bg = "transparent",bareBones = FALSE, width = 3.19, height= 1.91, sanitize= TRUE)
print(t1)
dev.off()


