run_analysis.R utilizes data containing the following information:

1. Inertial sensor data 
- Raw triaxial signals from the accelerometer and gyroscope of all the trials with with participants. 
- The labels of all the performed activities. 

2. Records of activity windows. Each one composed of: 
- A 561-feature vector with time and frequency domain variables. 
- Its associated activity label. 
- An identifier of the subject who carried out the experiment

These data sets were combined and filtered to create a data set that contains only mean and standard deviation features (66 of 561 features) for each activity and patient.

A table of averages was then created, calculating the mean for each filtered feature by subject and activity.

- Features are normalized and bounded within [-1,1].  
- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2). 
- The gyroscope units are rad/seg. 