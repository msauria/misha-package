\name{gdb.create}
\alias{gdb.create}
\title{
Creates a new Genomic Database
}
\description{
Creates a new Genomic Database.
}
\usage{
gdb.create(groot, fasta, genes.file = NULL, annots.file = NULL,
           annots.names = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{groot}{path to newly created database}
  \item{fasta}{an array of names or URLs of FASTA files. Can contain wildcards for multiple files}
  \item{genes.file}{name or URL of file that contains genes. If 'NULL' no genes are imported}
  \item{annots.file}{name of URL file that contains annotations. If 'NULL' no annotations are imported}
  \item{annots.names}{annotations names}
}
\details{
This function creates a new Genomic Database at the location specified by 'groot'. FASTA files are converted to 'Seq' format and appropriate 'chrom_sizes.txt' file is generated (see "User Manual" for more details).

If 'genes.file' is not 'NULL' four sets of intervals are created in the database: \code{tss}, \code{exons}, \code{utr3} and \code{utr5}. See \link{gintervals.import_genes} for more details about importing genes intervals.

'fasta', 'genes.file' and 'annots.file' can be either a file path or URL in a form of 'ftp://[address]/[file]'. 'fasta' can also contain wildcards to indicate multiple files. Files that these arguments point to can be zipped or unzipped.
}
\value{
None.
}

\examples{
\dontrun{
ftp = "ftp://hgdownload.soe.ucsc.edu/goldenPath/hg19"
gdb.create("mydb",
           c(paste(ftp, "chromosomes/chr2*", sep = "/"),
             paste(ftp, "chromosomes/chr7.*", sep = "/")),
           paste(ftp, "database/knownGene.txt.gz", sep = "/"),
           paste(ftp, "database/kgXref.txt.gz", sep = "/"),
           c("kgID", "mRNA", "spID", "spDisplayID", "geneSymbol",
             "refseq", "protAcc", "description", "rfamAcc",
             "tRnaName"))
gdb.init("mydb")
gintervals.ls()
gintervals.all()
}
}

\seealso{
\code{\link{gdb.init}}, \code{\link{gdb.reload}}, \code{\link{gintervals.import_genes}}
}
\keyword{ ~database }
\keyword{ ~create }
\keyword{ ~genes }
