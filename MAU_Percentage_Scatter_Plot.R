install.packages("ggplot2")
install.packages("readxl")
install.packages("stringr")
install.packages("dplyr")
library(ggplot2)
library(readxl)
library(dplyr)
library(stringr)

#Choose specimen and repeat the process for each
specimen <- read_excel("/Users/kisa/downloads/Lab 7 Data.xlsx", sheet = "Сervus elaphus")
specimen <- read_excel("/Users/kisa/downloads/Lab 7 Data.xlsx", sheet = "Capra caucasica")
specimen <- read_excel("/Users/kisa/downloads/Lab 7 Data.xlsx", sheet = "Bison priscus")

specimen <- specimen %>%
  group_by(MAU_UP_Percentage, MAU_MP_Percentage) %>%
  mutate(Group = ifelse(n() > 3, str_wrap(paste(unique(Element), collapse = ", "), width = 40), 
                        paste(unique(Element), collapse = ", "))) %>%
  ungroup()
bright_colors <- c("#FF0000", "#FF1493", "#8A2BE2", "#32CD32", "#1E90FF", "#FF4500", 
                   "#FFD700", "#00CED1", "#9400D3", "#ADFF2F", "#DC143C", "#7FFF00")
shapes <- c(16, 17, 15, 18, 8, 3, 7, 4, 2, 9, 10, 12, 14, 6)
group_colors <- setNames(rep(bright_colors, length.out = length(unique(specimen$Group))), unique(specimen$Group))
group_shapes <- setNames(rep(shapes, length.out = length(unique(specimen$Group))), unique(specimen$Group))
group_levels <- unique(specimen$Group)
special_group <- group_levels[which.max(nchar(group_levels))]
group_levels <- c(setdiff(group_levels, special_group), special_group)
specimen$Group <- factor(specimen$Group, levels = group_levels)

plot_specimen <- ggplot(specimen, aes(x = MAU_UP_Percentage, y = MAU_MP_Percentage, color = Group, shape = Group)) +
  geom_point(size = 5, alpha = 0.9, stroke = 1.2) +  
  scale_color_manual(values = group_colors) +
  scale_shape_manual(values = group_shapes) +
  geom_abline(intercept = 0, slope = 1, linetype = "dashed", color = "red", linewidth = 1) + 
#Change title for each specimen: 1) Cervus elaphus; 2) Capra caucasica; 3) Bison priscus.
  labs(title = "%MAU Comparison for Capra caucasica",
       subtitle = "Lab 7 Station 6 Dauren Kissabayev",
       x = "Upper Paleolithic (%MAU)",
       y = "Middle Paleolithic (%MAU)",
       color = "Skeletal Elements",
       shape = "Skeletal Elements") +
  theme_minimal(base_size = 16) +
  theme(legend.position = "right",
        legend.title = element_text(size = 14, face = "bold"),
        legend.text = element_text(size = 10),
        plot.title = element_text(size = 18, face = "bold", hjust = 0.5),
        plot.subtitle = element_text(size = 14, hjust = 0.5),
        axis.title = element_text(face = "bold"),
        axis.text = element_text(size = 12))

#Save plot for each specimen
ggsave("cervus_plot.pdf", plot_specimen, width = 12, height = 8, dpi = 300)
ggsave("capra_plot.pdf", plot_specimen, width = 12, height = 8, dpi = 300)
ggsave("bison_plot.pdf", plot_specimen, width = 12, height = 8, dpi = 300)
