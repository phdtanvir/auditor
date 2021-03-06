% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/model_cooksdistance.R
\name{model_cooksdistance}
\alias{model_cooksdistance}
\alias{observationInfluence}
\title{Cook's distances}
\usage{
model_cooksdistance(object)

observationInfluence(object)
}
\arguments{
\item{object}{An object of class 'explain' created with function \code{\link[DALEX]{explain}} from the DALEX package.}
}
\value{
An object of class 'auditor_model_cooksdistance'.
}
\description{
Calculates Cook's distances for each observation.
Please, note that it will work only for functions with specified 'update' method.
}
\examples{
titanic <- na.omit(DALEX::titanic)

# fit a model
model_glm <- glm(survived ~ ., family = binomial, data = titanic)

# use DALEX package to wrap up a model into explainer
exp_glm <- DALEX::explain(model_glm, data = titanic, y = titanic$survived)

# validate a model with auditor
library(auditor)
model_cooksdistance(exp_glm)

}
\references{
Cook, R. Dennis (1977). "Detection of Influential Observations in Linear Regression". doi:10.2307/1268249.
}
