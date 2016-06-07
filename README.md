# R-Programming-Assignment-3

Best.R

Finds the best hospital in a specific state

Example input
best("TX", "heart attack")
output: "CYPRESS FAIRBANKS MEDICAL CENTER"

give the best hospital in TX for heart attack


rankhospital.R

Ranks hospitals by outcome in state

Example input
rankhospital("TX", "heart failure", 4)
output: "DETAR HOSPITAL NAVARRO"

gives the 4th best hospital in TX for heart failure


rankall.R

Ranks hospitals in all states

Example input
head(rankall("heart attack", 20), 10)
output: 

    hospital                              state
AK  <NA>                                  AK
AL  D W MCMILLAN MEMORIAL HOSPITAL        AL
AR  ARKANSAS METHODIST MEDICAL CENTER     AR
AZ  JOHN C LINCOLN DEER VALLEY HOSPITAL   AZ
CA  SHERMAN OAKS HOSPITAL                 CA
CO  SKY RIDGE MEDICAL CENTER              CO
CT  MIDSTATE MEDICAL CENTER               CT
DC  <NA>                                  DC
DE  <NA>                                  DE
FL  SOUTH FLORIDA BAPTIST HOSPITAL        FL

lists the first 10 of the 20th ranked hospital for heart attack in each state
