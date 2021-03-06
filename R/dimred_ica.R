#' @rdname dimred
#' @export
dimred_ica <- function(x, ndim = 3) {
  requireNamespace("fastICA")

  if (is_sparse(x)) {
    x <- as.matrix(x)
  }

  space <- fastICA::fastICA(t(scale(t(x))), n.comp = ndim)$S

  .process_dimred(space)
}
