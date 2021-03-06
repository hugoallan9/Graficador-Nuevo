#***************SCRIPT CON FUNCIONES PARA GRAFICAR*********************#
source("setup.R")
#source("datos.R")




graficaCol <- function(data, color1=color, ancho = 0.6, ordenar = TRUE)
{
 theme_set(temaColumnas)
 names(data)<- c("x","y")
 data <- data[ordenarNiveles(data, ordenar),]
 data$x <- factor(data$x, levels = data$x)
 levels(data$x) <- gsub("\\\\n", "\n", levels(data$x))
 grafica <- ggplot(data, aes(x, y))
 grafica <- grafica + 
   geom_bar(stat = 'identity', colour = calcularRampa(data, color1), fill = calcularRampa(data,NA), width = ancho, position =  "dodge")+
   labs(x=NULL,y=NULL)+
   scale_y_continuous(breaks=NULL, expand= c(0.0,0.0))
 print(grafica)
 return(grafica)
}

graficaBar <- function(data, color1=color, ancho = 0.6, ordenar = TRUE)
{
  theme_set(temaBarras)
  names(data)<- c("x","y")
  data <- data[rev(ordenarNiveles(data, ordenar)),]
  data$x <- factor(data$x, levels = data$x)
  levels(data$x) <- gsub("\\n", "\n", levels(data$x))
  grafica <- ggplot(data, aes(x, y))
  grafica <- grafica + 
    geom_bar(stat = 'identity',fill = calcularRampa(data, NA), colour = calcularRampa(data, color1), width = ancho, position =  "dodge")+
    labs(x=NULL,y=NULL)+
    scale_y_continuous(breaks=NULL, expand= c(0.0,0.0))+
    coord_flip()
  print(grafica)
  return(grafica)
}

graficaLinea <- function(data, color1 = color, inicio = 0, ancho = 1.7)
{
 theme_set(temaColumnas)
 names(data)<- c("x","y")
 grafica <- ggplot(data, aes(x,y))
 grafica <- grafica + geom_line( colour = color1, size = ancho)+
 labs(x=NULL,y=NULL)
 grafica <- etiquetasLineas(grafica, calcularPosiciones(grafica))
 minimo <- min(ggplot_build(grafica)$data[[1]]$y)
 maximo <- max(ggplot_build(grafica)$data[[1]]$y)
 limite <- minimo - 0.3*(maximo - minimo)
if(ggplot_build(grafica)$data[[1]]$y[1] > 3)
{
  grafica <- grafica + scale_y_continuous(limits = c(limite,NA))+
    theme(plot.margin = unit(c(2.5,3,0,-7), "mm"))
}
else
{
  grafica <- grafica + scale_y_continuous(limits = c(limite,NA))+
    theme(plot.margin = unit(c(2.5,3,0,-4), "mm"))
}
 return(grafica)
}

graficaLineaTrim <- function(data, color1 = color, inicio = 0, ancho = 0.5)
{
  theme_set(temaColumnas)
  names(data)<- c("x","y")
  nomX <- data$x
  data$x <- factor(data$x, as.character(data$x))
  #data$x <- as.numeric(data$x)
  grafica <- ggplot(data, aes(x,y, group = 1))
  grafica <- grafica + geom_line( colour = color1, size = ancho)+
    labs(x=NULL,y=NULL)+
    theme(axis.text.x = element_text(family = "Open Sans Condensed Light",angle = 90, vjust =0.5 , hjust= 1))
  grafica <- etiquetasLineas(grafica, calcularPosiciones(grafica))
  minimo <- min(ggplot_build(grafica)$data[[1]]$y)
  maximo <- max(ggplot_build(grafica)$data[[1]]$y)
  limite <- minimo - 0.5*(maximo - minimo)
  if(ggplot_build(grafica)$data[[1]]$y[1] > 3)
  {
    grafica <- grafica + scale_y_continuous(limits = c(limite,NA))+
      theme(plot.margin = unit(c(2.5,3,0,-7), "mm")) #-9
  }
  else
  {
    grafica <- grafica + scale_y_continuous(limits = c(limite,NA))+
      theme(plot.margin = unit(c(2.5,3,0,-3), "mm")) #-4
  }
  return(grafica)
}


