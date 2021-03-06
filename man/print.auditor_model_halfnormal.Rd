% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/print.R
\name{print.auditor_model_halfnormal}
\alias{print.auditor_model_halfnormal}
\title{Prints Model Halfnormal Summary}
\usage{
\method{print}{auditor_model_halfnormal}(x, ...)
}
\arguments{
\item{x}{an object \code{auditor_model_halfnormal} created with \code{\link{model_halfnormal}} function.}

\item{...}{other parameters}
}
\description{
Prints Model Halfnormal Summary
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
