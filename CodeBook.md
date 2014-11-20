
CODEBOOK
===============================================

Variables interpretation:
-----------------------------------------------

All variables are composed of 6 to 7 short elements describing the treatment done to it, except for the first two variables (subject and activity), that are single composed.

The elements that describe the variable are constructed in the following order:
	1. Method of aggregation by activity for each activity and each subject.
		- “ave” for average.
	2. Method of estimation of the signals done by the authors.
		- “mean” for mean
		- “stdd” for standard deviation
	3. Domain of the signals
		- “time” for time
		- “freq” for frequency
	4. Acceleration component of the sensor signal 
		- “body” for body acceleration
		- “grav” for gravity acceleration
	5.sensor signal
		- “acc” for accelerometer
		- “gyr” for gyroscope
	6. time derivation to obtain Jerk signals and the magnitude of the three dimensional signals. (if aplied)
		- “jerk” for jerk sginals.
		- “mag” for magnitude
		- “jerkmag” for both
	7. axis of the signal (if absent represent total signal)
		- “x” for x-axis
		- “y” for y-axis
		- “z” for z-axis
	

Data:
-----------------------------------------------

180 observations of 68 variables derived from the Human Activity Recognition Using Smartphones Dataset (version 1.0) using the run_analysis.R script and the method described in the README.md file.


Treatment:
-----------------------------------------------

Each variable where casted from the Human Activity Recognition Using Smartphones Dataset (version 1.0) averaging its values over each activity and each subject.


Variables:
-----------------------------------------------


	- “subject"
	- "activity"
	- "ave.mean.time.body.acc.x"
	- "ave.mean.time.body.acc.y"
	- "ave.mean.time.body.acc.z"
	- "ave.stdd.time.body.acc.x"
	- "ave.stdd.time.body.acc.y"
	- "ave.stdd.time.body.acc.z"
	- "ave.mean.time.grav.acc.x"
	- "ave.mean.time.grav.acc.y"
	- "ave.mean.time.grav.acc.z"
	- "ave.stdd.time.grav.acc.x"
	- "ave.stdd.time.grav.acc.y"
	- "ave.stdd.time.grav.acc.z"
	- "ave.mean.time.body.acc.jerk.x"
	- "ave.mean.time.body.acc.jerk.y"
	- "ave.mean.time.body.acc.jerk.z"
	- "ave.stdd.time.body.acc.jerk.x"
	- "ave.stdd.time.body.acc.jerk.y"
	- "ave.stdd.time.body.acc.jerk.z"
	- "ave.mean.time.body.gyr.x"
	- "ave.mean.time.body.gyr.y"
	- "ave.mean.time.body.gyr.z"
	- "ave.stdd.time.body.gyr.x"
	- "ave.stdd.time.body.gyr.y"
	- "ave.stdd.time.body.gyr.z"
	- "ave.mean.time.body.gyr.jerk.x"
	- "ave.mean.time.body.gyr.jerk.y"
	- "ave.mean.time.body.gyr.jerk.z"
	- "ave.stdd.time.body.gyr.jerk.x"
	- "ave.stdd.time.body.gyr.jerk.y"
	- "ave.stdd.time.body.gyr.jerk.z"
	- "ave.mean.time.body.acc.mag"
	- "ave.stdd.time.body.acc.mag"
	- "ave.mean.time.grav.acc.mag"
	- "ave.stdd.time.grav.acc.mag"
	- "ave.mean.time.body.acc.jerkmag"
	- "ave.stdd.time.body.acc.jerkmag"
	- "ave.mean.time.body.gyr.mag"
	- "ave.stdd.time.body.gyr.mag"
	- "ave.mean.time.body.gyr.jerkmag"
	- "ave.stdd.time.body.gyr.jerkmag"
	- "ave.mean.freq.body.acc.x"
	- "ave.mean.freq.body.acc.y"
	- "ave.mean.freq.body.acc.z"
	- "ave.stdd.freq.body.acc.x"
	- "ave.stdd.freq.body.acc.y"
	- "ave.stdd.freq.body.acc.z"
	- "ave.mean.freq.body.acc.jerk.x"
	- "ave.mean.freq.body.acc.jerk.y"
	- "ave.mean.freq.body.acc.jerk.z"
	- "ave.stdd.freq.body.acc.jerk.x"
	- "ave.stdd.freq.body.acc.jerk.y"
	- "ave.stdd.freq.body.acc.jerk.z"
	- "ave.mean.freq.body.gyr.x"
	- "ave.mean.freq.body.gyr.y"
	- "ave.mean.freq.body.gyr.z"
	- "ave.stdd.freq.body.gyr.x"
	- "ave.stdd.freq.body.gyr.y"
	- "ave.stdd.freq.body.gyr.z"
	- "ave.mean.freq.body.acc.mag"
	- "ave.stdd.freq.body.acc.mag"
	- "ave.mean.freq.body.acc.jerkmag"
	- "ave.stdd.freq.body.acc.jerkmag"
	- "ave.mean.freq.body.gyr.mag"
	- "ave.stdd.freq.body.gyr.mag"
	- "ave.mean.freq.body.gyr.jerkmag"
	- "ave.stdd.freq.body.gyr.jerkmag"


