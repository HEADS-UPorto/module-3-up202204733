load("output.rda")

# on github ubuntu_last, R 3.4.4
# db0922c555e27b6d310ff3d8d51236bb65a18583
# f6cdfb701ed014886f8ece52e70c0129f9d04ade

# on windows
# ed83a79f1a314e05e30dd1a553f041e4521b811f
# aa385cba6277dc6455c6f1ba303e9273603a7f25

if (identical(digest::sha1(data_frame), "db0922c555e27b6d310ff3d8d51236bb65a18583") &
  identical(digest::sha1(new_data), "f6cdfb701ed014886f8ece52e70c0129f9d04ade")) {
  message("The answer is correct!!!")
  quit(status = 0)
} else {
  message("The answer is wrong, try again.")
  quit(status = 1)
}
