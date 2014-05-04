rankall <- function(outcome, num="best"){
        
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", header=TRUE, sep=",")
        data <- data[,c(2,7,11,17,23)]
        colnames(data)[1:5]<- c("hospital","state","heart_attack","heart_failure","Pneumonia" )
        #data$hospital <- as.character(data$hospital)
        data <- data.frame(lapply(data, as.character), stringsAsFactors=FALSE)
        #outcome_list <-data.frame(out=c("heart attack","heart failure","pneumonia"))
       outcome_list <- c("heart attack","heart failure","pneumonia")
        
        ## Check that state and outcome are valid
        
        
        if(is.element(outcome,outcome_list)==FALSE) {
                stop("Invalid Outcome")   
                
        } 
        if(is.element(outcome,outcome_list)==TRUE )   
                
        {
                options(warn=-1)
                #data <- data[grep(state,data$state),]
                # data$heart_failure <- NULL
                #data$Pneumonia <- NULL
                data$heart_attack <- as.double(data$heart_attack)
                data$heart_failure <- as.double(data$heart_failure)
                data$Pneumonia <- as.double(data$Pneumonia)
               # data$hospital <- as.character(data$hospital)
               # data$hospital <- as.character(data$hospital)
                
                if(outcome=="heart attack"){
                        data <- data[complete.cases(data[,3]),]
                        #data <- data[which.min(data[,3]), ]
                        data$heart_failure <- NULL
                        data$Pneumonia <- NULL
                        colnames(data)[3] <- "rating"
                        data <- data[with(data, order(data$state,data$rating, data$hospital)), ]
                        
                }
                if(outcome=="heart failure"){
                        data <- data[complete.cases(data[,4]),]
                        #data <- data[which.min(data[,4]), ]
                        data$heart_attack <- NULL
                        data$Pneumonia <- NULL
                        colnames(data)[3] <- "rating"
                        data <- data[with(data, order(data$state,data$rating, data$hospital)), ]
                        
                }
                if(outcome=="pneumonia"){
                        data <- data[complete.cases(data[,5]),]
                        #data <- data[which.min(data[,5]), ]
                        data$heart_attack <- NULL
                        data$heart_failure <- NULL
                        colnames(data)[3] <- "rating"
                        data <- data[with(data, order(data$state,data$rating, data$hospital)), ]
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
        data <- ddply(data, "state", transform, ranking = seq_along(rating))
        
        if (num == "best") { num = 1}
       
        if (num == "worst") { 
                
                
                 s <- ddply(data,"state",transform, maxrank= max(ranking) )
                 ndf <- sqldf("select distinct state,maxrank from s" )
                 colnames(ndf)[2] <- "ranking"
                 #ndf <- ndf[with(ndf, order(ndf$state,ndf$maxrank)), ]
                 data <- merge(data,ndf,all=FALSE)
                 data <- data[,c(3,1)]
                 data <- data[with(data, order(data$state)), ]
           
        }
        
        if(num>0 & num <= max(data$ranking)){
                a=1
                s_list <- sqldf("select distinct state from data")
                list <- as.character(s_list$state)
                
                data <- data[data$ranking==num,1:2]
                
                dif <- setdiff(list,data$state)
                df <- matrix(, nrow = length(dif), ncol =ncol(data) ) 
                df <- data.frame(df)
                colnames(df)[1:ncol(data)] <- names(data)
                df$state <- dif
                data <- merge(data,df,all=TRUE)
                data <- data[with(data, order(data$state,data$hospital)), ]
                data <- as.data.frame(x=data)
                #df$state <- dif
                
        }
       if(num<0 & num > max(data$ranking)){ data <- "NA"}
        
        data      
        #num
}
