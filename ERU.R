library("quantmod")
getFX("EUR/TWD", form ="2015-01-01")

class(EURTWD)

write.zoo
function (x, file = "", index.name = "Index", row.names = FALSE, 
          col.names = NULL, ...) 
{
  if (is.null(col.names)) 
    col.names <- !is.null(colnames(x))
  dx <- as.data.frame(x)
  stopifnot(all(names(dx) != index.name))
  dx[[index.name]] <- index(x)
  dx <- dx[, c(ncol(dx), 1:(ncol(dx) - 1))]
  write.table(dx, file = file, row.names = row.names, col.names = col.names, 
              ...)
}

write.zoo(EURTWD, "EURTWD.csv", sep=",")