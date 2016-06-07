rankhospital <- function(state, outcome, num = "best") {
        df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        possibleoutcomes <- c("heart attack", "heart failure", "pneumonia")
        
        if (!(state%in%df$State))
                stop("invalid state")
        
        if (!(outcome%in%possibleoutcomes))
                stop("invalid outcome")
        
        df[, 11] <- as.numeric(df[, 11]) # heart attack
        df[, 17] <- as.numeric(df[, 17]) # heart failure
        df[, 23] <- as.numeric(df[, 23]) # pneumonia
        
        if(outcome == "heart attack") {
                col_num <- 11
        } else if(outcome == "heart failure") {
                col_num <-17
        } else {
                col_num <- 23
        }
        
        
        state_subset <- subset(df, df[[7]]==state, c(col_num, Hospital.Name))
        head(state_subset)
        finallist <- state_subset[order(state_subset[, 1], state_subset$Hospital.Name), ]
        finallist2 <- finallist[complete.cases(finallist),]
        
        if(nrow(finallist2) < num && num != "worst" && num!= "best")
                return("NA")
        finallist3 <- cbind(1:nrow(finallist2), finallist2)
        colnames(finallist3)[1] <- "rank"
        head(finallist3)
        
        if(num == "best")
                num = 1
        if(num == "worst")
                num = nrow(finallist3)
        tail(finallist3)
        finalname <- finallist3[finallist3$rank == num, 3]
        finalname

}