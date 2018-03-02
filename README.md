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

## Problem-solving approach

### Sensors
We used two micro:bits and their accompanying acceleramators to measure the movement over time of a user's arm and wrist through space. The micro:bits are both
cheap and well-documented, making them a perfect candidate for a prototype such as this one. They are also very robust, which make them ideal for application in 
the athletic world. 

### Feature extractor approach
As part of our feature extraction, we adjusted the provided Wekinator examples to extract only the data provided by the acceleramator and forward it on to
a custom python OSC message merger, which then took messages from both devices and passed them onto Wekinator. 

### ML model structure
Considering this project is focused on construting a dynamic time warping-based system, that is the overall model we used. In order to make our model as robust
as possible, we used training examples moving at several different speeds. 

## Improvements
While we originally intended our project to pass data to the model via BlueTooth, the doumentation and tools we encountered were sparse and we were unable to 
build a BlueTooth communication system that worked well enough to provide consistent, accurate data to Wekinator and the model we trained for it. Therefore,
we were forced to use long micro-usb cable as our primary form of communication between the micro:bit and the model. Future groups with more time
may want to incorporate wireless tracking via BlueTooth into the system. 

## Demo video

