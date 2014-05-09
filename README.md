HospitalRankings Scripts for Data Analysis in R 
===============================================

R scripts for ranking hospitals and extracting rank information on basis of one month mortality rates for specific conditions.

## Running the script:

1.  clone this repo using following in gitbash / terminal.   

	`git clone https://github.com/hazznain/R_scripts_HospitalRankings.git`
	
		
2.	Download the data using following link into cloned repo directory and uncompress so that the extracted .csv files are in same directory as the script files (cloned directory)   

	https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2FProgAssignment3-data.zip     
	the zip file contains three files   
	* outcome-of-care-measures.csv: Contains information about 30-day mortality and readmission rates 	for heart attacks, heart failure, and pneumonia for over 4,000 hospitals in all the states in USA.
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

	`source("best.R")`      
	`source("rankhospital.R")`    
	`source("rankall.R")`  

###Test Cases for "best.R"

> `source("best.R")`  
> `best("TX", "heart attack")`     
	[1] "CYPRESS FAIRBANKS MEDICAL CENTER"  
	
>`best("TX", "heart failure")`   
	[1] "FORT DUNCAN MEDICAL CENTER" 
   
> `best("MD", "heart attack")`    
	[1] "JOHNS HOPKINS HOSPITAL, THE" 
	
> `best("MD", "pneumonia")`   
	[1] "GREATER BALTIMORE MEDICAL CENTER" 
  
> `best("BB", "heart attack")`   
	Error in best("BB", "heart attack") : invalid state   
 
> `best("NY", "hert attack")`   
	Error in best("NY", "hert attack") : invalid outcome    


###Test Cases for "rankhospital.R"

> `source("rankhospital.R")`  

> `rankhospital("TX", "heart failure", 4)`  
	[1] "DETAR HOSPITAL NAVARRO"  

> `rankhospital("MD", "heart attack", "worst")`  
	[1] "HARFORD MEMORIAL HOSPITAL"   

> `rankhospital("MN", "heart attack", 5000)`  
	[1] NA  

###Test Cases for "rankhospital.R"

> `source("rankall.R")`  

> `head(rankall("heart attack", 20), 10)`  
	hospital state  
	 NA AK  
	 D W MCMILLAN MEMORIAL HOSPITAL AL   
	 ARKANSAS METHODIST MEDICAL CENTER AR   
	 JOHN C LINCOLN DEER VALLEY HOSPITAL AZ    
	 SHERMAN OAKS HOSPITAL CA    
	 SKY RIDGE MEDICAL CENTER CO   
	 MIDSTATE MEDICAL CENTER CT   
	 NA DC    
	 NA DE    
	 SOUTH FLORIDA BAPTIST HOSPITAL FL    
	> tail(rankall("pneumonia", "worst"), 3)   
	hospital state    
	 MAYO CLINIC HEALTH SYSTEM - NORTHLAND, INC WI   
	 PLATEAU MEDICAL CENTER WV    
	 NORTH BIG HORN HOSPITAL DISTRICT WY   

> `tail(rankall("heart failure"), 10)`   
	hospital state    
	 WELLMONT HAWKINS COUNTY MEMORIAL HOSPITAL TN    
	 FORT DUNCAN MEDICAL CENTER TX     
	 VA SALT LAKE CITY HEALTHCARE - GEORGE E. WAHLEN VA MEDICAL CENTER UT  

	  


