install.packages("ggplot2")
install.packages("tidyr")
library(ggplot2)
library(tidyr)

#First
data <- data.frame(
  Modification = c("Cut Marks", "Percussion Marks", "Tooth Marks", 
                   "Hammerstone Breaks", "Carnivore Breaks", "Post-Dep. Breaks"),
  MP = c(36.5, 18.8, 37.6, 18.8, 11.8, 10.6),
  UP = c(29.2, 10.2, 21.2, 9.5, 1.5, 5.8)
)

data_long <- pivot_longer(data, cols = c("MP", "UP"), 
                          names_to = "Period", values_to = "PercentNISP")

p <- ggplot(data_long, aes(x = Modification, y = PercentNISP, fill = Period)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Middle and Upper Paleolithic Bar Charts",
       subtitle = "Dauren Kissabayev ANT 440 Lab 10 Station 6",
       x = "Modification Type",
       y = "%NISP",
       fill = "Period") +
  scale_y_continuous(breaks = seq(0, 40, 5)) +
  theme_minimal() +
  theme(plot.title = element_text(face = "bold"),
        axis.text.x = element_text(angle = 25, hjust = 1))
ggsave("FirstBarChart.pdf", plot = p, width = 8, height = 6, units = "in", dpi = 300)

#Second
data <- data.frame(
  Species = c(
    "Bison priscus","Bison priscus","Bison priscus","Bison priscus","Bison priscus","Bison priscus",
    "Capra caucasica","Capra caucasica","Capra caucasica","Capra caucasica","Capra caucasica","Capra caucasica",
    "Cervus elaphus","Cervus elaphus","Cervus elaphus","Cervus elaphus","Cervus elaphus","Cervus elaphus"
  ),
  Modification = rep(
    c("Cut Marks","Percussion Marks","Tooth Marks","Hammerstone Breaks","Carnivore Breaks","Post-Dep. Breaks"), 
    3
  ),
  PercentNISP = c(
    56.0,24.0,32.0,24.0,0.0,4.0,
    42.9,35.7,46.4,35.7,0.0,7.1,
    15.6,0.0,34.4,0.0,31.2,18.8
  )
)

mp <- ggplot(data, aes(x = Modification, y = PercentNISP, fill = Species)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Middle Paleolithic Bar Chart",
       subtitle = "Dauren Kissabayev ANT 440 Lab 10 Station 6",
       x = "Modification Type",
       y = "%NISP",
       fill = "Species") +
  scale_y_continuous(breaks = seq(0, 60, 5)) +
  theme_minimal() +
  theme(plot.title = element_text(face = "bold"),
        axis.text.x = element_text(angle = 25, hjust = 1))
ggsave("SecondBarChart.pdf", plot = mp, width = 10, height = 6, units = "in", dpi = 300)

#Third
data <- data.frame(
  Species = c(
    "Bison priscus","Bison priscus","Bison priscus","Bison priscus","Bison priscus","Bison priscus",
    "Capra caucasica","Capra caucasica","Capra caucasica","Capra caucasica","Capra caucasica","Capra caucasica",
    "Cervus elaphus","Cervus elaphus","Cervus elaphus","Cervus elaphus","Cervus elaphus","Cervus elaphus"
  ),
  Modification = rep(
    c("Cut Marks","Percussion Marks","Tooth Marks","Hammerstone Breaks","Carnivore Breaks","Post-Dep. Breaks"), 
    3
  ),
  PercentNISP = c(
    11.8,5.9,52.9,0.0,0.0,0.0,
    38.0,16.0,26.0,16.0,0.0,4.0,
    27.1,7.1,10.0,7.1,2.9,8.6
  )
)

up <- ggplot(data, aes(x = Modification, y = PercentNISP, fill = Species)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Upper Paleolithic Bar Chart",
       subtitle = "Dauren Kissabayev ANT 440 Lab 10 Station 6",
       x = "Modification Type",
       y = "%NISP",
       fill = "Species") +
  scale_y_continuous(breaks = seq(0, 60, 5)) +
  theme_minimal() +
  theme(plot.title = element_text(face = "bold"),
    axis.text.x = element_text(angle = 25, hjust = 1))
ggsave("ThirdBarChart.pdf", plot = up, width = 10, height = 6, units = "in", dpi = 300)