calcularPosiciones <- function(graph)
{
  #SIMBOLOGIA
  # 1 HACIA ARRIBA
  #-1 HACIA ABAJO
  #0.5 A LA DERECHA
  #-0.5 A LA IZQUIERDA
  data <- ggplot_build(graph)$data[[1]]
  print(data)
  posiciones <- NULL
  if(data$y[[1]] < data$y[[2]])
  {
    posiciones <- c(posiciones, -1)
  }
  else{
    posiciones <- c(posiciones, 1)  
  }
  
  
  for(i in 2:(length(data$y)-1))
  {
    if(data$y[[i-1]] == data$y[[i]])
    {
      if(data$y[[i+1]] > data$y[[i]])
      {
        posiciones <- c(posiciones, -1)
      }else if(data$y[[i+1]] == data$y[[i]])
      {
        posiciones <- c(posiciones, 1)
      }else if(data$y[[i+1]] < data$y[[i]]){
        posiciones <- c(posiciones, 1)
      }
    }else if(data$y[[i-1]] > data$y[[i]])
    {
      if(data$y[[i]] > data$y[[i+1]])
      {
        posiciones <- c(posiciones, 0.5)
      }
      else{
        posiciones <- c(posiciones, -1)
      }
    }else
    {
      if(data$y[[i]] < data$y[[i+1]])
      {
        posiciones <- c(posiciones, -0.5)
      }
      else
      {
        posiciones <- c(posiciones, 1)
      }
    }
  }
  if(data$y[[length(data$y)]] == data$y[[length(data$y)-1]])
  {
    posiciones <- c(posiciones, 1)
  }else if(data$y[[length(data$y)]] < data$y[[length(data$y)-1]])
  {
    posiciones <- c(posiciones, -1)
  }else
  {
    posiciones <- c(posiciones, 1)
  }
  print(posiciones)
  return(posiciones)
}


etiquetasLineas <- function(graph, posiciones)
{
  d <- ggplot_build(graph)$data[[1]]
  for(i in 1:length(posiciones))
  {
    dato <- d$y[[i]]
    cat(c("El dato es jojo : ", dato, "\n"))
    print(i)
    print(length(d$etiqueta))
    d$etiqueta <- as.numeric(completarEtiquetas(dato,i,tam = length(d$x)))
    print("#######################################")
    print(sonEnteros(d))
    print("#######################################")
    if(sonEnteros(d) > 0)
    {
      if(posiciones[[i]] == 1)
      {
        graph <- graph + geom_text(data = d, aes(label=ifelse(is.na(etiqueta),"",formatC(etiqueta,format = "f",big.mark = ",", digits = 1)),family="Open Sans Condensed Light"),size=3.2,hjust = 0.5, vjust = -0.5)
      }else if(posiciones[[i]] == -1)
      {
        graph <- graph + geom_text(data = d,aes(label=ifelse(is.na(etiqueta),"",formatC(etiqueta,format = "f",big.mark = ",", digits = 1)),family="Open Sans Condensed Light"),size=3.2,hjust = 0.5, vjust = 1.5)
      }else if(posiciones[[i]] == 0.5)
      {
        graph <- graph + geom_text(data =d,aes(label=ifelse(is.na(etiqueta),"",formatC(etiqueta,format = "f",big.mark = ",", digits = 1)),family="Open Sans Condensed Light"),size=3.2,hjust = 0, vjust = -0.5)
      }
      else
      {
        graph <- graph + geom_text(data = d,aes(label=ifelse(is.na(etiqueta),"",formatC(etiqueta,format = "f",big.mark = ",", digits = 1)),family="Open Sans Condensed Light"),size=3.2,hjust = 1.2, vjust = 0)
      }      
    }
    else
    {if(posiciones[[i]] == 1)
    {
      graph <- graph + geom_text(data = d, aes(label=ifelse(is.na(etiqueta),"",formatC(etiqueta,format = "f",big.mark = ",", digits = 1, drop0trailing = T)),family="Open Sans Condensed Light"),size=3.2,hjust = 0.5, vjust = -0.5)
    }else if(posiciones[[i]] == -1)
    {
      graph <- graph + geom_text(data = d,aes(label=ifelse(is.na(etiqueta),"",formatC(etiqueta,format = "f",big.mark = ",", digits = 1, drop0trailing = T)),family="Open Sans Condensed Light"),size=3.2,hjust = 0.5, vjust = 1.5)
    }else if(posiciones[[i]] == 0.5)
    {
      graph <- graph + geom_text(data =d,aes(label=ifelse(is.na(etiqueta),"",formatC(etiqueta,format = "f",big.mark = ",", digits = 1, drop0trailing = T)),family="Open Sans Condensed Light"),size=3.2,hjust = 0, vjust = -0.5)
    }
    else
    {
      graph <- graph + geom_text(data = d,aes(label=ifelse(is.na(etiqueta),"",formatC(etiqueta,format = "f",big.mark = ",", digits = 1, drop0trailing = T)),family="Open Sans Condensed Light"),size=3.2,hjust = 1.2, vjust = 0)
    }
  }
    
  }
  return(graph)
}

