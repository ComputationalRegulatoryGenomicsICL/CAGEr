% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ExportMethods.R
\name{exportToTrack}
\alias{exportToTrack}
\alias{exportToTrack,CAGEexp-method}
\alias{exportToTrack,GRangesList-method}
\alias{exportToTrack,GRanges-method}
\alias{exportToTrack,CTSS-method}
\alias{exportToTrack,TagClusters-method}
\alias{exportToTrack,ConsensusClusters-method}
\title{Converts TSSs and clusters of TSSs to a genome browser track format}
\usage{
exportToTrack(
  object,
  what = c("CTSS", "tagClusters", "consensusClusters"),
  qLow = NULL,
  qUp = NULL,
  colorByExpressionProfile = FALSE,
  oneTrack = TRUE
)

\S4method{exportToTrack}{CAGEexp}(
  object,
  what = c("CTSS", "tagClusters", "consensusClusters"),
  qLow = NULL,
  qUp = NULL,
  colorByExpressionProfile = FALSE,
  oneTrack = TRUE
)

\S4method{exportToTrack}{GRangesList}(
  object,
  what = c("CTSS", "tagClusters", "consensusClusters"),
  qLow = NULL,
  qUp = NULL,
  colorByExpressionProfile = FALSE,
  oneTrack = TRUE
)

\S4method{exportToTrack}{GRanges}(
  object,
  what = c("CTSS", "tagClusters", "consensusClusters"),
  qLow = NULL,
  qUp = NULL,
  colorByExpressionProfile = FALSE,
  oneTrack = TRUE
)

\S4method{exportToTrack}{CTSS}(
  object,
  what = c("CTSS", "tagClusters", "consensusClusters"),
  qLow = NULL,
  qUp = NULL,
  colorByExpressionProfile = FALSE,
  oneTrack = TRUE
)

\S4method{exportToTrack}{TagClusters}(
  object,
  what = c("CTSS", "tagClusters", "consensusClusters"),
  qLow = NULL,
  qUp = NULL,
  colorByExpressionProfile = FALSE,
  oneTrack = TRUE
)

\S4method{exportToTrack}{ConsensusClusters}(
  object,
  what = c("CTSS", "tagClusters", "consensusClusters"),
  qLow = NULL,
  qUp = NULL,
  colorByExpressionProfile = FALSE,
  oneTrack = TRUE
)
}
\arguments{
\item{object}{A \code{\link{CAGEexp}} object.}

\item{what}{Which elements should be exported: \code{CTSS} for
individual \emph{CTSSs},  \code{tagClusters} for \emph{tag clusters} or \code{consensusClusters}
for \emph{consensus clusters}.}

\item{qLow, qUp}{Position of which "lower" (resp. "upper") quantile should be
used as 5' (resp. 3') boundary of the filled block in whiskerplot-like
representation of the cluster.  Default: \code{NULL} (plain line representation).
Ignored when \code{what = "CTSS"}.}

\item{colorByExpressionProfile}{Logical, should blocks be colored in the
color of their corresponding expression class.  Ignored when
\code{what} equals\code{"tagClusters"}.}

