library(kableExtra)
library(tidyverse)
data(mtcars)

#just checking out the dataset 
head(mtcars)

#build the simplest table 
mtcars %>%
  kbl() 

#add some styling 
mtcars %>%
  kbl() %>%
  kable_styling()

#checking out all the different style formats 
mtcars %>%
  kbl() %>%
  kable_styling(full_width = F)

mtcars %>%
  kbl() %>%
  kable_paper(full_width = F)

mtcars %>%
  kbl() %>%
  kable_classic(full_width = F)

mtcars %>%
  kbl() %>%
  kable_classic_2(full_width = F)

mtcars %>%
  kbl() %>%
  kable_minimal(full_width = F)

mtcars %>%
  kbl() %>%
  kable_material(full_width = F)

mtcars %>%
  kbl() %>%
  kable_material_dark(full_width = F)
##################################Kable Functions##############################

#Simple edits to the table
#Can make alternative rows striped
mtcars %>%
  kbl() %>%
  kable_classic(full_width = F, "striped")

#change font size 
mtcars %>%
  kbl() %>%
  kable_classic(full_width = F, "striped", font = 8)



#Keep building a better table on top of the classic style 
#caption - adds a title 
#position - changes the position of the table 
  # options for position: left, center, right, float-right, float-left 
#fixed_thead - fixes header row as you scroll 
mtcars %>%
  kbl(caption = "Vehicle Characteristics") %>%
  kable_classic(full_width = F, "striped", position = "left", fixed_thead = T)


#can also change the background of the header row to make it easier to read
mtcars %>%
  kbl(caption = "Vehicle Characteristics") %>%
  kable_classic(full_width = F, "striped", position = "left", 
                fixed_thead = list(enabled = T, background = "lightblue"))



#Highlight certain rows of interest
#row_spec - allows you to highlight a row
mtcars %>%
  kbl(caption = "Vehicle Characteristics") %>%
  kable_classic(full_width = F, "striped") %>%
  row_spec(row = 3:5, bold = T)

#can set the color too
mtcars %>%
  kbl(caption = "Vehicle Characteristics") %>%
  kable_classic(full_width = F, "striped") %>%
  row_spec(row = 3:5, bold = T, color = "red", background = "yellow")

#can use the same function to set the angle of text 
mtcars %>%
  kbl(caption = "Vehicle Characteristics") %>%
  kable_classic(full_width = F, "striped") %>%
  row_spec(row = 3:5, bold = T, color = "red", background = "yellow") %>%
  row_spec(0, angle = -45)

#just another example of the options with row_spec
mtcars %>%
  kbl(caption = "Vehicle Characteristics") %>%
  kable_classic(full_width = F, "striped") %>%
  row_spec(1, bold = T) %>% 
  row_spec(2, italic = T) %>%
  row_spec(3, color = 'white', background = 'black') %>%
  row_spec(4, underline = T) %>% 
  row_spec(5, monospace = T) %>%
  row_spec(6:8, strikeout = T)


#Can do the same thing to columns with column_spec
mtcars %>%
  kbl(caption = "Vehicle Characteristics") %>%
  kable_classic(full_width = F, "striped") %>%
  column_spec(c(3,5,7), bold = T, background = "yellow")


#add_header_above allows you to group columns with headers 
mtcars %>%
  kbl(caption = "Vehicle Characteristics") %>%
  kable_classic(full_width = F, "striped", position = "left") %>%
  add_header_above(c("Car" = 1, "Engine" = 2, " " = 3, "Random" = 4, " " = 2))


#group_rows lets you do the same thing but with rows 
mtcars %>%
  kbl(caption = "Vehicle Characteristics") %>%
  kable_classic(full_width = F, "striped", position = "left") %>%
  pack_rows("Group A", 1, 5) %>%
  pack_rows("Group B", 6, 10)


#add_indent allows you to indent specific rows 
mtcars %>%
  kbl(caption = "Vehicle Characteristics") %>%
  kable_classic(full_width = F, "striped", position = "left") %>%
  add_indent(c(2,5,9))


