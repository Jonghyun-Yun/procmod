booklet = readr::read_csv("~/Dropbox/research/procmod/procmod-code/data/PIAAC_cleaned_data_1110/Problem_solving/PS_BOOKLET_ITEM.csv")
booklet$NAME = stringr::str_replace_all(booklet$NAME, " ", "_")
booklet$NAME = stringr::str_replace_all(booklet$NAME, "_-", "-")
booklet$NAME = stringr::str_replace_all(booklet$NAME, "-_", "-")
booklet$NAME = tolower(booklet$NAME)

if (item_code == "U01a000S") {
sub_str = rbind(c("(.*)\\*\\$target=u01a_(.*)","\\1\\2"), c("id=u01a_",  ""), c("\\*\\$target=",  ""))
ignore_desc = c(
"START",
"END",
"KEYPRESS")
}

## instruction is not clear. too many actions
## respondents got confused (create or not create a folder to organize??)

if (item_code == "U01b000S") {
sub_str = rbind(c("(.*)\\*\\$target=u01b_(.*)","\\1\\2"), c("id=u01b_",  ""), c("\\*\\$target=",  ""), c("\\*\\$value=", ""))
ignore_desc = c(
"START",
"END",
"KEYPRESS")
}

## instruction is not clear. too many actions
## respondents got confused (create or not create a folder to organize??)
if (item_code == "U03a000S") {
sub_str = rbind(
  c("(.*)\\*\\$target=u03a_(.*)","\\1\\2"),
  c("id=u03a_",  ""),
  c("id=u04a_",  ""),
  c("\\*\\$target=", ""),
  c("\\*\\$value=", ""),
  c("\\*\\$index=", ""))
ignore_desc = c(
"START",
"END",
"KEYPRESS")
}

if (item_code == "U06a000S") {
sub_str = rbind(
  c("(.*)\\*\\$target=u03a_(.*)","\\1\\2"),
  c("id=u03a_",  ""),
  c("id=u04a_",  ""),
  c("id=u06a_",  ""),
  c("\\*\\$target=", ""),
  c("\\*\\$value=", ""),
  c("\\*\\$index=", ""),
  c("\\*\\$href=", ""))
ignore_desc = c(
"START",
"END",
"KEYPRESS")
}

if (item_code == "U06b000S") {
sub_str = rbind(
  c("(.*)\\*\\$target=u03a_(.*)","\\1\\2"),
  c("id=u03a_",  ""),
  c("id=u04a_",  ""),
  c("id=u06a_",  ""),
  c("\\*\\$target=", ""),
  c("\\*\\$value=", ""),
  c("\\*\\$index=", ""),
  c("\\*\\$href=", ""))
ignore_desc = c(
"START",
"END",
"KEYPRESS")
}

if (item_code == "U21x000S") {
sub_str = rbind(
  c("(.*)\\*\\$target=u03a_(.*)","\\1\\2"),
  c("id=u03a_",  ""),
  c("id=u04a_",  ""),
  c("id=u06a_",  ""),
  c("\\*\\$target=", ""),
  c("\\*\\$value=", ""),
  c("\\*\\$index=", ""),
  c("\\*\\$href=", ""))
ignore_desc = c(
"START",
"END",
"KEYPRESS")
}

if (item_code == "U04a000S") {
sub_str = rbind(
  c("(.*)\\*\\$target=u03a_(.*)","\\1\\2"),
  c("id=u03a_",  ""),
  c("id=u04a_",  ""),
  c("id=u06a_",  ""),
  c("\\*\\$target=", ""),
  c("\\*\\$value=", ""),
  c("\\*\\$index=", ""),
  c("\\*\\$href=", ""))
ignore_desc = c(
"START",
"END",
"KEYPRESS")
}

if (item_code == "U19a000S") {
sub_str = rbind(
  c("(.*)\\*\\$target=u03a_(.*)","\\1\\2"),
  c("id=u03a_",  ""),
  c("id=u04a_",  ""),
  c("id=u06a_",  ""),
  c("\\*\\$target=", ""),
  c("\\*\\$value=", ""),
  c("\\*\\$index=", ""),
  c("\\*\\$href=", ""))
ignore_desc = c(
"START",
"END",
"KEYPRESS")
}

if (item_code == "U19b000S") {
sub_str = rbind(
  c("(.*)\\*\\$target=u03a_(.*)","\\1\\2"),
  c("id=u03a_",  ""),
  c("id=u04a_",  ""),
  c("id=u06a_",  ""),
  c("\\*\\$target=", ""),
  c("\\*\\$value=", ""),
  c("\\*\\$index=", ""),
  c("\\*\\$href=", ""))
ignore_desc = c(
"START",
"END",
"KEYPRESS")
}

if (item_code == "U07x000S") {
sub_str = rbind(
  c("(.*)\\*\\$target=u03a_(.*)","\\1\\2"),
  c("id=u03a_",  ""),
  c("id=u04a_",  ""),
  c("id=u06a_",  ""),
  c("\\*\\$target=", ""),
  c("\\*\\$value=", ""),
  c("\\*\\$index=", ""),
  c("\\*\\$href=", ""))
ignore_desc = c(
"START",
"END",
"KEYPRESS")
}

if (item_code == "U16x000S") {
sub_str = rbind(
  c("(.*)\\*\\$target=u03a_(.*)","\\1\\2"),
  c("id=u03a_",  ""),
  c("id=u04a_",  ""),
  c("id=u06a_",  ""),
  c("\\*\\$target=", ""),
  c("\\*\\$value=", ""),
  c("\\*\\$index=", ""),
  c("\\*\\$href=", ""))
ignore_desc = c(
"START",
"END",
"KEYPRESS")
}

if (item_code == "U02x000S") {
sub_str = rbind(
  c("(.*)\\*\\$target=u03a_(.*)","\\1\\2"),
  c("id=u03a_",  ""),
  c("id=u04a_",  ""),
  c("id=u06a_",  ""),
  c("\\*\\$target=", ""),
  c("\\*\\$value=", ""),
  c("\\*\\$index=", ""),
  c("\\*\\$href=", ""))
ignore_desc = c(
"START",
"END",
"KEYPRESS")
}

if (item_code == "U11b000S") {
sub_str = rbind(
  c("(.*)\\*\\$target=u03a_(.*)","\\1\\2"),
  c("id=u03a_",  ""),
  c("id=u04a_",  ""),
  c("id=u06a_",  ""),
  c("\\*\\$target=", ""),
  c("\\*\\$value=", ""),
  c("\\*\\$index=", ""),
  c("\\*\\$href=", ""))
ignore_desc = c(
"START",
"END",
"KEYPRESS")
}

if (item_code == "U23x000S") {
sub_str = rbind(
  c("(.*)\\*\\$target=u03a_(.*)","\\1\\2"),
  c("id=u03a_",  ""),
  c("id=u04a_",  ""),
  c("id=u06a_",  ""),
  c("\\*\\$target=", ""),
  c("\\*\\$value=", ""),
  c("\\*\\$index=", ""),
  c("\\*\\$href=", ""))
ignore_desc = c(
"START",
"END",
"KEYPRESS")
}
