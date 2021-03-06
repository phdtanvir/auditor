% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_prediction.R
\name{plot_prediction}
\alias{plot_prediction}
\alias{plotPrediction}
\title{Predicted response vs Observed or Variable Values}
\usage{
plot_prediction(object, ..., variable = "_y_", smooth = FALSE,
  abline = FALSE)

plotPrediction(object, ..., variable = NULL, smooth = FALSE,
  abline = FALSE)
}
\arguments{
\item{object}{An object of class 'auditor_model_residual.}

\item{...}{Other modelAudit or modelResiduals objects to be plotted together.}

\item{variable}{Name of variable to order residuals on a plot.
If \code{variable="_y_"}, the data is ordered by a vector of actual response (\code{y} parameter
passed to the \code{\link[DALEX]{explain}} function).
If \code{variable = "_y_hat_"} the data on the plot will be ordered by predicted response.
If \code{variable = NULL}, unordered observations are presented.}

\item{smooth}{Logical, indicates whenever smooth line should be added.}

\item{abline}{Logical, indicates whenever function `y = x` should be added. Works only
with \code{variable = "_y_"} (which is a default option) or when `variable` equals actual response variable.}
}
\value{
A ggplot2 object.
}
\description{
Plot of predicted response vs observed or variable Values.
}
\examples{
dragons <- DALEX::dragons[1:100, ]

# fit a model
model_lm <- lm(life_length ~ ., data = dragons)

 # use DALEX package to wrap up a model into explainer
exp_lm <- DALEX::explain(model_lm, data = dragons, y = dragons$life_length)

# validate a model with auditor
library(auditor)
mr_lm <- model_residual(exp_lm)

# plot results
plot_prediction(mr_lm, abline = TRUE)
plot_prediction(mr_lm, variable = "height", smooth = TRUE)
plot(mr_lm, type = "prediction", abline = TRUE)

library(randomForest)
model_rf <- randomForest(life_length~., data = dragons)
exp_rf <- DALEX::explain(model_rf, data = dragons, y = dragons$life_length)
mr_rf <- model_residual(exp_rf)
plot_prediction(mr_lm, mr_rf, variable = "height", smooth = TRUE)


}
