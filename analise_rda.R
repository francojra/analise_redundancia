
# Análise Multivariada - Análise de Redundância (RDA) --------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 28/02/2022 -------------------------------------------------------------------------------------------------------------------------

# Conceito da Análise de Redundância -------------------------------------------------------------------------------------------------------

# Para realizar a análise de redundância são necessárias duas matrizes x e y, sendo a matriz x composta
# por variáveis explicativas (exemplo: variáveis ambientais), e a matriz y composta por variáveis
# respostas (exemplo: abundância de espécies). Portanto, o objetivo dessa análise é encontrar componentes
# de y que são combinações lineares de x que representam a variação de y.

# A premissa dessa análise é que exista uma dependência linear da resposta das variáveis em y
# nas variáveis em x. Uma variação em x sempre dará uma variação em y.

# "O RDA também busca encontrar o quanto da composição e abundância das espécies na comunidade estão
# relacionadas com descritores ambientais, mas assume que existe uma resposta linear das espécies aos
# gradientes ambientais." - Provetes, 2011

# A matémática se assemelha à análise PCA, com a diferença que na RDA são utilizadas duas matrizes. A
# diferença entre o PCA e RDA é que o PCA mostra a correlação entre as variáveis e o RDA apresenta a
# influência das variáveis da matriz x nas variáveis da matriz y.

# Prática ----------------------------------------------------------------------------------------------------------------------------------

## Baixar pacote e dados

library(vegan)
data("varespec")
data("varechem")

## Nomear os dados ambientais x dados biológicos

sp <- varespec
amb <- varechem

## Modelo da análise RDA

result_rda <- rda(sp, amb)
result_rda

## Interpretação dos resultados

# Total da informação da inércia = 1825.6594
# Inércia explicada = 1459.8891 (79%)
# Inércia não-explicada = 365.7704 (20%)

## Sumário da RDA

summary(result_rda)

# No sumário é possível verificar a importância dos componentes e a proporção explicada
# por cada um deles. Por xemplo, a RDA1 e a RDA2 explicam 45% e 22%, respectivamente.
# O sumário também apresenta os scores das espécies, mostrando quanto cada espécie
# influencia no componente principal, da mesma forma, isso também é mostrado para as
# variáveis ambientais. Algumas espécies ou variáveis ambientais podem apresentar grande
# influência no componente 1 e outras apresentam maior influência nos componentes seguintes.
# O sumário inclui também, o peso dos scores em cada sítio de coleta.

## Visualização

plot(result_rda, col = 1, pch = 3, xlab = "Eixo (44,92%)", ylab = "Eixo (21,87%)",
     scaling = 1, xlim = c(-0.5, 0.5), ylim = c(-0.5,0.5)) 

# pode modificar a escala do xlim e ylim para melhorar a visualização do gráfico.

## Análise anova

anova(result_rda)
