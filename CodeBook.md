Changes to data names:
(none of these are case sensitive for the replacements)
all references to acc have been changed to "Accelerometer"
all references to gyro have been changed to "Gyroscope"
all references to bodybody have been changed to "Body"
all references to mag have been changed to "Magnitude"
all references to ^t have been changed to "Time"
all references to ^f have been changed to "Frequency"
all references to tbody have changed to "TimeBody"
all references to angle have been case corrected to "Angle"(to make the composite non spaced words easier to read)
all references to gravity have been replaced with "Gravity"(ditto)
from here on out the values are for the end of names
all references to -std() have been changed to "STD"
all references to -freq() have been changed to "Frequency"
Code Description:
all the code is opened in the first few lines, and are bound using rbind. this fufils the first step of the coursera guidelines
the code is then filtered so that only the standard deviations and means from the dataset are data. this fufils the second step of the guidelines
the code is then merged with the activities to lable the activities, fufilling the third step of the guidelines
the names are filtered as mentioned above to fufil step 4
the last 3 lines of code sort the code by the activity and subject, get the mean of the specified activities for each subject, then write the data to a txt file
