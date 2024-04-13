report.html: Report.Rmd code/Render_Report.R
	Rscript code/Render_Report.R
  
install:
	Rscript -e 'renv::restore()' 
	
.PHONY: clean
clean:
	rm -f output/*.rds && rm -f report.html