completarEtiquetas <- function(dato,posicion, tam = 5)
{
  #cat(c("la posicion es: ", posicion))
  #cat(c("el dato es: ", dato))
  etiquetas <- NULL
  for(i in 1:tam)
  {
    if(i == posicion)
    {
      print("Entre al if")
      etiquetas <- c(etiquetas, dato)
    }
    else
    {
      print("Entre al else")
      etiquetas <- c(etiquetas,"")  
    }
  }
  return(etiquetas)
}

rotarEtiX <- function(graph)
{
  
  longitud <- usep + 2
  graph <- graph + theme(axis.text.x = element_text(angle = 90, vjust =0.5 , hjust= 1))+
    theme(plot.margin = unit(c(longitud,0,0,0), "mm"))

}

rotarEtiX2 <- function(graph)
{
  max <-ggplot_build(graph)$panel$ranges[[1]]$y.range[2]
  longitud <- getLatexStrWidth(formatC(max,format = "f",big.mark = ",", digits = 1), cex = fEscala) 
  longitud <- longitud*0.352777778 + wspace
    graph <- graph + theme(axis.text.x = element_text(angle = 90, vjust =0.5 , hjust= 1))+
    theme(plot.margin = unit(c(longitud,0,0,0), "mm"))
}

etiquetasBarras <- function(graph, margenIz = izBar  )
{
  max <-ggplot_build(graph)$panel$ranges[[1]]$x.range[2]
  print(max)
  longitud <- getLatexStrWidth(formatC(max,format = "f",big.mark = ",", digits = 1), cex = fEscala) 
  longitud <- longitud*0.352777778 + wBarSpace
  print(max)
  mIz <- izBar + margenIz
  if(sonEnteros(ggplot_build(graph)$data[[1]]) == 0)
  {
    print("jojo SI son todos enteros")
    graph <- graph +
      geom_text(aes(family = "Open Sans Condensed Light",label= formatC(y,format = "f",big.mark = ",", digits = 1, drop0trailing = T)), size=3, hjust=-0.5, vjust = 0.5)+
      theme(plot.margin = unit(c(0,longitud,0,0), "mm")) 
  }
  else
  {
    graph <- graph +
      geom_text(aes(family = "Open Sans Condensed Light",label= formatC(y,format = "f",big.mark = ",", digits = 1)), size=3, hjust=-0.5, vjust = 0.5)+
      theme(plot.margin = unit(c(0,longitud,0,0), "mm")) 
  }
  
}

etiquetasHorizontales <- function(graph)
{
  longitud <- 4
    if(sonEnteros(ggplot_build(graph)$data[[1]]) == 0)
    {
      graph <- graph +
      geom_text(aes(family = "Open Sans Condensed Light",label= formatC(y,format = "f",digits = 1,big.mark = ",", drop0trailing = T)),size=3, hjust=0.5, vjust = -0.5)+
        theme(plot.margin = unit(c(longitud,0,0,0), "mm"))
    }
  else
  {
    graph <- graph +
    geom_text(aes(family = "Open Sans Condensed Light",label= formatC(y,format = "f",digits = 1,big.mark = ",")),size=3, hjust=0.5, vjust = -0.5)+
      theme(plot.margin = unit(c(longitud,0,0,0), "mm"))
  }
}

etiquetasVerticales <- function(graph)
{
  max <-ggplot_build(graph)$panel$ranges[[1]]$y.range[2] 
  #max <- nchar(formatC(as.character(max), big.mark = ",", format = "f", digits =1))
  longitud <- getLatexStrWidth(formatC(max,format = "f",big.mark = ",", digits = 1), cex = fEscala) 
  longitud <- longitud*0.352777778 + wspace
  print(max)
  if(sonEnteros(ggplot_build(graph)$data[[1]]) == 0)
  {
    graph <- graph +
      geom_text(aes(family = "Open Sans Condensed Light",label= formatC(y, big.mark = ",", format = "f", digits =1, drop0trailing = T)), angle = 90, size=3, hjust=-0.1, vjust = 0.5)+
      theme(plot.margin = unit(c(longitud,0,0,0), "mm"))  
  }
  else
  {
    graph <- graph +
      geom_text(aes(family = "Open Sans Condensed Light",label= formatC(y, big.mark = ",", format = "f", digits =1)), angle = 90, size=3, hjust=-0.1, vjust = 0.5)+
      theme(plot.margin = unit(c(longitud,0,0,0), "mm"))
  }
}

