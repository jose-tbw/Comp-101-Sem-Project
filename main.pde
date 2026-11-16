public String statusEffect = "health";                       // current buff type
Icon protagIcon = new Icon(350,500,30,false);                // the player
Icon statusEffectTest = new Icon(450,375,50,statusEffect);   // the collectable
Stage stageOneTest = new Stage(statusEffect);                // the level

// Runs once at the start
void setup(){
  frameRate(60);
  size(1300,600);
  stageOneTest.startingPos();   // place the debuffs
}
 

void draw(){
  background(128);
  rect(0,0,1300,100);
  rect(0,500,1300,100);
  //Game Borders
  
  stageOneTest.drawStatusBars();                                  // draw the stat bars
  stageOneTest.drawStage();                                       // move the debuffs
  stageOneTest.drawDebuffs();                                     // draw the debuffs
  statusEffectTest.drawIcon();                                    // draw the collectable
  statusEffectTest.collectableMovement(stageOneTest);             // move the collectable
  stageOneTest.debuffCollisions(protagIcon,statusEffectTest);     // check debuff hits
  protagIcon.collect(statusEffectTest,stageOneTest);              // check collectable pickup
  protagIcon.protagMovement();                                    // handle key input
  protagIcon.drawIcon();                                          // draw the player
  protagIcon.jump();                                              // apply jumping/gravity
  
  
}
