textGrob_cribbage_board <- function(suit_colors = rep("black", 4)) {
    gp1 <- gpar(col = c(suit_colors[1], suit_colors[2]), fontsize = 32)
    gp2 <- gpar(col = c(suit_colors[3], suit_colors[4]), fontsize = 32)
    grobTree(textGrob(1:30, x = 0.5, y = 3:32, default.units = "in", gp = gp1),
             textGrob(31:60, x = 3.5, y = 32:3, default.units = "in", gp = gp1),
             textGrob(1:30, x = 5.5, y = 3:32, default.units = "in", gp = gp2),
             textGrob(31:60, x = 8.5, y = 32:3, default.units = "in", gp = gp2)
             )
}