\item{oneTrack}{Logical, should the data be converted in an individual
object or a list of objects?}
}
\value{
Returns either a \code{rtracklayer} \code{UCSCData} object, or a \code{GRangesList}
of them.
}
\description{
Converts \emph{CTSS}, \emph{tag clusters} or \emph{consensus clusters} to the
\code{UCSCData} format of the \code{rtracklayer} package, that can be exported to BED
file(s) with track information for genome browsers.  \emph{CTSSes} and
\emph{consensus clusters} are optionally colored by their expression class.
\emph{Tag clusters} and \emph{consensus clusters} can be displayed in a
whiskerplot-like representation with a line showing full span on the cluster,
filled block showing interquantile range and a thick box denoting position of
the dominant (most frequently) used \emph{TSS}.
}
\details{
The BED representations of \emph{CTSSs}, \emph{tag cluster} and
\emph{consensus clusters} can be directly visualised in the ZENBU or UCSC Genome
Browsers.

When \code{what = "CTSS"}, one \code{UCSCData} object with single track of 1 bp blocks
representing all detected CTSSs (in all CAGE samples) is created.  CTSSs can
be colored according to their expression class (see
\code{\link{getExpressionProfiles}} and \code{\link{plotExpressionProfiles}}).  For
\code{colorByExpressionProfile = FALSE}, CTSSs included in the clusters are
shown in black and CTSSs that were filtered out in gray.

When \code{what = "tagClusters"}, one track per CAGE dataset is created, which can
be exported to a single \code{UCSCData} object (by setting \code{oneFile = TRUE}) or separate
ones (\code{FALSE}).  If no quantile boundaries were provided (\code{qLow} and
\code{qUp} are \code{NULL}, TCs are represented as simple blocks showing the full
span of TC fromthe start to the end.  Setting \code{qLow} and/or \code{qUp} parameters
to a value of the desired quantile creates a gene-like representation with a
line showing full span of the TC, filled block showing specified
interquantile range and a thick 1 bp block denoting position of the dominant
(most frequently used) TSS.  All TCs in one track (one CAGE dataset) are
shown in the same color.

When \code{what = "consensusClusters"} \emph{consensus clusters} are exported.
Since there is only one set of consensus clusters common to all CAGE
datasets, only one track is created in case of a simple representation.  This
means that when \code{qLow = NULL} and \code{qUp = NULL} one track with blocks showing
the full span of consensus cluster from the start to the end is created.
However, the distribution of the CAGE signal within consensus cluster can be
different in different CAGE samples, resulting in different positions of
quantiles and dominant TSS.  Thus, when \code{qLow} and/or \code{qUp} parameters
are set to a value of the desired quantile, a separate track with a gene-like
representation is created for every CAGE dataset.  These tracks can be
exported to a single \code{UCSCData} object (by setting \code{oneFile = TRUE}) or separate
ones (by setting \code{oneFile = FALSE}).  The gene-like representation is
analogous to the one described above for the TCs.  In all cases consensus
clusters can be colored according to their expression class (provided the
expression profiling of consensus clusters was done by calling
\code{getExpressionProfiles} function).  Colors of expression classes match the
colors in which they are shown in the plot returned by the
\code{plotExpressionProfiles} function.  For \code{colorByExpressionProfile = FALSE}
all consensus clusters are shown in black.
}
\examples{
# You can export from a CAGEexp object or from a cluster object directly:
exportToTrack(exampleCAGEexp, what = "CTSS")  # Is same as:
exportToTrack(CTSScoordinatesGR(exampleCAGEexp))  # Or:
exampleCAGEexp |> CTSScoordinatesGR() |> exportToTrack()

# Export a single sample, 
exampleCAGEexp |> CTSStagCountGR(2)      |> exportToTrack()
exampleCAGEexp |> CTSSnormalizedTpmGR(2) |> exportToTrack()

# Exporting multiple samples results in a GRangesList of UCSCData objects.
exportToTrack(exampleCAGEexp, what = "CTSS", oneTrack = FALSE)
exampleCAGEexp |> CTSStagCountGR("all")  |> exportToTrack()
exampleCAGEexp |> CTSSnormalizedTpmGR("all")  |> exportToTrack()

### exporting CTSSs colored by expression class
# Temporarly disabled
# exportToTrack(exampleCAGEexp, what = "CTSS", colorByExpressionProfile = TRUE)

### exporting tag clusters in gene-like representation
exportToTrack(exampleCAGEexp, what = "tagClusters", qLow = 0.1, qUp = 0.9)
tagClustersGR(exampleCAGEexp, 1) |> exportToTrack(qLow = 0.1, qUp = 0.9)
           
### exporting consensus clusters
exportToTrack( exampleCAGEexp, what = "consensusClusters")
exampleCAGEexp |>
  consensusClustersGR("Zf.high", qLow = .1, qUp = .9) |>
  exportToTrack(qLow = .1, qUp = .9)
exportToTrack( exampleCAGEexp, what = "consensusClusters"
             , qLow = 0.1, qUp = 0.9, oneTrack = FALSE)

}
\author{
Vanja Haberle

Charles Plessy
}
\concept{CAGEr export functions}
