import processing.serial.*;
 
Serial myPort;
 
int val=0;
 
void setup()
{
  println(Serial.list());
 
  String portName = Serial.list()[1];
 
  myPort = new Serial(this, portName, 11520);
 
}
 
 
 
void draw(){
  if ( myPort.available() > 0) {  
 
    val = myPort.read(); 
 
   println(val);
 
  delay(100); 
 
  }
 
}

