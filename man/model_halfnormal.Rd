% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/model_halfnormal.R
\name{model_halfnormal}
\alias{model_halfnormal}
\alias{modelFit}
\title{Create Halfnormal Explanation}
\usage{
model_halfnormal(object, quant = FALSE, ...)

modelFit(object, quant = FALSE, ...)
}
\arguments{
\item{object}{An object of class 'explainer' created with function \code{\link[DALEX]{explain}} from the DALEX package.}

\item{quant}{if TRUE values on axis are on quantile scale.}

\item{...}{other parameters passed do \code{\link[hnp]{hnp}} function.}
}
\value{
An object of the class 'auditor_model_halfnormal'.
}
\description{
Creates 'auditor_model_halfnormal' object that can be used for plotting halfnormal plot.
}
\examples{
titanic <- na.omit(DALEX::titanic[1:100,])

# fit a model
model_glm <- glm(survived ~ ., family = binomial, data = titanic)

# use DALEX package to wrap up a model into explainer
exp_glm <- DALEX::explain(model_glm)

# validate a model with auditor
library(auditor)
model_halfnormal(exp_glm)

}
\references{
Moral, R., Hinde, J., & Demétrio, C. (2017). Half-Normal Plots and Overdispersed Models in R: The hnp Package.doi:http://dx.doi.org/10.18637/jss.v081.i10
}
