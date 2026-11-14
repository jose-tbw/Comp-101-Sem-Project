Icon test = new Icon(350,450,30);
Icon test2 = new Icon(450,375,50);
Stage x = new Stage();
ArrayList <Character> keys = new ArrayList<Character>();

void setup(){
  frameRate(60);
  size(1300,600);
  x.startingPos();
}
 
void draw(){
  background(128);
  fill(255,0,0);
  rect(0,0,1300,100);
  rect(0,500,1300,100);
  x.drawStatusBars();
  x.drawStage();
  x.drawPlatforms();
  test.drawIcon();
  test2.drawIcon();
  test.protagMovement();
  test.jump();
  test.platformCollisionDetection(x);
  
}
public int getIndex(ArrayList <Character> charArray,char item){
  for (int i =0;i<charArray.size();i++){
    if (charArray.get(i)==item)
      return i;
  }
  return -1;
}
void keyPressed(){
    int current = getIndex(keys,key);
    if (current==-1){
      keys.add(key);
  }
}
void keyReleased(){
  for (int i = keys.size() - 1; i >= 0; i--) {
    char kee  = keys.get(i);
    if (kee==key) {
      keys.remove(i);
    }
  }
  }
/*
fixed both check floor int array names
fixed right movement conditons to the correct keys
fixed movement
added getIndex func
added keyPressed func
added keyReleased func
added left movement coditions and applying delta to icon
added conditional to make startJump() work
added platformCollisionDetection
added clearer floor and roof colors (temp)
redesigned movement input

todo:
- Implement proper collision detection with buttons/enemies
- Implement proper collision detection with the roof and side walls
- Improve collision detection with the floor and platforms
*/
