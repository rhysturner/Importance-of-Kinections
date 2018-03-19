class Rope{
  
  int id;
  
  VerletPhysics2D physics;
  VerletParticle2D head,tail;
  
  int NUM_PARTICLES = 20;
  int REST_LENGTH = 10;
  
  Boolean isAlive = false;
  
  
  Rope(VerletPhysics2D _physics, Vec2D startPoint, int i){
    id = i;
   /// physics = _physics;
    physics = new VerletPhysics2D();
    physics.setDrag(0.05f);
    physics.setWorldBounds(new Rect(0, 0, width, height));
    
    head = new VerletParticle2D(startPoint.x,startPoint.y);
    tail = new VerletParticle2D(random(-startPoint.x, startPoint.y), random(-startPoint.x, startPoint.y));
    
    Vec2D stepDir = new Vec2D(1,1).normalizeTo(REST_LENGTH);
    ParticleString2D s = new ParticleString2D(physics, startPoint, stepDir, NUM_PARTICLES, 1, 0.1);
    head = s.getHead();
    tail = s.getTail();
    
    isAlive = true;
    
  }

  void updateHead(Vec2D headPoint){
     head.set(headPoint.x, headPoint.y);
     if(isAlive){
       drawRope();
     }
     physics.update();
  } 
  void updateTail(Vec2D tailPoint){
     tail.set(tailPoint.x, tailPoint.y);
     if(isAlive){
       //drawRope();
     }
    // physics.update();
  } 
  
  ///////////////////////////////////////////////////////
  //// --------- STRINGS DRAW -----------
  ///////////////////////////////////////////////////////
  void drawRope(){
    
    stroke(255,255,255);
    noFill();
    //line(head.x, head.y, tail.x, tail.y);
    
    //noStroke();
    beginShape();
    for(Iterator i = physics.particles.iterator(); i.hasNext();){
      VerletParticle2D p = (VerletParticle2D)i.next();
      //print("Rope: {"+p.x+","+p.x+"}");
      vertex(p.x, p.y);
    }
    endShape(); 
   
  }
  
  void kill(){
   isAlive = false; 
  }
  
}
