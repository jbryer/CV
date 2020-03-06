##### Setup
install.packages(c('vitae', 'blogdown'))
tinytex::install_tinytex()

# Build the configuration file
knitr::knit('config.Rmd', output = 'site/config.toml')

# Run Hugo (note that the CV cannot be built while Hugo is running!)
library(blogdown)
wd <- setwd('site')
blogdown::serve_site()
setwd(wd)
blogdown::stop_server()

# Cleanup
unlink(list.files(".", pattern = "*.sty"))
