#' @title Specificity
#'
#' @param object An object of class \code{explainer} created with function \code{\link[DALEX]{explain}} from the DALEX package.
#' @param cutoff Treshold value, which divides model predicted values (y_hat) to calculate confusion matrix. By default it's \code{0.5}.
#' @param data New data that will be used to calcuate the score. Pass \code{NULL} if you want to use \code{data} from \code{object}.
#' @param ... Other arguments dependent on the type of score.
#'
#' @return An object of class \code{auditor_score}.
#'
#' @examples
#' titanic <- na.omit(DALEX::titanic)
#' titanic$survived <- titanic$survived == "yes"
#'
#' # fit a model
#' model_glm <- glm(survived ~ ., family = binomial, data = titanic)
#'
#' #create an explainer
#' exp_glm <- DALEX::explain(model_glm, y = titanic$survived)
#'
#' # calculate score
#' score_specificity(exp_glm)
#'
#'
#' @export


score_specificity <- function(object, cutoff = 0.5, data = NULL, ...) {
  if(!("explainer" %in% class(object))) stop("The function requires an object created with explain() function from the DALEX package.")

  # inject new data to the explainer
  if (!is.null(data)) object$data <- data

  conf <- confusionmatrix(object, cutoff)
  ret <- conf$TN / (conf$TN + conf$FP)

  specificity_results <- list(
    name = "specificity",
    score = ret
  )

  class(specificity_results) <- "auditor_score"
  return(specificity_results)
}


#' @title One minus specificity
#'
#' @param object An object of class \code{explainer} created with function \code{\link[DALEX]{explain}} from the DALEX package.
#' @param cutoff Treshold value, which divides model predicted values (y_hat) to calculate confusion matrix. By default it's \code{0.5}.
#' @param data New data that will be used to calcuate the score. Pass \code{NULL} if you want to use \code{data} from \code{object}.
#' @param ... Other arguments dependent on the type of score.
#'
#' @return An object of class \code{auditor_score}.
#'
#' @examples
#' titanic <- na.omit(DALEX::titanic)
#' titanic$survived <- titanic$survived == "yes"
#'
#' # fit a model
#' model_glm <- glm(survived ~ ., family = binomial, data = titanic)
#'
#' #create an explainer
#' exp_glm <- DALEX::explain(model_glm, y = titanic$survived)
#'
#' # calculate score
#' score_one_minus_specificity(exp_glm)
#'
#'
#' @export


score_one_minus_specificity <- function(object, cutoff = 0.5, data = NULL, ...) {
  if(!("explainer" %in% class(object))) stop("The function requires an object created with explain() function from the DALEX package.")

  # inject new data to the explainer
  if (!is.null(data)) object$data <- data

  conf <- confusionmatrix(object, cutoff)
  ret <- 1 - conf$TN / (conf$TN + conf$FP)

  specificity_results <- list(
    name = "one_minus_specificity",
    score = ret
  )

  class(specificity_results) <- "auditor_score"
  return(specificity_results)
}
