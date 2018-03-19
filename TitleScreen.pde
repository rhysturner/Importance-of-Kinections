class TitleScreen{
    
  String introCopy1 = "KINECT PARTICLE CLOUD";
  String introCopy2 = "forked from Importance of Kinnections";
  String introCopy3 = "based on Shiffmans Kinect example";
  
  int frame = 0;
  int frames = 22 * rate;
  float a = 0.0;
  boolean alive = true;
  int a1,a2,a3 = 0;
 
 TitleScreen(){
   alive = true;  
   textFont(titleFont); 
  }
 
 void update(){
   a1+=10;
   
  // println("frame:"+frame);
   if(frame>=40){
     a2+=10;
   }
   
   if(frame>=80){
     a3+=10;
   }
   
   if(frame>=400){
     //ball.x += (target - ball.x) *.5
     a += 10;  
     //println("rot"+a);
   }
  
   
   fill(255, 255, 255,a1);
   //rotateX(2);
  //rotateY(2*2*PI);
  //rotateZ(2*2*PI);
   // rotateX(a);
   textFont(titleFont);
   text(introCopy1, 100, 100, 400, 200, 0); 
   fill(0, 102, 153, a2);
   text(introCopy2, 100, 210, 400, 100, 0);
   fill(255, 0, 120, a3);
   text(introCopy3, 100, 320, 400, 100, 0);
   fill(0,a);
   rect(0,0,width,height);
   
   if(frame<frames){
      frame++;
   }else{
      kill(); 
   }
 }
 
 void kill(){
    alive = false;
  //clear it 
 }
 
}
