% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_residuals.R
\name{check_residuals}
\alias{check_residuals}
\title{Automated tests for model residuals}
\usage{
check_residuals(object, ...)
}
\arguments{
\item{object}{An object of class 'explainer' created with function \code{\link[DALEX]{explain}} from the DALEX package.}

\item{...}{other parameters that will be passed to further functions.}
}
\value{
list with statistics for particualar checks
}
\description{
Currently three tests are performed
 - for outliers in residuals
 - for autocorrelation in target variable or in residuals
 - for trend in residuals as a function of target variable (detection of bias)
}
\examples{
library(DALEX)
dragons <- DALEX::dragons[1:100, ]
lm_model <- lm(life_length ~ ., data = dragons)
lm_exp <- explain(lm_model, data = dragons, y = dragons$life_length)
library(auditor)
check_residuals(lm_exp)
 \dontrun{
 library("ranger")
 rf_model <- ranger(life_length ~ ., data = dragons)
 predict_function <- function(m,x,...) predict(m, x, ...)$predictions
 rf_exp <- explain(rf_model, data = dragons, y = dragons$life_length,
           predict_function = predict_function)
 check_residuals(rf_exp)
}
}
