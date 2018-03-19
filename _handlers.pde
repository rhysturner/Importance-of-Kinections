float getProximity(float p1y, float p2y){
  return abs(p1y - p2y);
}

///////////////////////////////////////////////////////
//// -------- rawDepthToMeters : GETTER ----------
///////////////////////////////////////////////////////
// These functions come from: http://graphics.stanford.edu/~mdfisher/Kinect.html
float rawDepthToMeters(int depthValue) {
  if (depthValue < 2047) {
    return (float)(1.0 / ((double)(depthValue) * -0.0030711016 + 3.3309495161));
  }
  return 0.0f;
}
///////////////////////////////////////////////////////
//// -------- depthToWorld : GETTER --------------
///////////////////////////////////////////////////////
PVector depthToWorld(int x, int y, int depthValue) {

  final double fx_d = 1.0 / 5.9421434211923247e+02;
  final double fy_d = 1.0 / 5.9104053696870778e+02;
  final double cx_d = 3.3930780975300314e+02;
  final double cy_d = 2.4273913761751615e+02;

  PVector result = new PVector();
  double depth = depthLookUp[depthValue];//rawDepthToMeters(depthValue);
  result.x = (float)((x - cx_d) * depth * fx_d);
  result.y = (float)((y - cy_d) * depth * fy_d);
  result.z = (float)(depth);
  return result;
}

///////////////////////////////////////////////////////
//// ----------- stop : HANDLER -----------
///////////////////////////////////////////////////////
void stop() {
  kinect.quit();
  super.stop();
}

///////////////////////////////////////////////////////
//// ----------- keyPressed : HANDLER -----------
///////////////////////////////////////////////////////
void keyPressed() {
    switch(key) {
      case 'a'://increasse the max & min dist
        minDist+=5;
        maxDist+=5;
        println("a - minDist:"+minDist+" maxDist:"+maxDist);
        break;
      case 'z'://decrease max & min dist
        minDist-=5;
        maxDist-=5;
        println("z - minDist:"+minDist+" maxDist:"+maxDist);
        break;
      case 's'://decrease max & min dist
        minBlobSize+=100;
        println("s - minBlobSize:"+minBlobSize);
        break;
      case 'x'://decrease max & min dist
        minBlobSize-=100;
        println("x - minBlobSize:"+minBlobSize);
        break;
      case 'd'://decrease max & min dist
        maxBlobSize+=100;
        println("d - maxBlobSize:"+maxBlobSize);
        break;
      case 'c'://decrease max & min dist
        maxBlobSize-=100;
        println("c - maxBlobSize:"+maxBlobSize);
        break;  
      case 'i'://save img bool
        SAVING = !SAVING;
        println("i - SAVING:"+SAVING);
        break;
      case 'q'://settings bool
        SETTINGS = !SETTINGS;
        break;  
      case '0'://settings bool
        mode = 0;
        break; 
      case '1'://settings bool
        mode = 1;
        break; 
      case '2'://settings bool
        mode = 2;
        break; 
      case '3'://settings bool
        mode = 3;
        break; 
      case '4'://settings bool
        mode = 4;
        break; 
      case '5'://settings bool
        mode = 5;
        break;  
        
     case 'n'://save bool
       RECORDING = true;
       //startRec();
       println("startRec");
       break;
       
     case 'm'://stop bool
       stopRec();
       println("stopRec");
       break;
         
      
    }
}

///////////////////////////////////////////////////////
//// ---------- mousePressed : HANDLER -----------
///////////////////////////////////////////////////////
//void mousePressed() {
  //mousePos = new Vec2D(mouseX, mouseY);
  // create a new positive attraction force field around the mouse position (radius=250px)
 // mouseAttractor = new AttractionBehavior(mousePos, 250, 0.9f);
  //physics.addBehavior(mouseAttractor);
//}

///////////////////////////////////////////////////////
//// ----------- mouseDragged : HANDLER ----------- 
///////////////////////////////////////////////////////
//void mouseDragged() {
  // update mouse attraction focal point
  //mousePos.set(mouseX, mouseY);
//}

///////////////////////////////////////////////////////
////  ----------- mouseReleased : HANDLER ----------- 
///////////////////////////////////////////////////////
void mouseReleased() {
  // remove the mouse attraction when button has been released
  //physics.removeBehavior(mouseAttractor);
}
