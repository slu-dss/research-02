# SLU Data Science Seminar
## Spring 2016, Seminar 02

### Seminar Overview

#### Notes on working in R Studio...
File directory: You can navigate to files in the lower right panel in R Studio.
	
	Review of what we did in Seminar 01:
	
		Make a number vector, a logical vector, and a character vector. 
			Name the vector (ex: numvec) put an arrow < and then c( to give a command.
				ex: numvec<-c(1,2,4) = assigned three values to a vector named numVec
				
		Once you have vectors, you can make them into a list. 
			Making a list: namelist <- list(name of your vectors)
			[screen shot 2] (http://imgur.com/FF00xhf)
			
#### New this week
Attributes: Once you have vectors or information in R, you can assign attributes. **attr ( )**
	You can use attributes to annotate your work. This is a good practice; the more you annotate your work the less time you have to spend trying to remember what you did!
	The following examples demonstrate how to add a label and a date.
		ex: attr(chrvec, "label")<-"data science seminar faculty" =attr(name of vector, "type of attribute you're assigning")<-"the label you are assigning"
		ex: attr(chrvec, "date")<-"created jan 19 2016"

	You can check the attributes by looking at the structure of a vector 
		ex: str(chrvec) = str(name of vector)
		
Factors: Factors are variables that R will code for. Here is a nice, descriptive [blog that explains factors] (http://www.r-bloggers.com/data-types-part-3-factors/).
	To make a factor: Create a new vector (ex:classyear).Then, assign factor levels to that vector. The levels are the different possible points, values, or responses. 
		ex: classfactor<-factor(classyear, levels=c("freshman", "sophomore", "junior", "senior", "MA", "PhD")) = We created a factor for the vector classyear with the levels "freshman", "sophmore", etc.
		[screen shot 3] (http://i.imgur.com/eK2LsfL.png)
		
	To generate a table of the data: table(name of the factor)
		ex: table(classfactor)
		[screen shot 4] (http://imgur.com/vYQbiY5)
		
Data frames: Data frames are like tables. The data you store in the columns of a data frame can be of various types (one column might be a numerical variable, another might be a factor, and a third might be a character variable). All columns have to be the same length (contain the same number of data items). Here are a few different explanations of the concept of data frames [Tutorial from R-Tutor] (http://www.r-tutor.com/r-introduction/data-frame) and [Tutorial from CCU] (http://ww2.coastal.edu/kingw/statistics/R-tutorials/dataframes.html) 
	You can combine vectors that have the same number of elements to create a data frame. 
	The example below is what we used to create our data frame. First we created two more vectors (chrvec and numvec, each of which contains 4 items).
		-ex:df<-data.frame(chrvec, logvec, numvec, classyear, stringsAsFactors = FALSE)
		[screen shot 6] (http://imgur.com/Hqkw8aA)  
		The data frame will appear in the top right section of the R Studio window.
		
		**Use StringsAsFactors = FALSE** This statement is used to keep string (character) data as strings. If you don't include this statement, they'll be converted to numbers.
		
A few more useful commands:
		View(df): Will give you a visual representation of the dataframe that you created. 
		[screen shot 7] (http://imgur.com/CKXKZVf)
		ls( ): Will show you everything that's in your workspace.
		

To save your code (or script), in R Studio: select FILE, NEW FILE, R SCRIPT. A new window will appear and you can copy and paste from the console into the new window and save it.
	
When you open an R Script file you can copy the script by placing your cursor on the line you want to copy (delete the arrow on the line and the space first) and press control + enter (Windows) or command + enter (Mac)





