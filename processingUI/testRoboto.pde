import processing.serial.*;
 
Serial myPort;
 
int a=200;
int val=0;
void setup()
{
  println(Serial.list()); 
  myPort = new Serial(this, Serial.list()[0], 115200);
//myPort = new Serial(this, Serial.list()[0], 115200);
  myPort.buffer(1);
  size(400, 400);
  background(51);
//  noLoop();  // Makes draw() only run once

}
 
 
 
void draw()
{
  fill(a,0,0);
  //rect(0,0,width/4, height/2);
  rect(100,0,width/4, height/2);
  //rect(200,0,width/4, height/2);
  fill(150);
  rect(300,0,width/4, height/2);
  fill(197,0,0);
  rect(0,200,width/4, height/2);
  rect(100,200,width/4, height/2); 
  rect(200,200,width/4, height/2);
  fill(150);
  rect(300,200,width/4, height/2);
  //if ( myPort.available() > 0 ) 
  //    print(myPort.read());
 }

void mousePressed() {
   sendData(mouseAction());
 }

void sendData (char data) {  
     
    if ( myPort.available() > 0 )
    println("sending bluetooth: "+data);  
    myPort.write(data);  
}


char mouseAction() {
  char data='Q';
  if( mouseX > 0 && mouseX < 100){
   if( mouseY > 0 && mouseY < 200){
      println("square Unasigned");
  //  data="F"; 
   }
  }
  if( mouseX > 100 && mouseX < 200){
   if( mouseY > 0 && mouseY < 200){
    println("square Forward");
    data='A'; //debería ser data='W'; 
   }
  }
  if( mouseX > 200 && mouseX < 300){
   if( mouseY > 0 && mouseY < 200){
    println("square Unasigned");
   }
  }
  if( mouseX > 300 && mouseX < 400){
   if( mouseY > 0 && mouseY < 200){
     println("square +");
      data='+'; 
   }
  }
  if( mouseX > 0 && mouseX < 100){
   if( mouseY > 200 && mouseY < 400){
    println("square Left");
    data='W'; //debería ser A
   }
  }
  if( mouseX > 100 && mouseX < 200){
   if( mouseY > 200 && mouseY < 400){
    println("square Back");
    //data='S';
    data='D'; //S
   }
  }
  if( mouseX > 200 && mouseX < 300){
   if( mouseY > 200 && mouseY < 400){
    println("square Right");
    data='S'; //D
  }
  }
  if( mouseX > 300 && mouseX < 400){
   if( mouseY > 200 && mouseY < 400){
    println("square -");
    data='-'; 
   }
  }

  return data;
}

