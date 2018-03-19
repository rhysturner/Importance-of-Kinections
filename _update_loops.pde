
///////////////////////////////////////////////////////
//// --------- titleScreenUpdate : LOOP -------
///////////////////////////////////////////////////////
void titleScreenUpdate(){
  if(titleScreen.alive){
    titleScreen.update();
    ////println(titleScreen.frame);
  }else{
    mode = 1;
    titleScreen = null;
  }
}
void creditsScreenUpdate(){
  if(creditsScreen.alive){
    creditsScreen.update();
    ////println(titleScreen.frame);
  }else{
    //mode = 1;
    creditsScreen = null;
  }
}

///////////////////////////////////////////////////////
//// --------- UPDATE : LOOP -------
///////////////////////////////////////////////////////
void update1(){
 update(); 
 updateCloud();
 //updateStrings();
 //MSA FLUID PARTICLE
 //drawParticlesEffects();
}

///////////////////////////////////////////////////////
//// --------- UPDATE : LOOP -------
///////////////////////////////////////////////////////
void update2(){
 //ropesCount = 1;
 update(); 
 updateCloud();
 //drawParticlesEffects();
 //updateStrings();
 //MSA FLUID PARTICLE
 
}

///////////////////////////////////////////////////////
//// --------- UPDATE : LOOP -------
///////////////////////////////////////////////////////
void update3(){
 //ropesCount = 10;
 update(); 
 updateCloud();
 updateStrings();
 //drawParticlesEffects();
}

///////////////////////////////////////////////////////
//// --------- UPDATE : LOOP -------
///////////////////////////////////////////////////////
void update4(){
 //update(); 
 
 coundDelay++;
 //if(coundDelay == 1*rate){
 if(!finalSoundPlayed){
   finalSoundPlayed = true;
   sampleExplosion1.trigger(); 
 }
 //print(" coundDelay : "+coundDelay);

  finalPhysics.update();
  
  for(Iterator i=finalPhysics.particles.iterator(); i.hasNext();) {
    VerletParticle2D p=(VerletParticle2D)i.next();
    point(p.x,p.y);
  }
   
}


void update(){
 
  
  
 settingsWin();
 background(0);
 
 
}

void updateCloud(){
  getPoints();
 pushMatrix();
 translate(width/2, height/2, 0);
 //// --------- DRAW MAIN LOW POINT CLOUD
 stroke(255);
 ////print("----- new low point cloud -----");
 int factor = 600;
 for(int i = 0; i < pointCloudLow.size();i++)  {
    PVector v = pointCloudLow.get(i);
    pushMatrix();
    translate(v.x*factor, v.y*factor, factor-v.z*factor);
    point(0,0);
    popMatrix(); 
 } 
 popMatrix();
}

