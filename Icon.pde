public class Icon{
  int iconX;
  int iconY;
  int iconSize;
  int groundY= 485;
  int delta = 10;
  int bounce = -8;
  int platformLength = 200;
  int stageDelta = 10;
  int rowHeight = 30;
  float velocity = 0;    // vertical speed
  float gravity = 0.6;   // downward acceleration
  boolean isJumping = true;
  boolean isTouchingPlatform = false;
  
  public Icon(int x,int y, int size){
    iconX = x;
    iconY = y;
    iconSize = size;
  }
  
  public void drawIcon(){
    rectMode(CENTER);
    rect(iconX,iconY,iconSize,iconSize);
    rectMode(CORNER);
  }
  
  public void protagMovement(){
      boolean up=false;
      boolean right=false;
      boolean left=false;
    for (char kee : keys){
      if (kee == 'w'|| kee == 'W' )
         up=true;
      if (kee == 'd'|| kee == 'D')
        right=true;
      if (kee == 'a'|| kee == 'A')
        left=true;
    }
    
    
    if(keyPressed && up ){
      startJump();
    }
    if(keyPressed && right && left==false){
      iconX += delta;
    }
    if(keyPressed && left && right==false){
      iconX -= delta;
    }  
  }
  
  public void jump(){
     // Apply gravity if jumping
    
  if (isJumping) {
    iconY += velocity;
    velocity += gravity;
    // Stop jump when rectangle hits "ground"
    if (iconY >= groundY) {
      iconY = groundY;
      isJumping = false;
      velocity = 0;
      }
    }
  }
    
  public void platformCollisionDetection(Stage stage){
    int[] platformX = stage.returnArray("x");
    int[] y = stage.returnArray("y");
    for(int i = 0; i < y.length; i++){
      if((platformX[i]-platformLength/2)<=iconX && (iconX<=platformX[i]+platformLength/2) &&  (y[i]-rowHeight/2)<= iconY && iconY <= (y[i]+rowHeight/2)){
        platform(i,stage);
      }
    }
  }
  public void platform(int platformIndex, Stage stage){
    int[] platformX = stage.returnArray("x");
    int[] y = stage.returnArray("y");
    boolean xdiff=(platformX[platformIndex]-platformLength/2)<=iconX-iconSize/2 && iconX+iconSize/2<=(platformX[platformIndex]+platformLength/2);
    boolean ydiff= (y[platformIndex]-rowHeight/2<= iconY && y[platformIndex]+rowHeight/2>= iconY);
    if (!(xdiff && ydiff)){
        isTouchingPlatform=false;
        iconY += velocity;
        velocity += gravity;
    }
    else if (xdiff && ydiff && velocity!=0){
        velocity=0;
        iconX-=stageDelta;
        iconY=y[platformIndex]-rowHeight/2;
        isTouchingPlatform=true;
        isJumping = false;
      }
    else if (xdiff && ydiff && velocity == 0){
        iconX-=stageDelta;
        isTouchingPlatform=true;
    }
    }
 
  private void startJump(){
    if(isJumping==false){
      velocity = -12;
      isJumping = true;
    }
  }
}
