mensagem <- 'hello world'
print(mensagem)

# Instalando um novo pacote
install.packages("ggplot2")

# Carregando novo
library(ggplot2)

cidade <- c("Brasília", "São Paulo", "Salvador")

cidade

cidade[1]

temperatura <- c(33, 22, 35, 17)
temperatura
temperatura[1:3]

regiao <- c(1, 2, 2, 3)

regiao

temperatura[-2]

cidade[2] <- "Belo Horizonte"

cidade[4] <- "Curitiba"


UF <- factor(c("DF", "SP", "RJ", "RS"))
UF

grau.instrucao <- factor(c("Nivel Médio", "Superior", "Nivel Médio", 
                           "Fundamental"),
                         levels = c("Fundamental", "Nivel Médio", 
                                    "Superior"),
                         ordered = TRUE)
grau.instrucao



pessoa <- list(sexo = "M", cidade = "Brasília", idade = 20)

pessoa

pessoa[["idade"]] <- 22

pessoa[["idade"]] <- NULL

pessoa[c("cidade", "idade")]

cidades <- list(cidade = cidade, temperatura = temperatura, regiao = regiao)
cidades

# Criando um data frame
df <- data.frame(cidade, temperatura)
df


df2 <- data.frame(cidades)
df2

df[1, 2]

df[,1]

df[1,]

df2[c(1:3), c(1,3)]

#nomes das colunas
names(df)

#linhas x colunas
dim(df)

#tipos de dados
str(df)

# acessar coluna

df$cidade
df['cidade']

?matrix()
# Matrizes
m <- matrix(seq(1:9), nrow = 3)
m

m2 <- matrix(seq(1:25), ncol = 5, byrow = TRUE, 
             dimnames = list(c(seq(1:5)),
                             c('A', 'B', 'C', 'D', 'E')
                             )
             )

m2

# filtra a matriz, 2 primeiras linhas das colunas B e C
m2[c(1:2), c("B", "C")]


for (i in seq(12)){
  print(i)
}

i <- 0
while (i <= 10){
  print(i)
  i = i+1
}

x = 10
if (x > 0){
  print("Número positivo")
}

par.impar <- function(num){
  if ((num %% 2) == 0){
    return ("Par")
  } else {
    return ("Ímpar")
  }
}
num = 3
par.impar(num)

x <- seq(1:9)
matriz <- matrix(x, ncol=3)
matriz

# soma elementos da matriz por linha
result1 <- apply(matriz, 1, sum)
result1

# soma por coluna
result2 <- apply(matriz, 2, sum)

?c
numeros.p <- c(2,4,6,8,10,12)
numeros.i <- c(1,3,5,7,9,11)
numeros <- list(numeros.p, numeros.i)
numeros

# medias
lapply(numeros, mean)

sapply(numeros, mean)

?mtcars
carros <- mtcars[,c(1,2,9)]

carros

hist(carros$mpg)

plot(carros$mpg, carros$cyl)

library(ggplot2)

ggplot(carros, aes(am))+
  geom_bar()

df1 <- data.frame(Produto = c(1,2,3,5),Preco = c(15,10,25,20))
head(df1)

df2 <- data.frame(Produto = c(1,2,3,4),Nome = c("A", "B", "C", "D"))
head(df2)

install.packages("dplyr")
library(dplyr)

df3 <- left_join(df1, df2,"Produto")
head(df3)

df4 <- right_join(df1, df2, "Produto")
head(df4)

df5 <- inner_join(df1,df2,"Produto")
head(df5)

head(iris)

glimpse(iris)

versicolor <- filter(iris, Species == "versicolor")
dim(versicolor)
versicolor

# linhas 5 até 10
slice(iris, 5:10)

# colunas de indice 2, 3 e 4
select(iris,2:4)

# todas as colunas menos petal.width
select(iris, -Petal.Width)

# cria nova coluna
iris2 <- mutate(iris, nova.coluna = Sepal.Length + Sepal.Width)
iris2[,c("Sepal.Length","Sepal.Width","nova.coluna")]

# exibição ordenada
select(iris, Sepal.Length)%>%arrange(Sepal.Length)

# media do tamanho da sepa agrupado por especie
iris %>% group_by(Species) %>% summarise(mean(Sepal.Length))

install.packages("assertthat")
install.packages("magrittr")
install.packages("lazyeval")
install.packages("BH")
install.packages("R6")
install.packages("http://cran.r-project.org/src/contrib/Archive/dplyr/dplyr_0.4.1.tar.gz", repos=NULL)
install.packages("tidyr")

library(tidyr)

dfDate <- data.frame(Produto=c('A', 'B', "C"),
                               A.2015 = c(10,12,20),
                               A.2016 = c(20,25,35),
                               A.2017 = c(15,20,30)
                               )
                     
head(dfDate)

?gather
dfDate2 <- gather(dfDate, "Ano", "Quantidade", 2:4)
head(dfDate2)

dfDate3 <- separate(dfDate2, Ano, c("A", "Ano"))
dfDate3 <- dfDate3[-2]
dfDate3

dfDate3$Mes <- c('01','02','03')
dfDate3

dfDate4 <- dfDate3 %>% unite(Data,Mes,Ano,sep='/')
head(dfDate4)

?read.csv

diabetes <- read.csv(
  file = "~/Downloads/diabetes.csv"
)

head(diabetes)

#TIPOS DE DADOS
str(diabetes)

# colunas nao preenchidas
colSums(is.na(diabetes))

#MEDIA, MEDIANA, MAX ETC
summary(diabetes$Insulin)

# grafico dados
boxplot(diabetes$Insulin)

boxplot(diabetes)

#hist = histograma
hist(diabetes$Pregnancies)
hist(diabetes$Age)
hist(diabetes$Insulin)
hist(diabetes$BMI)
library(dplyr)

diabetes2 <- diabetes %>% 
  filter(Insulin <= 250)
boxplot(diabetes2$Insulin)

boxplot(diabetes2)
summary(diabetes2$Insulin)

# construção do modelo
install.packages("caTools")
library(caTools)
set.seed(123)

#divisão dos dados
index = sample.split(diabetes2$Pregnancies, SplitRatio = .70)

#treino e teste, 70% para treino 30% para teste

train = subset(diabetes2, index == TRUE)
test = subset(diabetes2, index == FALSE)

dim(diabtrain)
dim(train)
dim(test)

install.packages("caret")
install.packages("e1071")
library(caret)
library(e1071)

?caret::train

modelo <- train(Outcome ~., data = train, method = 'knn')
modelo$results
modelo$bestTune

modelo2 <- train(Outcome ~., data = train, method = 'knn',
                 tuneGrid = expand.grid(k = c(1:20)))
modelo2$results
modelo2$bestTune

plot(modelo2)

modelo3 <- train(Outcome ~., data = train, method = "naive_bayes")


set.seed(100)
modelo4 <- train(Outcome ~., data = train, method = "svmRadialSigma"
,preProcess=c("center"))

modelo4$results
modelo4$bestTune

predicoes <- predict(modelo4, test)

predicoes

confusionMatrix(predicoes, test$Outcome)

write.csv(predicoes, 'resultado.csv')
