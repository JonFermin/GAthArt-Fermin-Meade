# GAthArt-Fermin-Meade
A program which uses the micro:bit's acceleramator to detect certain types of boxing punches and combinations.   
Jon Fermin   
Jonathan Meade   
CSCI-4830   
Prof. Shapiro

## Goal
Our main audience for this project was athletes practicing and competing in boxing competitions. Our goal for this project was to use the acceleramator data 
from the micro:bit to analyze a user's punches as they follow along with provided instructions and provide feedback about their form and accuracy based on the
data gathered.
The basic output of the project was to classify the user's punches using dynamic time warping (DTW), and to display that with text. There were five classes to consider: Left Jab, Right Cross, Right Hook, Left Hook, and a Resting position

## Problem-solving approach

### Sensors
We used two micro:bits and their accompanying accelerometers to measure the movement over time of a user's arm and wrist through space. The micro:bits are both
cheap and well-documented, making them a perfect candidate for a prototype such as this one. They are also very robust, which make them ideal for application in 
the athletic world. 

### Feature extractor approach
The microbit takes accelerometer data, then pushes that data to a processing sketch developed by Rebecca Fiebrink. This sketch converts the microbit's data to OSC messages.  
We adjusted the Rebecca's processing sketch examples to extract only the data provided by the accelerometer and forward it on to
a custom python OSC message merger, which then took messages from both devices and passed them onto Wekinator. 

### ML model structure
Considering this project is focused on construting a dynamic time warping-based system, that is the overall model we used. In order to make our model as robust
as possible, we used training examples moving at several different speeds and included a resting state so that it would not assume that we were continuously punching. We made it compute as you punch, rather than after completing the motion, as we felt that the latency required to punch in combinations would be too great.

## Improvements
While we originally intended our project to pass data to the model via BlueTooth, the doumentation and tools we encountered were sparse and we were unable to 
build a BlueTooth communication system that worked well enough to provide consistent, accurate data to Wekinator and the model we trained for it. Therefore,
we were forced to use long micro-usb cable as our primary form of communication between the micro:bit and the model. Future groups with more time
may want to incorporate wireless tracking via BlueTooth into the system. 

## Demo video
Check out our demo video [here](https://www.youtube.com/watch?v=DeVUCPqEGzE&feature=youtu.be).