void updateStrings(){
  //getBlobs();
  //// --------- use "hands" to mark hands with circles
  fill(200);
  noStroke();
  for(int i=0; i < hands.size(); i++){
    Point pt = hands.get(i);
    
    addForce(pt.x, pt.y, .001, .001);
    
    println("x:"+pt.x+" y:"+pt.y);
    
    pushMatrix();
    ////print(pt);
    //translate(pt.x*width, pt.y*height);    
    
    
    
    translate(pt.x*OUTPUT_W/w, pt.y*OUTPUT_H/h);
    float xpos = pt.x;
    float ypos = pt.y;
    
   
    //blobProximity = width;
    
    //addForce(pt.x, pt.y, head.getVelocity().x, head.getVelocity().y);
      //addForce(pt.x, pt.y, hvx, hvy);
     /// addForce(hx, hy, hvx, hvy);
    
    intensity = 1;
    
    //intensity = ((hands.get(0).x - hands.get(0).x)/width)*intensityMult;
    
    if(i==0){  
        //e1.render();
        fill(255,0,0);
        ellipse(0,0,5,5);
        //addForce(pt.x, pt.y, 1, 1);
        
        //head.set(pt.x, pt.y);
        //Vec2D velHead = head.getVelocity().getNormalizedTo(width);
        //Vec2D velHead = hands.get(0).getVelocity().getNormalizedTo(intensity);
        //float hx = hands.get(0).x;
        //float hy = hands.get(0).y;
        //float hvx = hx * speedMult;
        //float hvy = hy * speedMult;
        //println("hx"+hx+"hy"+hy+"hvx"+hvx+"hvy"+hvy);
        //println("pt.x"+pt.x+"pt.y"+pt.y+" hvx "+hvx);
        //addForce(pt.x, pt.y, head.getVelocity().x, head.getVelocity().y);
        
        //addForce(pt.x*OUTPUT_W/w, pt.y*OUTPUT_H/h, speedMult, speedMult);
     }else if(i==1){
        //e2.render();
        
        fill(255,0,0);
        ellipse(0,0,5,5);
        //addForce(pt.x, pt.y, 1, 1);
        
        //tail.set(pt.x, pt.y);
      //Vec2D velTail = hands.get(1).getVelocity().getNormalizedTo(intensity);
      //float tx = hands.get(1).x;
      //float ty = hands.get(1).y;
      //float tvx = tx * speedMult;
      //float tvy = ty * speedMult;
      //println("tx"+tx+"ty"+ty+"tvx"+tvx+"tvy"+tvy);
     // println("pt{"+pt.x+","+pt.y+"}"+"tail{"+tail.x+","+tail.y+"} tvx: "+tvx);
      //addForce(pt.x, pt.y, tail.getVelocity().x, tail.getVelocity().y);
      //addForce(pt.x*OUTPUT_W/w, pt.y*OUTPUT_H/h, speedMult, speedMult);
        
      }else{
        for (int j = 0; j < 10; j++) {
      } 
     // e1.reset();
     // e2.reset();
    }  
    popMatrix();
    // MAKE SOUND
    triggerSound();
  }
  
  
  //DRAW ROPES
 if(hands.size()>1){
   for (int j = 0; j < ropes.size(); j++) {
     if(j<ropesNum){
       PVector pt1 = new PVector(hands.get(0).x, hands.get(0).y, 0);
       PVector pt2 = new PVector(hands.get(1).x ,hands.get(1).y, 0);
       //ropes.get(j).updateHead(new Vec2D(pt1.x, pt1.y+(j*10)));
      // ropes.get(j).updateTail(new Vec2D(pt2.x, pt2.y+(j*-10)));
        
       ropes.get(j).updateHead(new Vec2D(pt1.x + j*-random(0,3), pt1.y + j*-random(0,3)));
       ropes.get(j).updateTail(new Vec2D(pt2.x + j*-random(0,3), pt2.y + j*-random(0,3)));
       
       blobProximity = getProximity(pt1.y, pt2.y);//absolute value of the two points
       
       //addForce(pt1.x, pt1.y, 1, 1);
       //addForce(pt2.x, pt2.y, 1, 1);
       
     }
    } 
  }else{
   blobProximity = width; 
  ///print("blobProximity "+blobProximity);
 }
 updatePhysics();
}

void updatePhysics(){
 //// --------- UPDATE PHYSICS
  physics.update(); 
}


///////////////////////////////////////////////////////
////  ----------- POINTS : LOOP ----------- 
///////////////////////////////////////////////////////
void getPoints(){
  int[] depth = kinect.getRawDepth();
// We're just going to calculate and draw every 10th pixel (equivalent of 60x48);
  pointCloudLow.clear();
  ////  ----------- POINTS : LOOP ----------- 
  for(int x=0; x<w; x+=cloudRes) {
    for(int y=0; y<h; y+=cloudRes) {
     int offset = w-x-1+y*w;
  // Convert kinect data to world xyz coordinate
      int rawDepth = depth[offset];
      if(rawDepth>minDist && rawDepth<maxDist){
          //PVector v = new PVector(x, y, rawDepth);
          PVector v = depthToWorld(x, y, rawDepth);
          pointCloudLow.add(v);
       }
    }
  }
  pointCloudHigh.clear();
  /// blob track ---
  for(int x=0; x<w; x++) {
    for(int y=0; y<h; y++) {
      int offset = w-x-1+y*w;
      int rawDepth = depth[offset];
      if(rawDepth>minDist && rawDepth<maxDist){
            PVector v = depthToWorld(x, y, rawDepth);
            pointCloudHigh.add(v);
            img.set(x,y,255); 
      }
    }
  }
  //------------------------- Blob extraction -----------------------------
  cv.copy(img);
  Blob[] blobs = cv.blobs(minBlobSize,maxBlobSize*2,5,false);
  //println(blobs.length);
  hands.clear();
  hands_rect.clear();
  //eList.clear();
  for(int i = 0; i < blobs.length; i++){
     //////println(blobs[i].area);
     BLOB_RECT = new Rect(blobs[i].rectangle.x, blobs[i].rectangle.y, blobs[i].rectangle.width, blobs[i].rectangle.height);
     BLOB_POINTS = blobs[i].points;
     BLOB_AREA = blobs[i].area;
     Point centroid = blobs[i].centroid;
     hands.add(centroid);    
     hands_rect.add(BLOB_RECT);
  }
  
  //save frame pointCloudLow, pointCloudHigh, blob;
  
  
}

