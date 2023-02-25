# Garmin-Recovery-Analysis-Project
# About 
This project combines two things I am very passionate about; fitness/health data and data analysis. I have loved my Garmin watch since getting it two years ago, my favorite feature is the health statistics and insight it gives you. These include heart rate, sleep, body battery (recovery), calories, steps, and so many more. I was curious to see which statistic impacts my recovery the most out of resting heart rate, sleep duration, and stress level. So I downloaded a bunch of data from Garmin and wrangled, cleaned, formatted, and explored the data. 
# Data Analysis Methodologies 
  - What is the problem you are trying to solve?
     I am trying to solve the problem of finding out which health stat impacts my recovery the most 
  - How can you use data to answer the questions 
    The data has all of the numbers, using a prediction and feature importance test, I can determine which stat is the most important. 
  - What data do you need to answer the questions?
    My health data from Garmin. 
  - Where is data coming from and how will you get it?
    This data is stored on the Garmin connect website in my account that is linked to my watch. I can download it from the website. 
  - Is the data collection representative of the problem to be solved?
    Yes, the data is directly related to the problem being solved. 
  - What additional work is required to manipulate and work with the data?
    The data will need to sorted, cleaned, and combined in order to work with it. 
  - In what way can the data be visualzied to get the answer that is required?
    The data can be displayed in different charts and tables. 
  - Does the model used really answer the original question?
    Yes, while it does have some limitations, the model used does produce important information that solves the problem. 
  - Can you put the model into practice?
    Yes, I can continue using the model in the future as I get more and more data. 
  - Can you get constructive feedback into answering the question?
    If someone were to look over the analysis done, there would definitely be opportunity for me to recieve constructive feedback. 
# Data Collection
  - The data was dowloaded into excel from the Garmin Connect website 
# Data Wrangling 
  - Excel 
    - Each stat was downloaded one by one into an excel sheet 
    - It was then cleaned by sorting it, removing any empty values and putting it into chronological order 
  - SQL 
    - First, I uploaded each table individually so there was a body battery, resting heart rate, sleep duration, and stress table 
    - Second, because the body battery table had multiple readings for each day, it was altered by adding a max_value column to get the highest reading from each day
    - Next, I created a view that encompassed the date, resting heart rate, max_value recovery, sleep duration, and stress level. 
    - That created a table that included all of the dduplicate dates from the body battery column
    - So, I created a new view that selected only the unique dates and that worked. 
  - Python 
    - The first thing done is python was checking for null values and dropping all of them 
    - Then, it was strip any trailing or leading white space from the titles   
    - Next, was the rename all of the columns and replace the spaces with _
    - I had to strip the 'hrs' and replace the ':' with '.' from the sleep duration column inorder to change the data type into an integer so the ML models could handle it
# Data Analysis 
   ## Excel 
     - I put the data into pivot tables 
   ## SQL 
    - 
   ## Python 
    ### Scatter Plots 
      -  After formatting and cleaning the data set, I plotted a scatter graph of each variable compared to the recovery score 
      - This gave a visualization of any linear relationship and a correlation score for each varaible 
    ### Multiple Linear Regression 
      - This is a machine learning algorithm that can be used to predict the relatinship between multiple independent variable and a dependent variable
      - I imported the necessary libraries for this 
      - Created a linear regression function 
      - Split the data into X and Y variables 
      - This yielded each independent variables coefficient, the Residual Sum of Squares, and the Variance score 
        - The coefficient and correlation scores showed that stress had a strong negative impact
        - The RSS score was quite high depicting that this model was not really a good fit for that data it was trained on 
        - The variance score showed that the data points were relatively close together and not too spread out 
     ### Feature Importance Model
      - Is a ML algorithm that calculates the level of importance each independent variable has on the dependent variable 
      - I split the data into X and Y variables 
      - Created a RandomForestRegressor and fitting the X and Y variables onto it 
      - Calculated the model importance of each variable 
      - plotted the values onto a horizontal bar graph 
