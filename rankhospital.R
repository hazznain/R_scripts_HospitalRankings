rankhospital <- function(state, outcome, num="best"){
        
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", header=TRUE, sep=",")
        data <- data[,c(2,7,11,17,23)]
        colnames(data)[1:5]<- c("hospital","state","heart_attack","heart_failure","Pneumonia" )
        #outcome_list <-data.frame(out=c("heart attack","heart failure","pneumonia"))
        outcome_list <- c("heart attack","heart failure","pneumonia")
        
        ## Check that state and outcome are valid
        if(is.element(state,data$state)==FALSE){
                stop("Invalid state")
        }
        
        if(is.element(outcome,outcome_list)==FALSE) {
                stop("Invalid Outcome")   
                
        } 
        if(is.element(state,data$state)==TRUE & is.element(outcome,outcome_list)==TRUE )   
                
        {
                #options(warn=-1)
                data <- data[grep(state,data$state),]
                # data$heart_failure <- NULL
                #data$Pneumonia <- NULL
                data$heart_attack <- as.double(as.character(data$heart_attack))
                data$heart_failure <- as.double(as.character(data$heart_failure))
                data$Pneumonia <- as.double(as.character(data$Pneumonia))
                
                if(outcome=="heart attack"){
                        data <- data[complete.cases(data[,3]),]
                        #data <- data[which.min(data[,3]), ]
                        data$heart_failure <- NULL
                        data$Pneumonia <- NULL
                        colnames(data)[3] <- "rating"
                        data <- data[with(data, order(data$rating, data$hospital)), ]
                        
                }
                if(outcome=="heart failure"){
                        data <- data[complete.cases(data[,4]),]
                        #data <- data[which.min(data[,4]), ]
                        data$heart_attack <- NULL
                        data$Pneumonia <- NULL
                        colnames(data)[3] <- "rating"
                        data <- data[with(data, order(data$rating, data$hospital)), ]
                        
                }
                if(outcome=="pneumonia"){
                        data <- data[complete.cases(data[,5]),]
                        #data <- data[which.min(data[,5]), ]
                        data$heart_attack <- NULL
                        data$heart_failure <- NULL
                        colnames(data)[3] <- "rating"
                        data <- data[with(data, order(data$rating, data$hospital)), ]
                }
                
                
                #data <- data[complete.cases(data[,3]),]
                #data <- data[min(data$heart_attack,),]
                #ifelse(outcome=="heart attack",data <- data[min(as.numeric(data$heart_attack),na.rm=TRUE),],
                #      ifelse("heart failure", data <- data[min(as.numeric(data$heart_failure),na.rm=TRUE),],
                #            data[min(as.numeric(data$Pneumonia),na.rm=TRUE),]
                #           )
                #   )
        }
        
        
        #data <- as.character(data$hospital)
        #sort(data)
        #data <- head(data,1)
        if (num == "best") { num = 1}
        if (num == "worst") { num = nrow(data)}
        
        if(num>0 & num <= nrow(data)){
                data <- cbind(data, "ranking"=1:nrow(data))
                data <- as.character(data[num,1])
        }
        else data <- "NA"
        
        head(data)           
        
}