#footnote allows to add footnotes
mtcars %>%
  kbl(caption = "Vehicle Characteristics") %>%
  kable_classic(full_width = F, "striped", position = "left") %>%
  footnote(general = "A random footnote")

#can add footnote but on the same line as the note 
mtcars %>%
  kbl(caption = "Vehicle Characteristics") %>%
  kable_classic(full_width = F, "striped", position = "left") %>%
  footnote(general = "A random footnote", 
         footnote_as_chunk = T, title_format = c("italic", "underline"))

#can add by number
mtcars %>%
  kbl(caption = "Vehicle Characteristics") %>%
  kable_classic(full_width = F, "striped", position = "left") %>%
  footnote(number = c("A random footnote", "another footnote"))

#can add by letter
mtcars %>%
  kbl(caption = "Vehicle Characteristics") %>%
  kable_classic(full_width = F, "striped", position = "left") %>%
  footnote(alphabet = c("A random footnote", "another footnote"))
  
#can add by symbol
mtcars %>%
  kbl(caption = "Vehicle Characteristics") %>%
  kable_classic(full_width = F, "striped", position = "left") %>%
  footnote(symbol = c("A random footnote", "another footnote"))
  

#Inline Plotting Tools (straight up stole these from the internet)
#can put boxplots, histograms, and point and line plots in a table 
  #default is that all plots have the same limits (axis range)
mpg_list <- split(mtcars$mpg, mtcars$cyl)
disp_list <- split(mtcars$disp, mtcars$cyl)
inline_plot <- data.frame(cyl = c(4, 6, 8), mpg_box = "", mpg_hist = "",
                          mpg_line1 = "", mpg_line2 = "",
                          mpg_points1 = "", mpg_points2 = "", mpg_poly = "")

inline_plot %>%
  kbl() %>%
  kable_paper(full_width = FALSE) %>%
  column_spec(2, image = spec_boxplot(mpg_list)) %>%
  column_spec(3, image = spec_hist(mpg_list)) %>%
  column_spec(4, image = spec_plot(mpg_list, same_lim = TRUE)) %>%
  column_spec(5, image = spec_plot(mpg_list, same_lim = FALSE)) %>%
  column_spec(6, image = spec_plot(mpg_list, type = "p")) %>%
  column_spec(7, image = spec_plot(mpg_list, disp_list, type = "p")) %>%
  column_spec(8, image = spec_plot(mpg_list, polymin = 5))


#spec_pointrange is designed for forest plots in regression tables 
coef_table <- data.frame(
  Variables = c("var 1", "var 2", "var 3"),
  Coefficients = c(1.6, 0.2, -2.0),
  Conf.Lower = c(1.3, -0.4, -2.5),
  Conf.Higher = c(1.9, 0.6, -1.4)) 

data.frame(
  Variable = coef_table$Variables,
  Visualization = "") %>%
  kbl() %>%
  kable_classic(full_width = FALSE) %>%
  column_spec(2, image = spec_pointrange(
    x = coef_table$Coefficients, 
    xmin = coef_table$Conf.Lower, 
    xmax = coef_table$Conf.Higher, 
    vline = 0))







#a final table  
mtcars %>%
  select(mpg, cyl, hp, gear) %>%
  filter(cyl == 8) %>%
  arrange(desc(mpg)) %>%
  kbl(caption = "8 Cylinder Cars") %>%
  kable_classic(full_width = F, "striped") %>%
  row_spec(c(5, 9, 10, 11, 12, 13, 14), bold = T) %>%
  add_header_above(c("","Engine Characteristics" = 3, "")) %>%
  add_indent(c(3, 4, 7)) %>%
  footnote(general = "A random footnote", 
    footnote_as_chunk = T, title_format = c("italic", "underline"))



#Useful Website Links 
https://cran.r-project.org/web/packages/kableExtra/vignettes/awesome_table_in_html.html
https://www.rdocumentation.org/packages/kableExtra/versions/1.3.4
https://bookdown.org/yihui/rmarkdown-cookbook/kableextra.html

#############################Build Your Own Table###############################

data("starwars")








