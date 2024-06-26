% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ImportMethods.R
\name{import.bedCTSS}
\alias{import.bedCTSS}
\title{import.bedCTSS}
\usage{
import.bedCTSS(filepath)
}
\arguments{
\item{filepath}{The path to the BED file.}
}
\value{
A GRanges object where each line represents one nucleotide.
}
\description{
Imports a BED file where each line represents a single base, with a score
counting the number of CAGE transcription start sites (CTSS).
}
\examples{
# TODO: add exmaple file
# import.BED(system.file("extdata", "example.bed", package = "CAGEr"))
}
\seealso{
Other loadFileIntoGPos: 
\code{\link{bam2CTSS}()},
\code{\link{import.CTSS}()},
\code{\link{import.bam}()},
\code{\link{import.bam.ctss}()},
\code{\link{import.bedScore}()},
\code{\link{import.bedmolecule}()},
\code{\link{loadFileIntoGPos}()},
\code{\link{moleculesGR2CTSS}()}
}
\concept{loadFileIntoGPos}
