################################################################################
## stolen from https://github.com/data-edu/tidyLPA
################################################################################
## run plot_profiles.tidyLPA
x = mod2; variables = NULL; ci = .95; sd = TRUE; add_line = FALSE; rawdata = TRUE; bw = FALSE; alpha_range = c(0, .1);


plot_profiles.tidyProfile <- function(x, variables = NULL, ci = .95, sd = TRUE, add_line = TRUE, rawdata = TRUE, bw = FALSE, alpha_range = c(0, .1), ...){
    Args <- as.list(match.call()[-1])
    df_plot <- get_estimates(x)

    df_plot$Value <- df_plot$Estimate
    df_plot$Class <- ordered(df_plot$Class)
    df_plot$Variable <- ordered(df_plot$Parameter, levels = unique(df_plot$Parameter))

    # Drop useless stuff
    df_plot <- df_plot[grepl("(^Means$|^Variances$)", df_plot$Category),
                       -match(c("p", "Parameter", "Estimate"), names(df_plot))]

    # Select only requested variables, or else, all variables
    ## if (!is.null(variables)) {
    ##     df_plot <- df_plot[tolower(df_plot$Variable) %in% tolower(variables), ]
    ## }

    df_plot$idvar <- paste0(
      df_plot$Model, df_plot$Classes,
      df_plot$Class, df_plot$Variable
    )
    df_plot <- reshape(data.frame(df_plot),
                       idvar = "idvar", timevar = "Category",
                       v.names = c("Value", "se"), direction = "wide"
    )

    df_plot <- df_plot[, -match("idvar", names(df_plot))]
    # Get some classy names
    names(df_plot) <- gsub("\\.Means", "", names(df_plot))

    df_raw <- NULL

    Args[["x"]] <- list(df_plot = df_plot, df_raw = df_raw)

    do.call(plot_profiles, Args)
}

plot_profiles.tidyLPA <- function(x, variables = NULL, ci = .95, sd = TRUE, add_line = FALSE, rawdata = TRUE, bw = FALSE, alpha_range = c(0, .1), ...){
    Args <- as.list(match.call()[-1])
    df_plot <- get_estimates(x)

    names(df_plot)[match(c("Estimate", "Parameter"), names(df_plot))] <- c("Value", "Variable")
    df_plot$Class <- ordered(df_plot$Class)

    if(!"Classes" %in% names(df_plot)){
        df_plot$Classes <- length(unique(df_plot$Class))
    }
    # Drop useless stuff
    df_plot <- df_plot[grepl("(^Means$|^Variances$)", df_plot$Category),
                       -match(c("p"), names(df_plot))]
    df_plot$Variable <- ordered(df_plot$Variable, levels = unique(df_plot$Variable))
    # Select only requested variables, or else, all variables
    if (!is.null(variables)) {
        df_plot <- df_plot[tolower(df_plot$Variable) %in% tolower(variables), ]
    }
    df_plot$Variable <- droplevels(df_plot$Variable)
    variables <- levels(df_plot$Variable)
    df_plot$idvar <- paste0(df_plot$Model, df_plot$Classes, df_plot$Class, df_plot$Variable)
    df_plot <- reshape(data.frame(df_plot), idvar = "idvar", timevar = "Category", v.names = c("Value", "se"), direction = "wide")

    df_plot <- df_plot[, -match("idvar", names(df_plot))]
    # Get some classy names
    names(df_plot) <- gsub("\\.Means", "", names(df_plot))

    if (rawdata) {
        df_raw <- .get_long_data(x)
        df_raw <- df_raw[, c("model_number", "classes_number", variables, "Class", "Class_prob", "Probability", "id")]
        df_raw$Class <- ordered(df_raw$Class_prob, levels = levels(df_plot$Class))
        variable_names <- paste("Value", names(df_raw)[-c(1,2, ncol(df_raw)-c(0:3))], sep = "...")
        names(df_raw)[-c(1,2, ncol(df_raw)-c(0:3))] <- variable_names
        df_raw <- reshape(
            df_raw,
            varying = c(Variable = variable_names),
            idvar = "new_id",
            direction = "long",
            timevar = "Variable",
            sep = "..."
        )
        if(any(c("Class_prob", "id", "new_id") %in% names(df_raw))){
            df_raw <- df_raw[, -which(names(df_raw) %in% c("Class_prob", "id", "new_id"))]
        }

        df_raw$Variable <- ordered(df_raw$Variable,
                                   levels = levels(df_plot$Variable))
        names(df_raw)[c(1,2)] <- c("Model", "Classes")
    } else {
        df_raw <- NULL
    }

    Args[["x"]] <- list(df_plot = df_plot, df_raw = df_raw)

    do.call(plot_profiles, Args)
}
