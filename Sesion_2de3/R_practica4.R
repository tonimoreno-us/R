install.packages("scholar")
library("scholar")

## Universidad de Sevilla
##  https://scholar.google.es/citations?view_op=view_org&hl=es&org=3333805543372288621


ids <- c("","")
idp <- c("")    ## Obtener identificador en las páginas web

df <- compare_scholars(ids)
dfc <- compare_scholar_careers(ids)   

dfpr <- get_profile(idp)
dfp <- get_publications(idp)





# Fama from Google Scholar
# http://scholar.google.com/citations?user=yP7euFUAAAAJ&hl=en yP7euFUAAAAJ
# French from Google Scholar does not exist
library(scholar)
famaId = "yP7euFUAAAAJ"
fama.df <- compare_scholar_careers(famaId)
plot(fama.df$cites ~ fama.df$year, type = "p")
abline(lm(fama.df$cites ~ fama.df$year), col = "green")
title(main = "Eugene Fama | Cites By Year", adj = 0.05, outer = TRUE, line = -2)

# http://timelyportfolio.github.io/research_scholar/
