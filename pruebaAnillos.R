##############MIS INTENTOS DE PIES###############################
p1 <- pie(tablas$"pie1"$y,labels = tablas$"pie1"$y)

tikz("Pruebas Tcolorbox/donout.tex" , standAlone = TRUE, bg = "transparent",bareBones = FALSE, width = 3.19, height= 1.91, sanitize= F)
temaN <-theme_gray(base_size = fontSize, base_family = "Open Sans Condensed Light")
theme_set(temaBarras)
tablas$"pie1"$ymax = cumsum(tablas$"pie1"$y)
tablas$"pie1"$ymin = c(0, head(tablas$"pie1"$ymax, n=-1))
y.breaks <- cumsum(tablas$"pie1"$y)-tablas$"pie1"$y/2 
p1 <- ggplot(tablas$"pie1", aes(fill =  x, ymax = ymax, ymin = ymin ,xmax= 10, xmin= 5))+
  #geom_rect(show_guide=F)+
  geom_rect(colour= "white", show_guide=F)+
  labs(x=NULL, y=NULL)+
  scale_y_continuous(breaks = y.breaks, labels=tablas$"pie1"$y)+
  labs(x = NULL, y=NULL)+
  coord_polar(theta ="y")+
  xlim(c(0,10 ))+
  guides(fill = guide_legend(title = NULL))+
  theme(plot.margin = unit(c(0,inc2mm(3.19/4),0,-20),"mm"), axis.line.y = element_line(colour=NA),
        axis.ticks.y = element_line(colour=NA),
        panel.margin = unit(c(0,inc2mm(3.19/4),0,-20),"mm"),
        axis.text.y = element_text(colour = NA, vjust = -3, hjust = -3),
        axis.text.x = element_text(family = "Open Sans Condensed Light", colour = "black", face = "plain", size = 9, hjust = -10, vjust =-10, angle = 0, lineheight = 0.9)
        )
temp<- ggplot_gtable(ggplot_build(p1))
temp$layout$clip[temp$layout$name=="panel"] <- "off"
grid.draw(temp)
tikzCoord(2*3.19/3, 1.91/2, name= "rect", units = "inches") ## ESTA ES LA QUE FUNCIONA 
tikzCoord(0,mm2inch(2.5+ 4), name = "desY", units= "inches")
tikzCoord(mm2inch(2.5),mm2inch(0+ 4), name = "desX", units = "inches")
tikzCoord(mm2inch(2.5),-mm2inch(0+ 4), name = "mdesX", units = "inches")
tikzAnnotate("\\coordinate (t1) at ($(rect) + 0.5*(desX) + 0.5*(desY)$);")
tikzAnnotate("\\coordinate (t2) at ($(rect)+0.5*(mdesX)-0.5*(desY)$);")
tikzAnnotate(c("\\path [fill=red] ($(rect)+(desY)$) rectangle ($(rect)+(desX)$);"))
tikzAnnotate(c("\\node [text width=",
                mm2pt(20), 
               ",right= 0.3cm of t1,scale = 0.9]{Esta es una etiqueta larga};"))
tikzAnnotate(c("\\path [fill=blue] ($(rect)-(desY)$) rectangle ($(rect)+(mdesX)$);"))
tikzAnnotate(c("\\node [text width=",
               mm2pt(20), 
               ",right= 0.3cm of t2,scale = 0.9]{Etiqueta 1};"))

dev.off()
#pdf(file = "pruebaPie.pdf", family = "Open Sans Condensed Light", width = 3.19, height= 1.91)
#print(p1)
#dev.off()


# Input the ad data
ad = data.frame(
  type = c("Poster", "Billboard", "Bus", "Digital"),
  n = c(529, 356, 59, 81)
)

# Bar plot
library(ggplot2)
ggplot(data = ad, aes(x = type, y = n, fill = type)) +
  geom_bar(stat = "identity", show_guide = FALSE) +
  theme_bw()

# Add addition columns to data, needed for donut plot.
ad$fraction = ad$n / sum(ad$n)
ad$ymax = cumsum(ad$fraction)
ad$ymin = c(0, head(ad$ymax, n = -1))

