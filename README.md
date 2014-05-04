HospitalRankings Scripts for Data Analysis in R 
===============================================

R scripts for ranking hospitals and extracting rank information on basis of one month mortality rates for specific conditions.

## Running the script:

1.  clone this repo using following in gitbash / terminal.   

	`git clone https://github.com/hazznain/R_scripts_HospitalRankings.git`
	
	the .pdf file in the downloaded package have the details of the data.
	
2.	Download the data using following link into cloned repo directory and uncompress so that the extracted .csv files are in same directory as the script files (cloned directory)   

	https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2FProgAssignment3-data.zip     
	the zip file contains three files   
	* outcome-of-care-measures.csv: Contains information about 30-day mortality and readmission rates 	for heart attacks, heart failure, and pneumonia for over 4,000 hospitals.
	* hospital-data.csv: Contains information about each hospital.
	* Hospital_Revised_Flatfiles.pdf: Descriptions of the variables in each file (i.e the code book).    
	A description of the variables in each of the files is in the included PDF file named Hospital_Revised_Flatfiles.pdf.     
	This document contains information about many other files that are not required for these scripts. You will want to focus on the variables for Number 19 (\Outcome of Care Measures.csv") and
	Number 11 (\Hospital Data.csv").    
	

3.	Open R or R studio and set working directory to cloned repo directory using following within the console.  
	
	`setwd("<Path to cloned repo directory on your system>")`
	
4.  Optional step : If you have not already installed "plyr", "sqldf" and "reshape2" packages in R then install them using .  

	`install.packages("reshape2")`  
	`install.packages("plyr")`  
	`install.packages("sqldf")`  
	
5.	Run the script using following command in R / R studio. n case of successful run script prompts the location of generated 2 x result files i.e Tidy data for Task1:4 and averages data for Task5.   , , 

	`source("<best.R>")` 
	`source("<rankhospital.R>")`
	`source("<rankall.R>")`
