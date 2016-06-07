best <- function(state, outcome) {
        df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        possibleoutcomes <- c("heart attack", "heart failure", "pneumonia")

        df[, 11] <- as.numeric(df[, 11]) # heart attack
        df[, 17] <- as.numeric(df[, 17]) # heart failure
        df[, 23] <- as.numeric(df[, 23]) # pneumonia
        
        if (!(state%in%df$State))
                stop("invalid state")
        if (!(outcome%in%possibleoutcomes))
                stop("invalid outcome")
        
        if(outcome == "heart attack") {
                col_num <- 11
        } else if(outcome == "heart failure") {
                col_num <-17
        } else {
                col_num <- 23
        }
        
        state_subset <- subset(df, df[[7]]==state)
        outcome_arr <- state_subset[[col_num]]
        minvalue <- min(outcome_arr, na.rm = TRUE)
        indexofmin <- which(outcome_arr == minvalue)
        hosp_name <- state_subset[indexofmin, 2]
        return(hosp_name)
        
}