# Donut plot
theme_set(temaColumnas)
g2 <- ggplot(data = ad, aes(fill = type, ymax = ymax, ymin = ymin, xmax = 4, xmin = 3)) +
  geom_rect(colour = "grey30", show_guide = FALSE) +
  coord_polar(theta = "y") +
  xlim(c(0, 5)) +
  theme_bw() +
  theme(panel.grid=element_blank()) +
  theme(axis.text=element_blank()) +
  theme(axis.ticks=element_blank()) +
  geom_text(aes(x = 5, y = ymax , label = type)) +
  xlab("") +
  ylab("")

browsers <- structure(list(browser = structure(c(3L, 3L, 3L, 3L, 2L, 2L, 
                                                 2L, 1L, 5L, 5L, 4L), .Label = c("Chrome", "Firefox", "MSIE", 
                                                                                 "Opera", "Safari"), class = "factor"), version = structure(c(5L, 
                                                                                                                                              6L, 7L, 8L, 2L, 3L, 4L, 1L, 10L, 11L, 9L), .Label = c("Chrome 10.0", 
                                                                                                                                                                                                    "Firefox 3.5", "Firefox 3.6", "Firefox 4.0", "MSIE 6.0", "MSIE 7.0", 
                                                                                                                                                                                                    "MSIE 8.0", "MSIE 9.0", "Opera 11.x", "Safari 4.0", "Safari 5.0"), 
                                                                                                                                            class = "factor"), share = c(10.85, 7.35, 33.06, 2.81, 1.58, 
                                                                                                                                                                         13.12, 5.43, 9.91, 1.42, 4.55, 1.65), ymax = c(10.85, 18.2, 51.26, 
                                                                                                                                                                                                                        54.07, 55.65, 68.77, 74.2, 84.11, 85.53, 90.08, 91.73), ymin = c(0, 
                                                                                                                                                                                                                                                                                         10.85, 18.2, 51.26, 54.07, 55.65, 68.77, 74.2, 84.11, 85.53, 
                                                                                                                                                                                                                                                                                         90.08)), .Names = c("browser", "version", "share", "ymax", "ymin"),
                      row.names = c(NA, -11L), class = "data.frame")

browsers$total <- with(browsers, ave(share, browser, FUN = sum))

givemedonutsorgivemedeath <- function(file, width = 15, height = 11) {
  ## house keeping 
  if (missing(file)) file <- getwd()
  plot.new(); op <- par(no.readonly = TRUE); on.exit(par(op))
  
  tikz(file,standAlone = T, width=3.88, height=2.70, bg = 'snow')
  
  ## useful values and colors to work with
  ## each group will have a specific color
  ## each subgroup will have a specific shade of that color
  nr <- nrow(browsers)
  width <- max(sqrt(browsers$share)) / 0.8
  
  tbl <- with(browsers, table(browser)[order(unique(browser))])
  cols <- c('cyan2','red','orange','green','dodgerblue2')
  cols <- unlist(Map(rep, cols, tbl))
  
  ## loop creates pie slices
  plot.new()
  par(omi = c(0.5,0.5,0.75,0.5), mai = c(0.1,0.1,0.1,0.1), las = 1)
  for (i in 1:nr) {
    par(new = TRUE)
    
    ## create color/shades
    rgb <- col2rgb(cols[i])
    f0 <- rep(NA, nr)
    f0[i] <- rgb(rgb[1], rgb[2], rgb[3], 190 / sequence(tbl)[i], maxColorValue = 255)
    
    ## stick labels on the outermost section
    lab <- with(browsers, sprintf('%s: %s', version, share))
    if (with(browsers, share[i] == max(share))) {
      lab0 <- lab
    } else lab0 <- NA
    
    # plot the outside pie and shades of subgroups
    pie(browsers$share, border = NA, radius = 5 / width, col = f0, 
        labels = lab0, cex = 1.8)
    
    ## repeat above for the main groups
    par(new = TRUE)
    rgb <- col2rgb(cols[i])
    f0[i] <- rgb(rgb[1], rgb[2], rgb[3], maxColorValue = 255)
    
    pie(browsers$share, border = NA, radius = 4 / width, col = f0, labels = NA)
  }
  
  ## extra labels on graph
  
  ## center labels, guess and check?
  text(x = c(-.05, -.05, 0.15, .25, .3), y = c(.08, -.12, -.15, -.08, -.02), 
       labels = unique(browsers$browser), col = 'white', cex = 1.2)
  dev.off()
}

givemedonutsorgivemedeath('~/desktop/donuts.tex')