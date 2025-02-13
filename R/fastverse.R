#' The fastverse
#' 
#' @description
#' The \emph{fastverse} is an extensible suite of R packages, developed independently by various people,
#' that jointly contribute to the objectives of:
#' \enumerate{
#' \item Speeding up R through heavy use of compiled code (C, C++, Fortran)
#' \item Enabling more complex statistical and data manipulation operations in R
#' \item Reducing the number of dependencies required for advanced computing in R
#' }
#' Inspired by the \code{tidyverse} package, the \code{fastverse} package is a flexible package loader and manager 
#' that allows users to put together their own 'verses' of packages and load them with \code{library(fastverse)}. 
#' 
#' The \code{fastverse} installs 6 core packages (\code{data.table}, \code{collapse}, \code{matrixStats}, \code{kit}, \code{magrittr} and \code{fst}) that 
#' provide native C/C++ code of proven quality, work well together, and enable complex statistical computing and data manipulation - with only \code{Rcpp} as an additional dependency. 
#' The package also harmonizes functionality among some of these core packages (see below). 
#' 
#' The \code{fastverse} further allows users to freely (and permanently) extend or reduce the number of packages in the \emph{fastverse}. 
#' A selection of suggested high-performing packages for various topics is provided in \code{\link{fastverse_extend}} (and with more details in the \href{https://sebkrantz.github.io/fastverse/#suggested-extensions}{README}).
#' Other functions help to determine joint dependencies, sort out namespace conflicts among attached packages, and update packages.  
#' 
#' @details NULL
#' @section Functions in the \emph{fastverse} Package:
#' 
#' Functions to extend or reduce the number of packages in the \emph{fastverse} - either for the session or permanently - and to restore defaults. 
#'
#' \code{\link[=fastverse_extend]{fastverse_extend()}}\cr
#' \code{\link[=fastverse_detach]{fastverse_detach()}}\cr
#' \code{\link[=fastverse_reset]{fastverse_reset()}}
#' 
#' Function to display conflicts for \emph{fastverse} packages (or any other attached packages)
#'
#' \code{\link[=fastverse_conflicts]{fastverse_conflicts()}}
#'
#' Function to update \emph{fastverse} packages (and dependencies)
#' 
#' \code{\link[=fastverse_update]{fastverse_update()}}
#'
#' Utilities to retrieve the names of \emph{fastverse} packages (and dependencies), their update status and produce a situation report.
#' 
#' \code{\link[=fastverse_packages]{fastverse_packages()}}\cr
#' \code{\link[=fastverse_deps]{fastverse_deps()}}\cr
#' \code{\link[=fastverse_sitrep]{fastverse_sitrep()}}
#'
#' @section \emph{fastverse} Options:
#' \itemize{
#' \item \code{options(fastverse.quiet = TRUE)} will disable all automatic messages (including conflict reporting) when calling \code{library(fastvsers)} or \code{\link{fastverse_extend}}.
#' \item \code{options(fastverse.styling = FALSE)} will disable any styling applied to text printed to the console. 
#' \item \code{options(fastverse.extend = c(...))} can be set before calling \code{library(fastvsers)} to extend the fastverse with some packages for the session. The same can be done with the
#' \code{\link{fastverse_extend}} function after \code{library(fastvsers)}, which will also populate \code{options("fastverse.extend")}. 
#' }
#'
#' @section \emph{fastverse} Harmonisations:
#' \itemize{
#' \item There are 2 internal clashes between \code{collapse::funique} and \code{kit::funique}, and between \code{matrixStats::count} and \code{kit::count}.
#' The \emph{collapse} and \emph{matrixStats} versions take precedence over the \emph{kit} versions. For a comparison of functionality see the details section of \code{\link{fastverse_conflicts}}.

#' \item Quite A number of functions in the \emph{matrixStats} package do not (by default) preserve the attributes of objects passed to them, resulting in inconsistent behavior of different functions. 
#' The GitHub version of the \code{fastverse} alters most of the functions where this is the case, listed in a global variable \code{.matrixStats_replaced}, bestowing them with 
#' capabilities to preserve matrix dimension names and other attributes (for functions returning a matrix). This is done using very efficient R and C code, so that performance does not suffer. 
#' When the \code{fastverse} is attached, these altered function are replaced in the \emph{matrixStats} namespace. Since CRAN does not allow namespace modifications in other packages, 
#' this feature is only available in the GitHub version, installable using \code{remotes::install_github("SebKrantz/fastverse")}. Development of CRAN and GitHub version will
#' continue synchronous until \emph{matrixStats} has evolved so that consistent attribute handling (\code{useNames = TRUE}) becomes the default.
#' }
#' 
#' 
#' @docType package
#' @name fastverse
#' @aliases .matrixStats_replaced
#' 
#' 
#'
#' @importFrom utils stack packageVersion install.packages available.packages
#' @importFrom tools package_dependencies
#' @importFrom collapse .c
#'
NULL


