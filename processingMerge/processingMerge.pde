import oscP5.*;
import netP5.*;

OscP5 oscP5;
OscP5 oscP51;
NetAddress dest;


float p1 = 0.5;
float p2 = 0.5;
float p3 = 0.5;
float p4 = 0.5;
float p5 = 0.5;
float p6 = 0.5;

void setup() {
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,6448);
  dest = new NetAddress("localhost",7000);
}
 /* recieves inputs from two programs*/
void oscEvent(OscMessage theOscMessage) {
 if (theOscMessage.checkAddrPattern("/wek/inputs")==true) {
     if(theOscMessage.checkTypetag("ffffff")) { //Now looking for 2 parameters
        p1 = theOscMessage.get(0).floatValue(); //get first parameter
        p2 = theOscMessage.get(1).floatValue(); 
        p3 = theOscMessage.get(2).floatValue(); 
        p4 = theOscMessage.get(3).floatValue(); //get 2nd parameter
        p5 = theOscMessage.get(4).floatValue();
        p6 = theOscMessage.get(5).floatValue();

        println("Received new params value from Wekinator");  
      } else {
        println("Error: unexpected params type tag received by Processing");
      }
 }
}
 
void draw() {
   sendOsc();
}
 /* sends data to wekinator*/
void sendOsc() {
  OscMessage msg = new OscMessage("/wek/inputs");
  msg.add(p1); 
  msg.add(p2);
  msg.add(p3);
  msg.add(p4);
  msg.add(p5); 
  msg.add(p6);
  oscP5.send(msg, dest);

}