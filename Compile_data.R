#Takes the filepath, supplied by the user as a character string, and combines all the files in the folder into a large dataframe. The user has to ensure that all files have the same number of columns and names.
compiledata <- function(filepath){
  file_names <- list.files (path = filepath) #Create a list of the file names found in the folder
  file_count <- length(file_names) #Count the number of files found in the folder
  All_data <- data.frame() #Create an empty dataframe
  x <- 1 #Initiate temporary variable x

  #Import data from the files in the folder into a dataframe, by looping through the file names and assigning them to a dataframe name, data_x, before compiling all the data into a larger dataframe called All_data
  while(x <= file_count){
    y <- paste("data",as.character(x), sep = "_") #create temporary variable y, containing the string "data_x", where x is a number
    z <- assign(y, read.csv(file_names[x], header = TRUE, sep = "\t")) #Assign one of the file names to the newly created variable data_x
    All_data <- rbind(All_data, z) #Add each individual dataframe to a larger dataframe called All_data
    x <- (x + 1) #Increase increment in temporary variable x
  }
  write.table(All_data, file = "All_data.tsv", row.names = FALSE, sep= "\t") #Export data as a tab-separated file to the supplied filepath with the name All_data.tsv
}