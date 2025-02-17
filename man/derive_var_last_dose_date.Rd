% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/derive_var_last_dose_date.R
\name{derive_var_last_dose_date}
\alias{derive_var_last_dose_date}
\title{Derive Last Dose Date-Time}
\usage{
derive_var_last_dose_date(
  dataset,
  dataset_ex,
  filter_ex = NULL,
  by_vars = exprs(STUDYID, USUBJID),
  dose_id = exprs(),
  dose_date,
  analysis_date,
  single_dose_condition = (EXDOSFRQ == "ONCE"),
  new_var,
  output_datetime = TRUE,
  traceability_vars = NULL
)
}
\arguments{
\item{dataset}{Input dataset.
The variables specified by the \code{by_vars} and \code{analysis_date} parameters are expected.}

\item{dataset_ex}{Input EX dataset.
The variables specified by the \code{by_vars}, \code{dose_date}, \code{new_vars} parameters,
and source variables from \code{traceability_vars} parameter are expected.}

\item{filter_ex}{Filtering condition applied to EX dataset.
For example, it can be used to filter for valid dose.
Defaults to NULL.}

\item{by_vars}{Variables to join by (created by \code{rlang::exprs}).}

\item{dose_id}{Variables to identify unique dose (created by \code{rlang::exprs}).
Defaults to empty \code{exprs()}.}

\item{dose_date}{The EX dose date variable. A date or date-time object is expected.}

\item{analysis_date}{The analysis date variable. A date or date-time object is expected.}

\item{single_dose_condition}{The condition for checking if \code{dataset_ex} is single dose. An error
is issued if the condition is not true. Defaults to \code{(EXDOSFRQ == "ONCE")}.}

\item{new_var}{The new date or datetime variable added to \code{dataset}.}

\item{output_datetime}{Display \code{new_var} as datetime or as date only. Defaults to \code{TRUE}.}

\item{traceability_vars}{A named list returned by \code{\link[=exprs]{exprs()}} listing the traceability variables,
e.g. \code{exprs(LDOSEDOM = "EX", LDOSESEQ = EXSEQ)}.
The left-hand side (names of the list elements) gives the names of the traceability variables
in the returned dataset.
The right-hand side (values of the list elements) gives the values of the traceability variables
in the returned dataset.
These can be either strings or symbols referring to existing variables.}
}
\value{
Input dataset with additional column \code{new_var}.
}
\description{
Add a variable for the dose date or datetime of the last dose to
the input dataset.

\strong{Note:} This is a wrapper function for the function \code{derive_vars_last_dose()}.

\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}

This function is \emph{deprecated}, please use \code{derive_vars_joined()} instead.
}
\details{
The last dose date is derived as the maximum dose date where the
\code{dose_date} is lower to or equal to the \code{analysis_date} per \code{by_vars} for
each observation in \code{dataset}. When \code{output_datetime} is \code{TRUE} and time is
missing, then the last dose date time is imputed to \code{00:00:00}. However, if
date is missing, then no imputation is done.

If dose information is aggregated (i.e. is a dosing frequency other than \code{"ONCE"}
over a period defined by a start and end date) the function
\code{create_single_dose_dataset()} can be used to generate single doses from
aggregate dose information and satisfy \code{single_dose_condition}.
}
\seealso{
Other deprecated: 
\code{\link{derive_param_extreme_event}()},
\code{\link{derive_var_basetype}()},
\code{\link{derive_var_confirmation_flag}()},
\code{\link{derive_var_last_dose_amt}()},
\code{\link{derive_var_last_dose_grp}()},
\code{\link{derive_var_merged_cat}()},
\code{\link{derive_var_merged_character}()},
\code{\link{derive_vars_last_dose}()}
}
\concept{deprecated}
\keyword{deprecated}
