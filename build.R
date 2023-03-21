##### Setup ####################################################################
install.packages(c('vitae', 'blogdown', 'tinytex', 'knitr', 'rmarkdown', 'tidyverse'))
tinytex::install_tinytex()

##### Build the PDF version of the CV ##########################################
rmarkdown::render('Bryer_CV.Rmd')
unlink(list.files(".", pattern = "*.sty")) # Cleanup files copied from vitae

##### Build the Hugo/Blogdown site #############################################
options(blogdown.hugo.version = "0.54.0")
knitr::knit('config.Rmd', output = 'site/config.toml') # configuration file

# Run Hugo (note that the PDF cannot be built while Hugo is running!)
wd <- setwd('site')     # Blogdown will only work from current working directory
blogdown::build_site()  # Build site without running local server
blogdown::serve_site()  # Run local hugo server
setwd(wd)               # Reset the working directory
blogdown::stop_server() # Stop the hugo server
