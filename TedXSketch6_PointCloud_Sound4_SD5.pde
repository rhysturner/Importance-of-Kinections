  // RHYS TURNER
// TedX Particle Could Interactions 2012
//  ----- notes ---- 
// IMPORT ARE IN IMPORT TAB
// PROPERTIES ARE IN PROPERTIES TAB



void setup() {
  initProcessing();
  initFonts();
  initTitleScreen(); 
  initCreditsScreen();  
  initSound();
  //mm = new MovieMaker(this, width, height, "tedX"+now+".mov", 30, MovieMaker.H263, MovieMaker.HIGH);
}

void draw() {
 
  currentFrame ++;
  //print(" currentFrame: "+currentFrame/rate);
  background(0);
  img = new PImage(width,height);
  fill(255);
  modeSwitch();
  //saveImgSeq();
  //startRec();
  //saveVideoSeq();
  
  //stage 2 sound @48 seconds
  //stage 3 sound @140 seconds
  //stage 4 sound @200 seconds
  if(PLAYBACK_MODE){
    if(currentFrame/rate==48){
      mode = 2;
    }
    if(currentFrame/rate==140){
      //mode = 3;
    }
    if(currentFrame/rate==200){
      //mode = 4;
    }
  }else{
    if(blobProximity<width && blobProximity>500){
      mode = 1;
    }
    if(blobProximity<500 && blobProximity>300){
      mode = 2;
    }
    if(blobProximity<300 && blobProximity>100){
     // mode = 3;
    }
    if(blobProximity<100 && blobProximity>0){
     // mode = 4;
    }
  }
  
}

void modeSwitch(){
  
//play.setVolume(0.5);
  switch(mode){
    case 0:
      //TITLE SCREEN LOOP
      if(!titleStarted){
        titleStarted = true;
        //kinectStarted = false;
        ropesStarted = false;
        moreRopesStarted = false;
        finalStarted = false;
        creditsStarted = false;
        println("mode:"+mode+" titleStarted "+titleStarted);
      }
      titleScreenUpdate();
      break;
      
    case 1:
      if(!kinectStarted){
        titleStarted = false;
        kinectStarted = true;
        ropesStarted = false;
        moreRopesStarted = false;
        finalStarted = false;
        creditsStarted = false;
        println("mode:"+mode+" kinectStarted "+kinectStarted);
        initKinectCV();
      }
      ropesNum = 1;
      update1();
      break;
   
    case 2:
      if(!ropesStarted){
        titleStarted = false;
        //kinectStarted = false;
        ropesStarted = true;
        moreRopesStarted = false;
        creditsStarted = false;
        finalStarted = false;
         println("mode:"+mode+" initMSAParticles "+ropesStarted);
        initPhysics();  
        //initRopes();     
        initSpots();
        initMSAParticles();
        playSoundRate = 20;
      }
      ropesNum = 1;
      update2();
      break;
    
    case 3:
     if(!moreRopesStarted){
      titleStarted = false;
     // kinectStarted = false;
      ropesStarted = false;
      moreRopesStarted = true;
      creditsStarted = false;
      finalStarted = false;
      println("mode:"+mode+" stage 3");
      playSoundRate = 5;
      ropesNum = 10;
     }
      update3();
      break;
    
    case 4:
      //EXPLODE
      if(!finalStarted){
        titleStarted = false;
        //kinectStarted = false;
        ropesStarted = false;
        moreRopesStarted = false;
        creditsStarted = false;
        finalStarted = true;
        println("mode:"+mode+" finalStarted "+finalStarted);
       
        getPointsFinal();
        sampleExplosion2.trigger();
      }
       update4();
      break;
      
    case 5:
      //CREDIT SCREEN LOOP
      if(!creditsStarted){
        creditsStarted = true;
        titleStarted = false;
        ropesStarted = false;
        moreRopesStarted = false;
        finalStarted = true;
        println("mode:"+mode+" creditsStarted "+creditsStarted);
      }
      creditsScreenUpdate();
      break;
  } 
}

