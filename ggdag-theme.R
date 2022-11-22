library(tidyverse)
options(
  # set default colors in ggplot2 to colorblind-friendly 
  # Okabe-Ito and Viridis palettes
  ggplot2.discrete.colour = ggokabeito::palette_okabe_ito(),
  ggplot2.discrete.fill = ggokabeito::palette_okabe_ito(),
  ggplot2.continuous.colour = "viridis",
  ggplot2.continuous.fill = "viridis",
  # set theme font and size
  book.base_family = "sans",
  book.base_size = 14
)

# set default theme
theme_set(
  theme_minimal(
    base_size = getOption("book.base_size"), 
    base_family = getOption("book.base_family")
  ) %+replace% 
    theme(
      panel.grid.minor = element_blank(),
      legend.position = "bottom"
    )
)
theme_dag <- function() {
  ggdag::theme_dag(base_family = getOption("book.base_family"))
}
geom_dag_label_repel <- function(..., seed = 10) {
  ggdag::geom_dag_label_repel(
    aes(x, y, label = label),
    box.padding = 3.5, 
    inherit.aes = FALSE,
    max.overlaps = Inf, 
    family = getOption("book.base_family"),
    seed = seed,
    label.size = NA, 
    label.padding = 0.1,
    size = getOption("book.base_size") / 3,
    ...
  ) 
}

d <- read_csv("data/final_data.csv")
labels <- names(d)
names(labels) <- names(d)
