Icon test = new Icon(350,200,50);

void setup(){
  frameRate(10);
  size(1300,600);
}
 
void draw(){
  background(128);
  test.drawIcon();
  test.protagMovement();
}
