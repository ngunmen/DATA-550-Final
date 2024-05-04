FROM rocker/r-ubuntu

#install `pandoc` and `vim` using RUN command
RUN apt-get update 
RUN apt-get install -y pandoc
RUN apt-get install -y vim 

# Set up project directory
RUN mkdir /finalproject
WORKDIR /finalproject

RUN mkdir data
RUN mkdir code
RUN mkdir output

COPY code code
COPY Makefile .
COPY Report.rmd .

COPY .Rprofile .
COPY renv.lock .
RUN mkdir renv
COPY renv/activate.R renv
COPY renv/settings.json renv

RUN Rscript -e "renv::restore(prompt = FALSE)"

RUN mkdir final_report 

CMD make && mv report.html final_report