void getPointsFinal(){
  ///finalFrameCount ++;
  pointCloudFinal.clear();
  int[] depth = kinect.getRawDepth();
  
  ////  ----------- POINTS : FINAL ----------- 
  for(int x=0; x<w; x+=cloudRes) {
    for(int y=0; y<h; y+=cloudRes) {
     int offset = w-x-1+y*w;
  // Convert kinect data to world xyz coordinate
      int rawDepth = depth[offset];
      if(rawDepth>minDist && rawDepth<maxDist){
          //PVector v = new PVector(x, y, rawDepth);
          PVector v = depthToWorld(x, y, rawDepth);
          pointCloudFinal.add(v);
       }
    }
  }
  //println("pointCloudFinal pointCloudFinal "+pointCloudFinal);
  finalPhysics = new VerletPhysics2D();
  finalPhysics.setWorldBounds(new Rect(0,0,width,height));
  finalPhysics.addBehavior(new GravityBehavior(new Vec2D(50, 0.15f)));
  //VerletParticle2D cent = new VerletParticle2D(width, height);
  //finalPhysics.addBehavior(new AttractionBehavior(cent, 250, 0.9f));
  //finalPhysics.addParticle(cent);
  for(int i=0; i<pointCloudFinal.size(); i++) {
    VerletParticle2D p = new VerletParticle2D((pointCloudFinal.get(i).x*300)+(width/2), (pointCloudFinal.get(i).y*300)+(height/2));
    finalPhysics.addBehavior(new AttractionBehavior(p, 20, -1.2f, 0.1f));
    finalPhysics.addParticle(p);
  }
  
  
}


///////////////////////////////////////////////////////
//// --------- STRINGS DRAW -----------
///////////////////////////////////////////////////////
void drawRopes(){
  stroke(255,255,255);
  noFill();
  //noStroke();
  beginShape();
  pushMatrix();
  translate(0,0);
  for(Iterator i = physics.particles.iterator(); i.hasNext();){
    VerletParticle2D p = (VerletParticle2D)i.next();
    vertex(p.x, p.y);
  }
  popMatrix();
  endShape();   
}

///////////////////////////////////////////////////////
//// --------- drawParticlesEffects -----------
///////////////////////////////////////////////////////
void drawParticlesEffects(){
  
  int numCells = fluidSolver.getNumCells();
  
  println("drawParticlesEffects numCells "+numCells);
  
  pushMatrix();
  translate(0,0);
  for(Iterator i = physics.particles.iterator(); i.hasNext();){
    VerletParticle2D p = (VerletParticle2D)i.next();
    vertex(p.x, p.y);
  }
  popMatrix();
  
  // fluid IMG UPDATE
  
  fluidSolver.update();

  //if(drawFluid) {
      for(int i=0; i<fluidSolver.getNumCells(); i++) {
          int d = 2;
          imgFluid.pixels[i] = color(fluidSolver.r[i] * d, fluidSolver.g[i] * d, fluidSolver.b[i] * d);
      }  
      imgFluid.updatePixels();//  fastblur(imgFluid, 2);
      image(imgFluid, 0, 0, width, height);
  //} 
  
  particleSystem.updateAndDraw();
  
}



