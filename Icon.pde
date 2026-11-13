public class Icon{
  int iconX;
  int iconY;
  int iconSize;
  int iconFloor;
  int delta = 10;
  int bounce = -8;
  
  float velocity = 0;    // vertical speed
  float gravity = 0.6;   // downward acceleration
  boolean isJumping = true;
  
  public Icon(int x,int y, int size){
    iconX = x;
    iconY = y;
    iconSize = size;
  }
  
  public void drawIcon(){
    rect(iconX,iconY,iconSize,iconSize);
  }
  
  public void protagMovement(){
    boolean up = key == 'w'|| key == 'W' || keyCode == UP;
    boolean right = key == 'a'|| key == 'A' || keyCode == RIGHT;
    
    if(keyPressed && up){
      startJump();
    }
    if(keyPressed && right){
      iconX += delta;
    }  
  }
  
  public void jump(){
     // Apply gravity if jumping
    
  if (isJumping) {
    iconY += velocity;
    velocity += gravity;

    // Stop jump when rectangle hits "ground"
    if (iconY >= iconFloor) {
      iconY = iconFloor;
      isJumping = false;
      velocity = 0;
    }
  }
  }
  
  public void checkFloor(Stage stage){
    int[] y = stage.returnArray("x");
    int[] x = stage.returnArray("y");
    if(iconX){ // working on this(eric)
      for(int i = 0; i < y.length; i++){ 
        if(iconY <= y[i]){
          iconFloor = y[i];
        } else {
          iconFloor = 450;
        }
      }
    }
  }
  
  private void startJump(){
    velocity = -6;
    isJumping = true;
  }
}
