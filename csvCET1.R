dir <- paste(getwd(),"dataCET1", sep = "/")
filenames <- list.files(path = dir, pattern = ".csv", full.names = TRUE)
numfiles <- length(filenames)
fn <- list.files(path = paste(getwd(),"Temporal", sep = '/'), full.names = TRUE)
file.remove(fn)
for(i in 1:numfiles)
{
  shell(cmd=paste("iconv -f ISO-8859-1 -t UTF-8 <\"",filenames[[i]],"\">", paste(getwd(),"Temporal", basename(filenames[[i]]),sep="/"), sep = ""), mustWork=TRUE, intern=F, translate=TRUE)
}
dir <- paste(getwd(),"Temporal", sep = "/")
filenames <- list.files(path = dir, pattern = ".csv", full.names = TRUE)

All <- lapply(filenames,function(i){
  read.csv(i, sep = ";")
})
filenames <- gsub(dir,"",filenames)
filenames <- gsub("/","", filenames)
names(All) <- gsub(".csv","",filenames)



fact2Num <- function(tabla)
{
  if(is.factor(tabla$y))
  {
    tabla$y<- as.numeric(levels(tabla$y))[tabla$y]    
  }
  else
  {
    tabla$y<- as.numeric(tabla$y)   
  }
  return(tabla)
}

dfcet1 <- lapply(All,fact2Num)

