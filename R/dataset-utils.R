#' 通过文件名读取数据
#' @importFrom readr read_csv
#' @importFrom readr read_tsv
#' @importFrom readr read_delim
#' @importFrom readxl read_excel
#' @param dataset_path
#'
#' @returns dataset
#' @export
#'
#' @examples dataset <- readDataset("/path/ggplot2_mpg.rds")
readDataset <- function(dataset_path) {
  # 获取文件后缀
  ext <- tools::file_ext(dataset_path) |> tolower()

  # 根据后缀选择读取方式
  switch(ext,

    # CSV
    "csv" = {
      if (!requireNamespace("readr", quietly = TRUE)) {
        stop("Package 'readr' is required for reading CSV files.")
      }
      readr::read_csv(dataset_path)
    },

    # TSV / TXT
    "tsv" = {
      if (!requireNamespace("readr", quietly = TRUE)) {
        stop("Package 'readr' is required for reading TSV files.")
      }
      readr::read_tsv(dataset_path)
    },
    "txt" = {
      if (!requireNamespace("readr", quietly = TRUE)) {
        stop("Package 'readr' is required for reading TXT files.")
      }
      readr::read_delim(dataset_path, delim = "\t")
    },

    # RDS
    "rds" = {
      readRDS(dataset_path)
    },

    # EXCEL
    "xlsx" = {
      if (!requireNamespace("readxl", quietly = TRUE)) {
        stop("Package 'readxl' is required for reading Excel files.")
      }
      readxl::read_excel(dataset_path)
    },
    "xls" = {
      if (!requireNamespace("readxl", quietly = TRUE)) {
        stop("Package 'readxl' is required for reading Excel files.")
      }
      readxl::read_excel(dataset_path)
    },

    # 未支持格式
    stop(paste0("Unsupported file extension: .", ext))
  )
}
