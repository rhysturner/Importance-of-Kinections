class CreditsScreen{
  
  String credCopy1 = "PARTICLE CLOUD KINECT EXAMPLE";
  String credCopy2 = "useing kinect code from Shiffman";
  String credCopy3 = "Copywright 2012";
  String credCopy4 = "Created with code in Processing by Rhys Turner (Aenigma).";
  
  int scrollY = 0;
  int frame = 0;
  int frames = 22 * rate;
  float a = 0.05;
  boolean alive = true;
  int a1,a2,a3 = 0;
  int scrollRate = 1;
 
 CreditsScreen(){
   alive = true;  
   //textFont(titleFont);
   //textFont(credFont); 
  }
 
 void update(){
   a1+=10;
   
  // println(a1);
   if(frame>=40){
     a2+=10;
   }
   
   if(frame>=80){
     a3+=10;
   }
   
   if(frame>=400){
     scrollY-=scrollRate;
   }
   
   /*
   textFont(titleFont);
   fill(255, a1);
   text(credCopy1, 100, scrollY+100, 400, 200, 0); 
    fill(0, 102, 153, a2);
    text(credCopy2, 100, scrollY+210, 400, 100, 0);
    fill(255, 0, 120, a3);
    text(credCopy3, 100, scrollY+320, 400, 100, 0);
    textFont(creditsFont);
    fill(255);
    text(credCopy4, 100, scrollY+480, 400, 800, 0); 
     */
   
   if(frame<frames){
      frame++;
   }else{
     /// kill(); end of show resart
   }
 }
 
 void kill(){
    alive = false;
  //clear it 
 }
 
}
