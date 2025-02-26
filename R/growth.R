

#' Calculate the weight of a fish from its length using a \eqn{W = a ∗ L^b} model
#'
#' This function calculates the weight of a fish from its length using
#' \eqn{W = a ∗ L^b} model. The coefficients alpha and beta are available for several
#' species in the data frame [demop::species_data] and can be retrieved using the
#' [demop::species_coeff()] function.
#'
#' @param length numeric The length of the fish in cm
#' @param alpha numeric The alpha coefficient
#' @param beta numeric The beta coefficient
#'
#' @returns
#' The weight of the fish in kg
#' @export
#'
#' @examples
#' perch <- species_coeff("ABBO")
#' length2weight(40, perch$alpha, perch$beta)
#' trout <- species_coeff("ÖRIN")
#' length2weight(40, trout$alpha, trout$beta)
#' pike <- species_coeff(name ="Gädda")
#' length2weight(40, pike$alpha, pike$beta)
#'
length2weight <- function(length, alpha, beta) {
  return(alpha * 10^-6 * length^beta)
}

#' Get coefficients for a species to calculate the weight from the length
#'
#' This function returns pre-calulated the coefficients for a species uses to
#' estimate weight from the length. The coefficients are available in the
#' data frame `demop::species_data`. You can provide either the species code
#' or the species name (but not both) to find the data.
#'
#' @param code character The species code (e.g. "ABBO")
#' @param name character The species name (e.g. "Abborre")
#'
#' @returns
#' A data frame with the alpha and beta coefficients for the species.
#' @export
#'
#' @examples
#' species_coeff("ABBO")
#'
species_coeff <- function(code = NULL, name = NULL) {
  if (is.null(code) & is.null(name)) {
    stop("You must provide either a code or a name")
  }

  if (!is.null(code)) {
    coeff <- demop::species_data[demop::species_data$code == code &
                                   !is.na(demop::species_data$code), c("alpha", "beta")]
  } else {
    coeff <- demop::species_data[demop::species_data$name == name &
                                   !is.na(demop::species_data$name), c("alpha", "beta")]
  }

  if (nrow(coeff) == 0) {
    stop("No species found")
  }

  return(coeff)
}

