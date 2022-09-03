class GameBlock {

  int MAXVALUES = 3;
  color blockColor;
  color savedColor;
  int blockNum;
  int startx;
  int starty;
  int endx;
  int endy;
  PFont blockFont;

  GameBlock(int x, int y, int x2, int y2, color cvalue, int bNum) {

    startx = x;
    starty = y;
    endx = x2;
    endy = y2;
    blockNum = bNum;
    blockColor = cvalue;
    savedColor = cvalue;
    blockFont = createFont("Arial", 20 * displayDensity);
    textAlign(CENTER, CENTER);
  }


  //updating our block model.
  void setBlockNumber(int value) {
    blockNum = value;
  }

  void setBlockColor(int value) {
    blockColor = value;
  }


  // getting our current values.
  color getBlockNumber() {
    return blockNum;
  }

  color getBlockColor() {
    return blockColor;
  }

  void touch() {
    //println(blockNum);
    if (blockColor == savedColor) {
      setBlockColor(color(255));
    }
  }

  // display our blocks. 
  void displayBlock() {

    fill(blockColor);
    rect(startx, starty, endx, endy);
    fill(0);
    textFont(blockFont);
    //text( blockNum, startx+100*displayDensity, starty+200*displayDensity);
    if (blockColor != savedColor) {
      setBlockColor(savedColor);
    }
  }
}
