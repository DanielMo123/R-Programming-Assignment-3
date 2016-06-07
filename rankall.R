rankall <- function(outcome, num = "best") {
        df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

        possibleoutcomes <- c("heart attack", "heart failure", "pneumonia")

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
        y <- count(df, 'State')
        states <- y$State
        finaldata <- data.frame()
        for (i in 1:length(states)) {

                # count hospitals in each state
                if(y[i, 2] < num && num != "worst" && num!= "best") {
                        alldata <- data.frame()
                        hospitalname <- NA
                        statename <- states[i]
                        data <- c(statename, hospitalname)
                        alldata <- rbind(alldata, data)
                        colnames(alldata) <- c("State", "Hospital.Name")
                        finaldata<- rbind(finaldata, alldata)
                }
                else {
                        state_subset <- subset(df, df[[7]]==states[i], c(7, col_num, Hospital.Name))
                        finallist <- state_subset[order(state_subset[, 2], state_subset$Hospital.Name), ]
                        
                        finallist2 <- finallist[complete.cases(finallist),]
                        finallist3 <- cbind(1:nrow(finallist2), finallist2)
                        colnames(finallist3)[1] <- "rank"
                        
                        rankposition <- 1
                        if (num == "worst")
                                rankposition = nrow(finallist3)
                        if (num != "worst" && num != "best")
                                rankposition = num
                        
                        finalname <- finallist3[finallist3$rank == rankposition, c(2, 4)]
                        finaldata<- rbind(finaldata, finalname)
                }
        }
        colnames(finaldata) <- c("state", "hospital")
        finaldata
}