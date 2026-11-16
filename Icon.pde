// Icon: used for both the player square and the collectable items
public class Icon{
  int iconX;              // x position
  int iconY;              // y position
  int iconSize;           // width/height of the square
  int iconFloor = 470;    // y position of the ground for jumping
  int delta = 10;         // horizontal move speed
  int bounce = -8;        // (currently unused)
  boolean collectable;    // true if this icon is a collectable
  String buffType;        // "health", "grades", or "social"
  
  float velocity = 0;    // vertical speed
  float gravity = 0.6;   // downward acceleration
  boolean isJumping = true;
  
  // Constructor for the player
  public Icon(int x,int y, int size, boolean c){
    iconX = x;
    iconY = y;
    iconSize = size;
    collectable = c;
  }
  
  // Constructor for a collectable with a buff type
  public Icon(int x,int y, int size, String s){
    iconX = x;
    iconY = y;
    iconSize = size;
    buffType = s;
  }
  
  // Draw the icon as a square
  public void drawIcon(){
    rectMode(CORNER);
    stroke(3);
    rect(iconX,iconY,iconSize,iconSize);
  }
  
  // Handle keyboard controls for the player
  public void protagMovement(){
    // Check which keys are being pressed (WASD or arrow keys)
    boolean up = key == 'w'|| key == 'W' || keyCode == UP;
    boolean left = key == 'a'|| key == 'A' || keyCode == LEFT;
    boolean right = key == 'd'|| key == 'D' || keyCode == RIGHT;
    
    // Jump only if not already in the air
    if(keyPressed && up && !isJumping){
      startJump();
    }
    // Move left
    if(keyPressed && left){
      iconX -= delta;
    }
    // Move right
    if(keyPressed && right){
      iconX += delta;
    } 
      // Keep the player inside the screen
      iconX = constrain(iconX, 0, width - iconSize);
      iconY = constrain(iconY, 100, height - 50);


  }
  
  // Scroll the collectable left; wrap to the right side when it leaves the screen
  public void collectableMovement(Stage stage){
    if (iconX> 0 - iconSize) {
        iconX -= stage.stageDelta;
      } else {
        iconX= width + iconSize;
      }
  }
  
  // Check if the player touches a collectable and apply its effect
  public void collect(Icon collectable, Stage stage){
    // Check horizontal collision
    boolean horizontalCollision = iconX < collectable.iconX + collectable.iconSize && iconX + iconSize > collectable.iconX;

  // Check vertical collision
  boolean verticalCollision = iconY < collectable.iconY + collectable.iconSize && iconY + iconSize > collectable.iconY;

  // Collect item if both conditions are true
    if (horizontalCollision && verticalCollision) {
      // Move the collectable back off-screen at a random height
      collectable.iconX = width + collectable.iconSize;
      collectable.iconY = height - (int)(Math.random() * 50) - 150;
      
      // Increase the stat that matches the collectable's type
      if(collectable.buffType.equals("health")){
        stage.health += 10;
      } else if(collectable.buffType.equals("grades")){
        stage.grades += 10;
      } else if(collectable.buffType.equals("social")){
        stage.social += 10;
      }
      
      // Pick a new random type for the next collectable
      int newEffect = (int)(Math.random() * 3) + 1;
      if(newEffect == 1){
        collectable.buffType = "health";
      } else if(newEffect == 2){
        collectable.buffType = "grades";
      } else if(newEffect == 3){
        collectable.buffType = "social";
      }
    }
    // Update the global status effect (used by the debuffs)
    statusEffect = collectable.buffType;
  }
  
  // Getter for the buff type
  public String bufftype(){
    return buffType;
  }
  
  
  
  // Update the player's vertical position while jumping
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
  
  
  // Launch the player upward
  private void startJump(){
    velocity = -12;
    isJumping = true;
  }
}
 
