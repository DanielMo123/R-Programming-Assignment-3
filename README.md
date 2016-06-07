# R-Programming-Assignment-3

### Best.R

Finds the best hospital in a specific state

Example input
best("TX", "heart attack")
output: "CYPRESS FAIRBANKS MEDICAL CENTER"

give the best hospital in TX for heart attack


### rankhospital.R

Ranks hospitals by outcome in state

Example input
rankhospital("TX", "heart failure", 4)
output: "DETAR HOSPITAL NAVARRO"

gives the 4th best hospital in TX for heart failure


### rankall.R

Ranks hospitals in all states

Example input
head(rankall("heart attack", 20), 10)
output: 

![alt tag](https://raw.githubusercontent.com/DanielMo123/R-Programming-Assignment-3/blob/master/Screen%20Shot%202016-06-07%20at%201.58.10%20PM.png)

lists the first 10 of the 20th ranked hospital for heart attack in each state
