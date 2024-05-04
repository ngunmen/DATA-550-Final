# Makefile content
report.html: Report.Rmd code/Render_Report.R
	Rscript code/Render_Report.R

install:
	Rscript -e 'renv::restore(prompt=FALSE)'

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f report.html

# Define variables
PROJECTFILES = Report.rmd data/load_ocddata.R code/01_make_output.R 02_make_output.R code/Render_Report.R Makefile
RENVFILES = renv.lock renv/activate.R renv/settings.json

project_image: dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t ngunmen/project .
	touch $@


#Rule to run container
final_report/report.html: 
	docker run -v $(pwd)/final_report:/finalproject/final_report ngunmen/project:latest

	



