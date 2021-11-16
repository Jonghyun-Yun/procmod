################################################################################
## stolen from https://github.com/data-edu/tidyLPA
################################################################################
## run plot_profiles.tidyLPA

plot_profiles.default <- function(x, variables = NULL, ci = .95, sd = TRUE, add_line = FALSE, rawdata = TRUE, bw = FALSE, alpha_range = c(0, .1), ...){
    df_plot <- droplevels(x[["df_plot"]])

    if(rawdata){
        df_raw <- droplevels(x[["df_raw"]])
        # Check consistency of factor levels
        if(!all(unique(df_plot$Variable) %in% unique(df_raw$Variable))){
            stop("Could not match raw data to model estimates.")
        }
        df_raw$Variable <- as.numeric(df_raw$Variable)
    }

    level_labels <- levels(df_plot$Variable)
    df_plot$Variable <- as.numeric(df_plot$Variable)

    # Basic plot
    if (bw) {
        classplot <-
            ggplot(NULL,
                   aes_string(
                       x = "Variable",
                       y = "Value",
                       group = "Class",
                       linetype = "Class",
                       shape = "Class"
                   ))
    } else {
        classplot <-
            ggplot(
                NULL,
                aes_string(
                    x = "Variable",
                    y = "Value",
                    group = "Class",
                    linetype = "Class",
                    shape = "Class",
                    colour = "Class"
                )
            ) + scale_colour_manual(values = get_palette(max(df_plot$Classes)))
    }

    if (rawdata) {
        classplot <- classplot +
            geom_jitter(
                data = df_raw,
                width = .2,
                aes_string(
                    x = "Variable",
                    y = "Value",
                    shape = "Class",
                    alpha = "Probability"
                )
            ) +
            scale_alpha_continuous(range = alpha_range, guide = FALSE)
    }
    classplot <- classplot + geom_point(data = df_plot) +
        scale_x_continuous(breaks = 1:length(level_labels),
                           labels = level_labels) +
        theme_bw() +
        theme(panel.grid.minor.x = element_blank())

    if(add_line) classplot <- classplot + geom_line(data = df_plot)

    # Add errorbars
    if (!is.null(ci)) {
        ci <- qnorm(.5 * (1 - ci))
        df_plot$error_min <- df_plot$Value + ci*df_plot$se
        df_plot$error_max <- df_plot$Value - ci*df_plot$se

        classplot <-
            classplot + geom_errorbar(data = df_plot,
                                      aes_string(ymin = "error_min",
                                                 ymax = "error_max"),
                                      width = .4)
    }
    if(sd){

        df_plot$sd_xmin <- df_plot$Variable-.2
        df_plot$sd_xmax <- df_plot$Variable+.2
        df_plot$sd_ymin <- df_plot$Value - sqrt(df_plot$Value.Variances)
        df_plot$sd_ymax <- df_plot$Value + sqrt(df_plot$Value.Variances)

        if(bw){
            classplot <-
                classplot + geom_rect(
                    data = df_plot,
                    aes_string(
                        xmin = "sd_xmin",
                        xmax = "sd_xmax",
                        ymin = "sd_ymin",
                        ymax = "sd_ymax",
                        linetype = "Class"
                    ),
                    colour = "black",
                    fill=ggplot2::alpha("grey", 0),
                    inherit.aes=FALSE
                )
        } else {
            classplot <-
                classplot + geom_rect(
                    data = df_plot,
                    aes_string(
                        xmin = "sd_xmin",
                        xmax = "sd_xmax",
                        ymin = "sd_ymin",
                        ymax = "sd_ymax",
                        colour = "Class"
                    ),
                    fill=ggplot2::alpha("grey", 0),
                    inherit.aes=FALSE
                )
        }

    }

    if (length(unique(df_plot$Classes)) > 1) {
        if(length(unique(df_plot$Model)) > 1){
            classplot <- classplot + facet_grid(Model ~ Classes, labeller = label_both)
        } else {
            classplot <- classplot + facet_wrap(~ Classes, labeller = label_both)
        }
    } else {
        if(length(unique(df_plot$Model)) > 1){
            classplot <- classplot + facet_wrap(~ Model, labeller = label_both)
        }
    }
    suppressWarnings(print(classplot))
    return(invisible(classplot))
}

get_palette <- function(x){
    if(x < 10){
        switch(max(x-2, 1),
               c("#E41A1C", "#377EB8", "#4DAF4A"),
               c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3"),
               c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3", "#FF7F00"),
               c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3", "#FF7F00", "#FFFF33"),
               c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3", "#FF7F00", "#FFFF33", "#A65628"),
               c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3", "#FF7F00", "#FFFF33", "#A65628", "#F781BF"),
               c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3", "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999")
        )[1:x]
    } else {
        colrs <- grDevices::colors()[grep('gr(a|e)y', grDevices::colors(), invert = T)]
        c(get_palette(9), sample(colrs, (x-9)))
    }
}

.get_long_data <- function(x, ...) {
    if(inherits(x, "tidyProfile")){
        x <- list(x)
    }
    out <- lapply(x, function(x) {
        if(!is.null(x[["dff"]])){
            dt <- data.frame(x[["dff"]])
            prob_names <- grep("^CPROB", names(dt), value = TRUE)
            if (length(prob_names) > 1) {
                reshape(
                    dt,
                    varying = c("Probability" = prob_names),
                    direction = "long",
                    v.names = "Probability",
                    timevar = "Class_prob",
                    sep = ""
                )
            } else {
                cbind(
                    dt[, 1:(ncol(dt) - 2)],
                    Class = dt$Class,
                    Class_prob = dt$Class,
                    Probability = dt$CPROB1,
                    id = 1:nrow(dt)
                )
            }
        }
    })
    do.call(rbind, out)
}
