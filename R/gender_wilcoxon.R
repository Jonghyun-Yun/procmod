for (out_dir in ldir) {
fwil_path = paste0(out_dir, "wilcoxon.txt")
  if (file.exists(fwil_path)) {
    ##Delete file if it exists
    file.remove(fwil_path)
  }
source("R/pmean.R")
source("R/pinfo_preproc.R")

sink(fwil_path)
x = minfo$tau[minfo$GENDER_R == 1]
y = minfo$tau[minfo$GENDER_R == 2]
cat(wilcox.test(x, y, alternative = "two.sided")$p.value)
cat("\n")
x = minfo$theta[minfo$GENDER_R == 1]
y = minfo$theta[minfo$GENDER_R == 2]
cat(wilcox.test(x, y, alternative = "two.sided")$p.value)
sink()
  }
