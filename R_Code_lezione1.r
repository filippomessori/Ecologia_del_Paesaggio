###### PRIMO CODICE R: ECOLOGIA DEL PAESAGGIO


install.packages("sp")
Library(sp)
# require (sp) è un altro modo per far partire librerie

data(meuse)
meuse

head(meuse)

names(meuse)


summary(meuse)

pairs(meuse)

pairs(~ cadmium + copper + lead , data=meuse)

# ESERCIZIO: pairs con tutti gli elementi 
pairs(~ cadmium + copper + lead + zinc , data=meuse)


pairs(meuse[,3:6])
#per selezionare piu velocemente scegliendo le colonne, mi viene fuori lo stesso grafico di prima


pairs(meuse[,3:6], col="red")
#cambiare colore 


# pointcharater caratterizzare punti
pairs(meuse[,3:6], col="red", pch=19)

# aumentare dimensione punti
pairs(meuse[,3:6], col="red", pch=19, cex=3)


pairs(meuse[,3:6], col="red", pch=19, cex=3, main="Primo pairs")
# Mettere il titolo al grafico

# EXERCISE: Fare la stessa cosa con elevation e gli altri elementi
pairs(meuse[,3:7], col="red", pch=19, cex=3, main="Secondo pairs")


# COPIARE codice da un altro

panel.correlations <- function(x, y, digits=1, prefix="", cex.cor)
{
    usr <- par("usr"); on.exit(par(usr))
    par(usr = c(0, 1, 0, 1))
    r1=cor(x,y,use="pairwise.complete.obs")
    r <- abs(cor(x, y,use="pairwise.complete.obs"))

 

    txt <- format(c(r1, 0.123456789), digits=digits)[1]
    txt <- paste(prefix, txt, sep="")
    if(missing(cex.cor)) cex <- 0.9/strwidth(txt)
    text(0.5, 0.5, txt, cex = cex * r)
}

 

panel.smoothing <- function (x, y, col = par("col"), bg = NA, pch = par("pch"),
    cex = 1, col.smooth = "red", span = 2/3, iter = 3, ...)
{
    points(x, y, pch = pch, col = col, bg = bg, cex = cex)
    ok <- is.finite(x) & is.finite(y)
    if (any(ok))
        lines(stats::lowess(x[ok], y[ok], f = span, iter = iter),
            col = 1, ...)
}

 


panel.histograms <- function(x, ...)
{
    usr <- par("usr"); on.exit(par(usr))
    par(usr = c(usr[1:2], 0, 1.5) )
    h <- hist(x, plot = FALSE)
    breaks <- h$breaks; nB <- length(breaks)
    y <- h$counts; y <- y/max(y)
    rect(breaks[-nB], 0, breaks[-1], y, col="white", ...)
}


pairs(meuse[,3:6], lower.panel = panel.correlations, upper.panel = panel.smoothing, diag.panel = panel.histograms)

# lower.paenel= parte inferiore pannello---> scegliamo cosa metterci= Correlazioni che io avevo scritto,  upper.panel= panel dot smoothing,
# diag.panel=metto quello che manca, cioè istogrammi.


EXERCISE: cambiare ordine pannelli nel grafico
pairs(meuse[,3:6], lower.panel = panel.smoothing, upper.panel = panel.correletions, diag.panel = panel.histograms)


# funzione PLOT lancia la funzione
plot(meuse$cadmium, meuse$copper)

# attach associa senza il dollaro
attach(meuse)
plot(cadmium, copper)

# caratterizzo grafico
plot(cadmium, copper, pch=17, col="green", main= "primo plot")

# cambiare Labels, etichette grafico
plot(cadmium, copper, pch=17, col="green", main= "primo plot", xlab="cadmio", ylab="rame")

# cambiare dimensioni labels e punti
plot(cadmium, copper, pch=17, col="green", main= "primo plot", xlab="cadmio", ylab="rame", cex.lab=2, cex=2)
