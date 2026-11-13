Icon test = new Icon(350,450,30);
Icon test2 = new Icon(450,375,50);
Stage x = new Stage();

void setup(){
  frameRate(60);
  size(1300,600);
  x.startingPos();
}
 
void draw(){
  background(128);
  rect(0,0,1300,100);
  rect(0,500,1300,100);
  x.drawStatusBars();
  x.drawStage();
  x.drawPlatforms();
  test.drawIcon();
  test2.drawIcon();
  test.protagMovement();
  test.checkFloor(x);
  test.jump();
  
}
