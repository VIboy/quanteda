% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/textmodel-NB.R
\name{textmodel_NB}
\alias{textmodel_NB}
\title{Naive Bayes classifier for texts}
\usage{
textmodel_NB(x, y, smooth = 1, prior = c("uniform", "docfreq", "termfreq"),
  distribution = c("multinomial", "Bernoulli"), ...)
}
\arguments{
\item{x}{the dfm on which the model will be fit.  Does not need to contain 
only the training documents.}

\item{y}{vector of training labels associated with each document identified
in \code{train}.  (These will be converted to factors if not already
factors.)}

\item{smooth}{smoothing parameter for feature counts by class}

\item{prior}{prior distribution on texts, see details}

\item{distribution}{count model for text features, can be \code{multinomial} 
or \code{Bernoulli}}

\item{...}{more arguments passed through}
}
\value{
A list of return values, consisting of:

\item{call}{original function call}

\item{PwGc}{probability of the word given the class (empirical 
  likelihood)}

\item{Pc}{class prior probability}

\item{PcGw}{posterior class probability given the word}

\item{Pw}{baseline probability of the word}

\item{data}{list consisting of \code{x} training class, and \code{y} 
  test class}

\item{distribution}{the distribution argument}

\item{prior}{argument passed as a prior}

\item{smooth}{smoothing parameter}
}
\description{
Currently working for vectors of texts -- not specially defined for a dfm.
}
\details{
This naive Bayes model works on word counts, with smoothing.
}
\examples{
## Example from 13.1 of _An Introduction to Information Retrieval_
trainingset <- as.dfm(matrix(c(1, 2, 0, 0, 0, 0,
                        0, 2, 0, 0, 1, 0,
                        0, 1, 0, 1, 0, 0,
                        0, 1, 1, 0, 0, 1,
                        0, 3, 1, 0, 0, 1), 
                      ncol=6, nrow=5, byrow=TRUE,
                      dimnames = list(docs = paste("d", 1:5, sep = ""),
                                      features = c("Beijing", "Chinese",  "Japan", "Macao", 
                                                   "Shanghai", "Tokyo"))))
trainingclass <- factor(c("Y", "Y", "Y", "N", NA), ordered = TRUE)
## replicate IIR p261 prediction for test set (document 5)
(nb.p261 <- textmodel_NB(trainingset, trainingclass)) #, prior = "docfreq"))
predict(nb.p261, newdata = trainingset[5, ])

}
\author{
Kenneth Benoit
}