exportarLatex <- function(nombre = grafica, graph)
{
  #gy = ggplot_build(graph)$panel$ranges[[1]]$y.range[2]
  #print(gy)
  #graph = graph + scale_y_continuous(expand=c(0,0),limits=c(0,gy))
  #print(graph)
  tikz(nombre, standAlone = FALSE, bareBones = TRUE, bg = "transparent",width = 3.19, height= 1.91, sanitize = F)
  temp<- ggplot_gtable(ggplot_build(graph))
  temp$layout$clip[temp$layout$name=="panel"] <- "off"
  grid.draw(temp)
  dev.off()
  #shell(cmd=paste("iconv -f ISO-8859-1 -t UTF-8 <", nombre,">", paste(dirname(nombre),"/temp",sep="")), mustWork=TRUE, intern=TRUE, translate=TRUE)
  #file.copy(from = paste(dirname(nombre), "/temp",sep=""), to=paste(dirname(nombre),"Generacion",basename(nombre),sep="/"), overwrite = TRUE)
}

compilar <- function(ruta = paste(getwd(), "Latex/ENEI.tex",sep="/")){
  shell(cmd=paste("cd", dirname(ruta), "&&xelatex  --synctex=1 --interaction=nonstopmode",ruta), mustWork=TRUE, intern=TRUE, translate=TRUE)
  shell.exec(paste(dirname(ruta), "ENEI.pdf", sep="/"))
}

preview <- function(graph)
{
  nombre = tempfile(pattern="Preview", tmpdir= paste(normalizePath(getwd()),"Temporal", sep="\\"))
  tikz(paste(nombre,".tex", sep= ""), standAlone = TRUE, bg = "transparent",bareBones = FALSE, width = 3.19, height= 1.91, sanitize= F)
  temp<- ggplot_gtable(ggplot_build(graph))
  temp$layout$clip[temp$layout$name=="panel"] <- "off"
  grid.draw(temp)
  dev.off()
  shell(cmd=paste("xelatex   --synctex=1 --interaction=nonstopmode", "--output-directory",dirname(nombre),paste(nombre,".tex", sep="")))
  shell.exec(paste(nombre,".pdf", sep=""))
}


calcularRampa <- function(data, color1)
{
  rampa = NULL
  for(elemento in data$x)
  {
    if(elemento %in% ignorado)
    {
      rampa = c(rampa,gris)
    }
    else if(elemento %in% repu)
    {
      rampa = c(rampa, color2)
    }
    else
    {
      rampa = c(rampa,color1)
    }
  }
  return(rampa)
}



ordenarNiveles <- function(data, ordenar = TRUE)
{
  nuevoOrden <- NULL
  ignNombre <- NULL
  ign = 0
  orden <- NULL
  print(ordenar)
  if(ordenar)
  {
    orden <- order(data$y, decreasing = T)
    
  }
  else
  {
    for(i in (1:length(data$x)))
      orden <- c(orden,i)
  }
    for(elemento in orden)
  {
    if( data[elemento,]$x %in% ignorado)
    {
      ign = 1
      pos <- elemento
    }
    else{
      nuevoOrden <- c(nuevoOrden, elemento)
    }
  }
  if(ign == 1)
  {
    nuevoOrden <- c(nuevoOrden, pos)
  }
  print(nuevoOrden)
  return(nuevoOrden)
}

existeTraslape <- function(graph,ancho = 0.6)
{
  ejeX <- 99.1 *0.0393700787
  etiquetas <- ggplot_build(graph)$panel$ranges[[1]]$x.labels
  tam <- list()
  for(i in 1:length(etiquetas))
  {
    tam[i] <- getLatexStrWidth(etiquetas[[i]], cex = ancho)   
  }
  lapply(tam, pt2mm)
  nuBarras <- length(etiquetas)
  semiEspacio <- 99.1/(2*nuBarras)
  
}

pt2mm <- function(unidad)
{
  return (unidad*pts2mm)
}


is.wholenumber <-
  function(x, tol = .Machine$double.eps^0.5)  abs(x - round(x)) < tol

sonEnteros <- function(data)
{
  contador = 0
  for(i in (1:length(data$y)))
    if(is.wholenumber(data$y[[i]]))
      break
  else
    contador = contador +1
  return(contador)
}

inc2mm <-function(number)
{
  return(number*25.4)
}

inc2pt <- function(number)
{
  return(number*72)
}

mm2inch <- function(number)
{
  return(number*0.0393700787)
}

mm2pt <- function(number)
{
  return(mm2inch(inc2pt(number)))
}