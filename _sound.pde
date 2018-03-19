///////////////////////////////////////////////////////
////  ----------- SOUND : TRIGGER ----------- 
///////////////////////////////////////////////////////

void triggerSound(){
  int ranSound = (int)random(0, 11);
    //print("ranSound: "+ranSound+" soundFrame: "+soundFrame);
    soundFrame++;
    if(soundFrame>playSoundRate){
      playSample = true;
      soundFrame = 0;
    }else{
      playSample = false;
    }
    
    if(playSample){
      switch(ranSound){
        case 1:
          sample1.trigger();
          break;
      
        case 2:
          sample2.trigger();
          break;
      
        case 3:
          sample3.trigger();
          break;
      
        case 4:
          sample4.trigger();
          break;
      
        case 5:
          sample5.trigger();
          break;
          
        case 6:
          sample6.trigger();
          break;
          
        case 7:
          sample7.trigger();
          break;
          
          
         case 8:
          sample6.trigger();
          break;
          
        case 9:
          sample9.trigger();
          break;
          
       case 10:
          sample10.trigger();
          break;
      
        case 11:
          //sample1.close();
          //sample2.close();
          //sample3.close();
          //sample4.close();
          //sample5.close();
      }
    }
    
}
