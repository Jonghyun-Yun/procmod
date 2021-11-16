bf = ainfo %>% select(AGEG5LFS, ICTHOME, READHOME, WRITHOME, NUMHOME, NFEHRS, ICTWORK, READWORK, WRITWORK, NUMWORK, INFLUENCE, EARNHRDCL, TASKDISC, LEARNATWORK)
bname = names(bf)
var = readr::read_csv("./data/PIAAC_cleaned_data_1110/PUF_Variables.csv")
var = var %>% filter(Domain %in% c("Sampling / weighting", "Not assigned" ,"Sampling / weighting (derived)", "Background questionnaire (trend)"  ,"Background questionnaire", "Background questionnaire (derived)")
)
param = data.frame(SEQID = unique(item$SEQID), theta = mtheta$mean, tau = mtau$mean)
pinfo = readr::read_csv("./data/PIAAC_cleaned_data_1110/PUFs_spss.csv")
pinfo = pinfo %>% select(SEQID) %>% cbind(pinfo[,names(pinfo) %in% toupper(var$Name)])
minfo = plyr::join(param, pinfo, by = 'SEQID', type = "inner")
dx = minfo[,4:ncol(minfo)]
fname = "back_var.txt"
toprint = var %>% filter(Name %in% bname) %>% select(Name, Label, 'Value scheme')
kable2file(toprint, fname)

bf[bf==999999999999] = NA ## back to NA
bf = bf %>%
  single_imputation() %>%
  scale() %>% as.data.frame
df = mod2[[1]]
before = df[["dff"]][,1:6]
after = df[["dff"]][,-c(1:6)]
df[["dff"]] = before %>% mutate(AGEG5LFS = bf$AGEG5LFS, ICTHOME = bf$ICTHOME, READHOME = bf$READHOME, WRITHOME = bf$WRITHOME, NUMHOME = bf$NUMHOME, NFEHRS = bf$NFEHRS, ICTWORK = bf$ICTWORK, READWORK = bf$READWORK, WRITWORK = bf$WRITWORK, NUMWORK = bf$NUMWORK, INFLUENCE = bf$INFLUENCE, EARNHRDCL = bf$EARNHRDCL, TASKDISC = bf$TASKDISC, LEARNATWORK = bf$LEARNATWORK) %>% cbind(after)
variables = c("tau", "theta", "naction", "spd", bname)

tt = df[["dff"]]
mm = aggregate(tt, list(tt$Class), FUN=mean)
sd = aggregate(tt, list(tt$Class), FUN=sd)
n = aggregate(tt, list(tt$Class), FUN=length)
se = sd / sqrt(n)

df_raw = .get_long_data(df)

x = mod2; ci = .95; sd = TRUE; add_line = FALSE; rawdata = TRUE; bw = FALSE; alpha_range = c(0, .1)

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
## variables <- levels(df_plot$Variable)
df_plot$idvar <- paste0(df_plot$Model, df_plot$Classes, df_plot$Class, df_plot$Variable)
df_plot <- reshape(data.frame(df_plot), idvar = "idvar", timevar = "Category", v.names = c("Value", "se"), direction = "wide")

df_plot <- df_plot[, -match("idvar", names(df_plot))]
                                        # Get some classy names
names(df_plot) <- gsub("\\.Means", "", names(df_plot))

dd = df_plot
for (nn in bname) {
for (ii in unique(df_plot$Class)) {
  dd = rbind(dd,data.frame(Variable = nn, Class = ii, Model = dd[1,3], Classes = dd[1,4], Value = mm[ii,nn], se = se[ii,nn], Value.Variances = dd[1,7],
   se.Variances = dd[1,8]))
    }}
df_plot = dd
variables <- levels(df_plot$Variable)

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

plot_profiles.default(x =  list(df_plot = df_plot, df_raw = df_raw))
