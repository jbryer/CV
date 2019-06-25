# devtools::install_github("ndphillips/VisualResume")
source('VisualResume_function.R') # Downloaded from Github. Fixes issue with excluding interests parameter.

currentYear <- as.numeric(format(Sys.Date(), '%Y'))
timeline <- read.csv('VisualResume.csv', stringsAsFactors = FALSE)
timeline[is.na(timeline$end),]$end <- currentYear + 1

png('VisualResume.png', width = 1000, height = 600)
VisualResume(
	year.range = c(1997, currentYear + 1),
	year.steps = 1,
	titles.left = c("Jason M. Bryer, Ph.D.",
					"Email: jason@bryer.org",
					"Web: www.bryer.org"),
	titles.right = c("",
					 "Full CV: https://cv.bryer.org",
					 "Github: https://github.com/jbryer"),
	titles.left.cex = c(3, 2, 2),
	titles.right.cex = c(3, 2, 2),
	timeline.labels = c("", ""),
	timeline.cex = 1.1,
	timeline = timeline,
	milestones = data.frame(title = c("B.A.", "M.S.", "Ph.D."),
							sub = c("Mathematics", "Educational Psychology", "Educational Psychology"),
							year = c(1999, 2009, 2014)),
	events.cex = 1.4,
	events = data.frame(year = c(1999, 2001, 2014.1, 2014.5, 2015.9),
						title = c("Sister Noel Marie Cronin Award for excellence in Mathematics, The College of St Rose",
								  "Award for Outstanding Performance, MapInfo",
								  "Gates Foundation Grant",
								  "Started Albany R User Group",
								  "FIPSE FITW $3 million grant.")),
	# interests = list("Statistics" = c(rep("R", 10), rep("PSA", 5), rep("Visualization", 3)),
	# 				 "Education" = c(rep("Teaching", 10), rep("K12", 5), rep("DAACS", 30)),
	# 				 "Data Science" = c(rep("Experience", 4), rep("Hacking Skills", 2), rep("Math & Stats", 4))
	# 				 )
)
dev.off()
