public class Stage{
  public int[] platformsY = new int[3];
  int stageDelta = 10;
  int[] platformsX = new int[3];
  //public int[] platformsY = new int[3];
  int platformLength = 200;
  int rowHeight = 30;
  int columnWidth = 50;
  final int ROW_NUMBER = 20; 
  
  public Stage(){
  
  }
  
  public void drawStatusBars(){
    rect(10,10,200,30);
    rect(10,50,200,30);
    rect(230,10,200,30);
  }
  
  public void startingPos(){
    for (int i = 0; i < platformsX.length; i++) {            // for each bonus
    //int randomColumn = int(random(1, 30));  // assign a random column
    int randomRow = int(random(10, ROW_NUMBER - 5));    // assign a random row, excluding the topmost row and the bottommost two rows

      //platformsX[i] = randomColumn * columnWidth;       // assign the x coordinate for that random column
      platformsY[i] = randomRow * rowHeight;            // assign the y coordinate for that random row
    }
  }
  
  public void drawStage(){
    for (int i = 0; i < platformsX.length; i++) {
      if (platformsX[i] > 0 - platformLength) {           // if enemy is still visible in the sketch 
      platformsX[i] -= stageDelta;                    // it moves left
    } else {                                     // otherwise, it is reset beyond the right edge of the sketch and to a new random row
      platformsX[i] = width + platformLength;
      //platformsY[0] = int(random(19, 21)) * rowHeight;
      platformsY[0] = int(random(15, 17)) * rowHeight;   //6,9
      platformsY[1] = int(random(11, 13)) * rowHeight;//11,13
      platformsY[2] = int(random(6, 9)) * rowHeight;
      System.out.print(platformsY[i] + "  ");
      //platformsY[4] = int(random(2, 4)) * rowHeight;
    }
  }

  }
  
  public void drawPlatforms(){
    for(int i = 0; i < platformsX.length; i++){
      //int delay = (int) (Math.random() * 50);
      fill(i*75);
      rectMode(CENTER);
      rect(platformsX[i], platformsY[i], platformLength, rowHeight/2);
      rectMode(CORNER);
    }
  }
  
  public int[] returnArray( String k){
    if(k.equals("y")){
        return platformsY;
    } 
    else {
        return platformsX;
    }
  }
}
