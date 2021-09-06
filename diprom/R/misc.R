cl_box = function(y, cl, myname = NULL) {
dd <- data.frame(y = y, cl = cl)
boxp <- ggplot(dd, aes(x = factor(cl), y = y, fill = factor(cl))) +
  geom_boxplot() +
  theme(legend.position = "none")
if (!is.null(myname)) {
boxp = boxp + labs(y = myname[1], x = myname[2])}
print(boxp)
    }

cl_plot <- function(x, cl, myname = NULL, size_ = 1, xlim = NA, ylim = NA) {
  ## plot 2d array x
  ## mark points by groups specified by cl

  cl <- as.factor(cl)
  position <- as.data.frame(x)
  ndim <- dim(x)[2]

  colnames(position) <- paste("position", 1:ndim, sep = "")

  padding <- 1.05
  if (any(is.na(xlim))) {
    x1 <- -max(abs(position[, 1])) * padding
    x2 <- max(abs(position[, 1])) * padding
  } else {
    x1 <- xlim[1]
    x2 <- xlim[2]
  }
  if (any(is.na(ylim))) {
    y1 <- -max(abs(position[, 2])) * padding
    y2 <- max(abs(position[, 2])) * padding
  } else {
    y1 <- ylim[1]
    y2 <- ylim[2]
  }

  mytheme <- theme(
    axis.line = element_line(colour = "black"),
    ## panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    ## panel.border = element_blank(),
    panel.background = element_blank()
  )

  ## plot
  pp <- ggplot(position, aes(x = position1, y = position2, colour = cl)) +
    ## theme(text=element_text(size=20)) +
    ## geom_point()+
    xlim(x1, x2) +
    ylim(y1, y2) +
    xlab(myname[1]) +
    ylab(myname[2]) +
    ## xlab("Position 1") + ylab("Position 2") +
    geom_hline(yintercept = 0, color = "gray70", linetype = 2) +
    geom_vline(xintercept = 0, color = "gray70", linetype = 2) +
    mytheme
  pp <- pp + geom_point(size = size_)
  ## pp +
  ##   geom_text(
  ##     data = subset(position, idx == "w"), aes(x = position1, y = position2, label = (1:n_w), colour = cl_w),
  ##     ## segment.color = "grey50",
  ##     check_overlap = FALSE, show.legend = FALSE, size = 4
  ##   )
}
