#install ggplot2
library(ggplot2)
# install.packages("ggplot2")
virus <- c(10, 30, 40, 50, 60, 80)
death <- c(100, 240, 310, 470, 580, 690)
data.frame(virus, death)
d <- data.frame(virus, death)
summary(d)

ggplot(d, aes(x=virus, y=death)) + geom_point()
ggplot(d, aes(x=virus, y=death)) + geom_point(size=3, col="blue")
ggplot(d, aes(x=virus, y=death)) + geom_point(size=3, col="blue", pch=17)
ggplot(d, aes(x=virus, y=death)) + geom_line()
ggplot(d, aes(x=virus, y=death)) + geom_point(size=3, col="blue", pch=17)+ geom_line()
