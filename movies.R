library(ggplot2)

mov = read.csv("Data/movies.csv")


# > str(mov)
# 'data.frame':   224 obs. of  6 variables:
#  $ Movies : Factor w/ 224 levels "12 Angry Men ",..: 180 181 187 189 188 49 87 81 75 82 ...
#  $ Lang   : Factor w/ 11 levels "Eng","French (Eng subs)",..: 1 1 1 1 1 2 1 1 1 1 ...
#  $ Ratings: int  4 3 5 5 5 3 3 5 5 5 ...
#  $ Year   : int  2012 2013 2001 2002 2003 2003 2011 2001 2002 2004 ...
#  $ Count  : int  2 1 1 1 2 1 1 2 4 3 ...
#  $ Type   : Factor w/ 4 levels "","Animation",..: 1 1 1 1 1 1 1 1 1 1 ...





g <- ggplot(mov, aes(x=Year, y=Lang)) + geom_point()

print(g)