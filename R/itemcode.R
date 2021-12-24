booklet = readr::read_csv("~/Dropbox/research/procmod/procmod-code/data/PIAAC_cleaned_data_1110/Problem_solving/PS_BOOKLET_ITEM.csv")
booklet$NAME = stringr::str_replace_all(booklet$NAME, " ", "_")
booklet$NAME = stringr::str_replace_all(booklet$NAME, "_-", "-")
booklet$NAME = stringr::str_replace_all(booklet$NAME, "-_", "-")
booklet$NAME = tolower(booklet$NAME)

## ## Party Invitations - 1;
## item_code = "U01a000S"
## ## Party Invitations - 2;
## item_code = "U01b000S"
## ## CD Tally;
## item_code = "U03a000S"
## ## Sprained Ankle - 1;
## item_code = "U06a000S"
## ## Tickets;
## item_code = "U21x000S"
## ## Club Membership - 1;
## item_code = "U19a000S"
## ## Book Order;
## item_code = "U07x000S"
## ## Meeting Room;
## item_code = "U02x000S"
## ## Locate Email;
## item_code = "U11b000S"
## ## Lamp Return;
## item_code = "U23x000S"

def_sub_str = rbind(
  c("TEST_TIME=(.+)",""),
  c("id=",""),
  c("\\*\\$target=_", "target="),
  c("\\*\\$value=", "value="),
  c("\\*\\$index=", "index="),
  c("\\*\\$href=", "href="),
  c("\\*\\$", ""),
  c("\"", ""),
  c("\\|","\\."))
def_ignore_desc = c(
"START",
"END",
"KEYPRESS")

if (item_code == "U01a000S") {
sub_str = rbind(
  c("(.*)\\*\\$target=u01a_(.*)","\\1\\2"),
  c("id=u01a_",  ""),
  def_sub_str)
ignore_desc = c(def_ignore_desc)
}

## instruction is not clear. too many actions
## respondents got confused (create or not create a folder to organize??)

if (item_code == "U01b000S") {
sub_str = rbind(
  c("(.*)\\*\\$target=u01b_(.*)","\\1\\2"),
  c("id=u01b_",  ""),
  def_sub_str)
ignore_desc = c(def_ignore_desc)
}

## instruction is not clear. too many actions
## respondents got confused (create or not create a folder to organize??)
if (item_code == "U03a000S") {
sub_str = rbind(
  c("(.*)\\*\\$target=u03a_(.*)","\\1\\2"),
  c("id=u03a_",  ""),
  c("id=u04a_",  ""),
  def_sub_str)
ignore_desc = c(def_ignore_desc)
}

if (item_code == "U06a000S") {
sub_str = rbind(
  c("(.*)\\*\\$target=u06a_(.*)","\\1\\2"),
  c("id=u03a_",  ""),
  c("id=u04a_",  ""),
  c("id=u06a_",  ""),
  def_sub_str)
ignore_desc = c(def_ignore_desc)
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
  ## c("(.*)\\*\\$target=u021_(.*)","\\1\\2"),
  c("TEST_TIME=(.+)",""),
  c("id=u021_", ""),
  c("id=",""),
  c("\\*\\$target=_", "target="),
  c("\\*\\$value=", "value="),
  c("\\*\\$index=", "index="),
  c("\\*\\$href=", "href="),
  c("\\*\\$", ""),
  c("\"", ""),
  c("\\|","\\.")
  )
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
  c("(.*)\\*\\$target=u19a_(.*)","\\1\\2"),
  c("id=u03a_",  ""),
  c("id=u04a_",  ""),
  c("id=u06a_",  ""),
  c("id=u19a_",  ""),
  def_sub_str)
ignore_desc = c(def_ignore_desc)
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
  c("(.*)\\*\\$target=u07_(.*)","\\1\\2"),
  c("TEST_TIME=(.+)",""),
  c("id=u07_",  ""),
  c("id=",""),
  c("\\*\\$target=_", "target="),
  c("\\*\\$value=", "value="),
  c("\\*\\$index=", "index="),
  c("\\*\\$href=", "href="),
  c("\\*\\$", ""),
  c("\"", ""),
  c("\\|","\\."))
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
  c("(.*)\\*\\$target=u02_(.*)","\\1\\2"),
  c("id=u02_",  ""),
  def_sub_str)
ignore_desc = c(def_ignore_desc)
}

if (item_code == "U11b000S") {
sub_str = rbind(
  c("(.*)\\*\\$target=u11b_(.*)","\\1\\2"),
  c("id=u11b_",  ""),
  def_sub_str)
ignore_desc = c(def_ignore_desc)
}

if (item_code == "U23x000S") {
sub_str = rbind(
  c("(.*)\\*\\$target=u23_(.*)","\\1\\2"),
  c("id=u23_",  ""),
  def_sub_str)
ignore_desc = c(def_ignore_desc)
}
