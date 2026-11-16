// Stage: handles the status bars, obstacles (debuffs), and stats
public class Stage{
  public int[] debuffsY = {500,450,500,450};   // y positions of debuffs
  boolean[] debuffHit = new boolean[4];        // tracks if a debuff was already hit
  int stageDelta = 10;                         // scroll speed
  int[] debuffsX = new int[4];                 // x positions of debuffs
  int platformLength = 200;
  int rowHeight = 30;
  int columnWidth = 50;
  int floor = 500;                             // y position of the ground
  int health = 100;                            // player stats
  int grades = 100;
  int social = 100;
  String debuff;
  final int ROW_NUMBER = 20;
  
  public Stage(String d){
    debuff = d;
  }
  
  // Draw the Health, Grades, and Social bars
  public void drawStatusBars(){
    // Bar outlines and labels
    stroke(3);
    rectMode(CORNER);
    rect(10,10,200,30);
    rect(10,50,200,30);
    rect(230,10,200,30);
    textAlign(CENTER);
    fill(128);
    textSize(25);
    text("Health",100,32);
    text("Grades",100,74);
    text("Social",325,32);
    
    // Colored fill showing the current value of each stat
    noStroke();
    fill(0,125,0,128);
    rect(10,10,health,30);
    fill(125,0,0,128);
    rect(10,50,grades,30);
    fill(0,0,125,128);
    rect(230,10,social,30);

  }
  
  // Set the starting x positions of the debuffs, spaced 400 apart
  public void startingPos(){
    for (int i = 0; i < debuffsX.length;i++) {
      debuffsX[i] = width + (i * 400);
    }
  }
  
  // Scroll the debuffs left and keep the stats within limits
  public void drawStage(){
    for (int i = 0; i < debuffsX.length; i++) {
      if (debuffsX[i] > 0 - platformLength) {
        debuffsX[i] -= stageDelta;
      } else {
        // Wrap back to the right side
        debuffsX[i] = width + platformLength + (i*400);
      }
  }
    // Stats stay between 25 and 200
    health = constrain(health, 25, 200);
    grades = constrain(grades, 25, 200);
    social = constrain(social, 25, 200);
  }
  
  // Draw each debuff as a rectangle on the floor
  public void drawDebuffs(){
    for(int i = 0; i < debuffsX.length; i++){      
      fill(i*75);   // different shade for each debuff
      rectMode(CORNERS);
      rect(debuffsX[i], floor, debuffsX[i] - 25, floor - 50);
    }
  }
  
   // Check if the player runs into a debuff and lower the matching stat
   public void debuffCollisions(Icon icon,Icon collectable){
     for(int i = 0; i < debuffsX.length; i++){
       boolean collision = (icon.iconX < debuffsX[i] + 50 && icon.iconX + icon.iconSize > debuffsX[i]) &&(icon.iconY < floor && icon.iconY + icon.iconSize > floor - 50);
       // Only apply the penalty once per hit
       if(collision && !debuffHit[i]){
        if(collectable.buffType.equals("health")){
          health -= 10;
        } else if(collectable.buffType.equals("grades")){
          grades -= 10;
        } else if(collectable.buffType.equals("social")){
          social -= 10;
        }
         debuffHit[i] = true;
      }
      
      // Reset once the player is no longer touching the debuff
      if(!collision){
        debuffHit[i] = false;
      }
    }
}
  
  // Return the x or y array of the debuffs
  public int[] returnArray(String string){
    if(string.equals("y")){
      return debuffsY;
    } else {
      return debuffsX;
    }
  }
}
