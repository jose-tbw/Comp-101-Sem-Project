public class Icon{
  int iconX;
  int iconY;
  int iconSize;
  int delta = 10;
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
    //boolean down = key == 's'|| key == 'S' || keyCode == DOWN;
    boolean right = key == 'a'|| key == 'A' || keyCode == LEFT;
    
    if(keyPressed && up){
      jump();
    }
    if(keyPressed && right){
      iconX -= delta;
    }
    
    
    //if(keyPressed && down){
    
    //}
    
  }
  
  public void statusEffectIconMovement(){
  
  }
  
  private void jump(){
  
  }
}
