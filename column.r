vector1<- c(5,9,3)
vector2<- c(10,11,12,13,14,15)
column.names<- c("col1","col2","col3")
row.names<- c("ROW1","ROW3","ROW3")
matrix.names<- c("Matrix1","Matrix2")
result<- array(c(vector1,vector2),dim = c(3,3,2),dimnames = list(row.names,column.names,matrix.names))
print(result)


# Create the vectors for data frame.
height <- c(132,151,162,139,166,147,122)
weight <- c(48,49,66,53,67,52,40)
gender <- c("male","male","female","female","male","female","male")

# Create the data frame.
input_data <- data.frame(height,weight,gender)
print(input_data)

# Write filtered data into a new file.
write.csv(input_data,"output.csv")
newdata <- read.csv("output.csv")
print(newdata)