// add force and dye to fluid, and create particles
void addForce(float x, float y, float dx, float dy) {
    float speed = dx * dx  + dy * dy * aspectRatio2;    // balance the x and y components of speed with the screen aspect ratio
    
    if(speed > 0) {
        if(x<0) x = 0; 
        else if(x>1) x = 1;
        if(y<0) y = 0; 
        else if(y>1) y = 1;

        float colorMult = 5;
        float velocityMult = 30.0f;

        int index = fluidSolver.getIndexForNormalizedPosition(x, y);

        color drawColor;

        colorMode(HSB, 360, 1, 1);
        float hue = ((x + y) * 180 + frameCount) % 360;
        drawColor = color(hue, 1, 1);
        colorMode(RGB, 1);  

        fluidSolver.rOld[index]  += red(drawColor) * colorMult;
        fluidSolver.gOld[index]  += green(drawColor) * colorMult;
        fluidSolver.bOld[index]  += blue(drawColor) * colorMult;

         particleSystem.addParticles(x , y , 10); 
        //particleSystem.addParticles(x * width, y * height, 10);
        fluidSolver.uOld[index] += dx * velocityMult;
        fluidSolver.vOld[index] += dy * velocityMult;
    }
}
  

///////////////////////////////////////////////////////
//// snapToPhysics
///////////////////////////////////////////////////////
void snapToPhysics(){
  //TODO: Snap shot points position 
  //stop video loop and apply physics 
}



///////////////////////////////////////////////////////
//// save img
///////////////////////////////////////////////////////
void startRec(){
  if( RECORDING ){
    //RECORDING = true;
    if(!saveStarted){
      saveStarted = true;
      ///initSave();
      saveCount ++;
    }
  
  //mm.addFrame();
  
  //println("save pointCloudLow: "+pointCloudLow.get(0));
  //println("save pointCloudHigh: "+pointCloudHigh.get(0));
  //println("save hands: "+hands.get(0));
  /*
  output.println("<low>"+pointCloudLow+"</low>");
  output.println("<hight>"+pointCloudHigh+"</hight>");
  output.println("<hands>"+hands+"</hands>");
    */
  }
}

void stopRec(){
  if( RECORDING ){
    RECORDING = false;
    if(saveStarted){
      saveStarted = false;
      ///output.println("</frames>");
      ///output.flush(); // Write the remaining data
      ///output.close(); // Finish the file
      ///exit(); // Stop the program
      //mm.finish();  // Finish the movie if space bar is pressed!
    }
  }
}
///////////////////////////////////////////////////////
//// save img
///////////////////////////////////////////////////////
void saveImgSeq(){
  if( SAVING ){
    saveFrame( "img/image_" + saveCount + ".png" );
    saveCount ++;
  }
}

///////////////////////////////////////////////////////
//// SEWTTINGS WIN : LOOP
///////////////////////////////////////////////////////
void settingsWin(){
  if( SETTINGS ){
    fill(255, 100);
    noStroke();
    rect(0,0,width,100); 
    debug();     
  }
}


///////////////////////////////////////////////////////
//// DEBUG : LOOP
///////////////////////////////////////////////////////
void debug(){
 text("Kinect FR: " + (int)kinect.getDepthFPS()+" Processing FR: " + (int)frameRate+" Factor: "+factorAv+" h:"+h+" | w:"+w+" OUTPUT_H:"+OUTPUT_H+" | OUTPUT_W:"+OUTPUT_W
 +"\nBLOB_CENTOID:"+BLOB_CENTOID+"\nBLOB_RECT:"+BLOB_RECT+"\nBLOB_POINTS:"+BLOB_POINTS+"\nBLOB_AREA:"+BLOB_AREA+"\nBLOB_PIXELS:"+BLOB_PIXELS+" blobProximity "+blobProximity,10,16); 
}



void mousePressed() {
    drawFluid ^= true;
}


void mouseMoved() {
    float mouseNormX = mouseX * invWidth;
    float mouseNormY = mouseY * invHeight;
    float mouseVelX = (mouseX - pmouseX) * invWidth;
    float mouseVelY = (mouseY - pmouseY) * invHeight;

    addForce(mouseNormX, mouseNormY, mouseVelX, mouseVelY);
}

