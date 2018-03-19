///////////////////////////////////////////////////////
////  ----------- PROCESSING SCREEN : INIT ----------- 
///////////////////////////////////////////////////////
void initProcessing(){
  //size(640,480,P3D);
  size(640,480,OPENGL);
  textMode(SCREEN);
  frameRate(rate); 
}

///////////////////////////////////////////////////////
////  ----------- FONTS : INIT ----------- 
///////////////////////////////////////////////////////
void initFonts(){
  titleFont = loadFont("fonts/Serif-28.vlw"); 
  creditsFont = loadFont("fonts/Serif-20.vlw"); 
}

///////////////////////////////////////////////////////
////  ----------- TITLE SCREEN : INIT ----------- 
///////////////////////////////////////////////////////
void initTitleScreen(){
  //init title screen
  titleScreen = new TitleScreen();
}
void initCreditsScreen(){
  //init title screen
  creditsScreen = new CreditsScreen();
}

///////////////////////////////////////////////////////
////  -----------  PHYSICS : INIT ----------- 
///////////////////////////////////////////////////////
void initPhysics(){
  physics = new VerletPhysics2D();
  physics.setDrag(0.05f);
  physics.setWorldBounds(new Rect(0, 0, width, height));
  // the NEW way to add gravity to the simulation, using behaviors
  physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.15f)));
}

///////////////////////////////////////////////////////
////   ----------- STRINGS : INIT ----------- 
///////////////////////////////////////////////////////
void initRopes(){
 for (int i = 0; i < ropesTotal; i++) {
   ropes.add(new Rope(physics, new Vec2D(),i));
  } 
}

////////////////////////////////////////////////////
////  ----------- SPOTS : INIT ----------- 
///////////////////////////////////////////////////////
void initSpots(){
  //e1 = new Esphera();
  //e2 = new Esphera();
  skin = loadImage("images/txture.jpg");
  noStroke();
}


////////////////////////////////////////////////////
////  ----------- SPOTS : INIT ----------- 
///////////////////////////////////////////////////////
void initMSAParticles(){
  
  //invWidth = 1.0f/width;
  //invHeight = 1.0f/height;
  //aspectRatio = width * invHeight;
  //aspectRatio2 = aspectRatio * aspectRatio;
  
  // create fluid and set options
  fluidSolver = new MSAFluidSolver2D((int)(FLUID_WIDTH), (int)(FLUID_WIDTH * height/width));
  fluidSolver.enableRGB(true).setFadeSpeed(0.003).setDeltaT(0.5).setVisc(0.0001);
  
  // create image to hold fluid picture
  imgFluid = createImage(fluidSolver.getWidth(), fluidSolver.getHeight(), RGB);
  
  
  // create particle system
  particleSystem = new ParticleSystem();

}

///////////////////////////////////////////////////////
////  ----------- KINECT AND CV : INIT ----------- 
///////////////////////////////////////////////////////
void initKinectCV(){
  kinect = new Kinect(this);
  kinect.start();
  kinect.enableDepth(true);
  // We don't need the grayscale image in this example
  // so this makes it more efficient
  kinect.processDepthImage(false);
  
  // Lookup table for all possible depth values (0 - 2047)
  for (int i = 0; i < depthLookUp.length; i++) {
    depthLookUp[i] = rawDepthToMeters(i);
  }

  cv = new OpenCV(this);
  cv.allocate(width,height);
}

///////////////////////////////////////////////////////
////  ----------- SOUND : INIT ----------- 
///////////////////////////////////////////////////////
void initSound(){
  minim = new Minim(this);
  //out = minim.getLineOut();
  sample1 = minim.loadSample("wav/10.wav", 2048); 
  sample2 = minim.loadSample("wav/ab_foursteps-1.wav", 2048); 
  sample3 = minim.loadSample("wav/ab_foursteps-2.wav", 2048); 
  sample4 = minim.loadSample("wav/ab_foursteps-3.wav", 2048); 
  sample5 = minim.loadSample("wav/ab_foursteps-4.wav", 2048); 
  sample6 = minim.loadSample("wav/CrackleAdjusting.wav", 2048); 
  sample7 = minim.loadSample("wav/CrackleCrunch.wav", 2048); 
  sample8 = minim.loadSample("wav/Crackles1.wav",2048); 
  sample9 = minim.loadSample("wav/STATIC-EMF_1.wav", 2048); 
  sample10 = minim.loadSample("wav/STATIC-EMF_2.wav", 2048); 
  sampleExplosion1 = minim.loadSample("wav/CrackleCrunch.wav", 2048); 
  sampleExplosion2 = minim.loadSample("wav/jh_elek808.wav", 2048); 
  
  
  sample1.setGain(soundGain);
  sample2.setGain(soundGain);
  sample3.setGain(soundGain);
  sample4.setGain(soundGain);
  sample5.setGain(soundGain);
  sample6.setGain(soundGain);
  sample7.setGain(soundGain);
  sample8.setGain(soundGain);
  sample9.setGain(soundGain);
  sample10.setGain(soundGain);
  
  
  //out.setVolume(1);
  
  //player1 = minim.loadFile("wav/TEDx.wav");
  //player1.play();
  //player2 = minim.loadFile("ambient2.mp3");
  //player3 = minim.loadFile("ambient3.mp3");
  //player4 = minim.loadFile("ambient4.mp3");
  //player5 = minim.loadFile("ambient5.mp3");
  //player1.loop();
  
}

void initSave(){
  
  // Create a new file in the sketch directory
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  int d = day();    // Values from 1 - 31
  int mo = month();  // Values from 1 - 12
  int y = year();   // 2003, 2004, 2005, etc.
  
  now = new String(y+""+mo+""+d+""+h+""+m+""+s+"");
  println("now = "+now);
  
  String saveName =  new String(now);
  output = createWriter("images/"+mode+"_frames_"+now+".xml");
  output.println("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
  output.println("<frames>");
}

