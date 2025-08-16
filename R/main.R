#' Load phyloseq object from HuGMycoA
#'
#' @param level Character. "Genus" or "SH" 
#' @param filterdepth Logical. TRUE = filter depth, FALSE = no filter
#' @return phyloseq object
#' @export
load_hugmycoa <- function(level = c("Genus", "SH"), filterdepth = TRUE) {
  # 检查 phyloseq 是否安装
  if (!requireNamespace("phyloseq", quietly = TRUE)) {
    stop("The package 'phyloseq' is required. Please install it before using the HuGMycoA")
  }

  # 匹配参数
  level <- match.arg(level)

  # 根据参数选择文件名
  file_map <- list(
    "SH" = list("TRUE" = "ps_fdp_sh.rds", "FALSE" = "ps_nfdp_sh.rds"),
    "Genus" = list("TRUE" = "ps_fdp_gen.rds", "FALSE" = "ps_nfdp_gen.rds")
  )
  rds_file <- file_map[[level]][[as.character(filterdepth)]]

  # 找到包内文件路径
  rds_path <- system.file("extdata", rds_file, package = "hugmycoa")
  if (rds_path == "") stop("Data file not found in the package. Try to reinstall")

  # 读取并返回
  readRDS(rds_path)
}