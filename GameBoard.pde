/*
  0, top left
 (mouseX <= halfW && mouseY <= halfH)
 1, top right
 (mouseX >= halfW && mouseY <= halfH)
 2, bottom left
 (mouseX <= halfW && mouseY >= halfH)
 3, bottom right
 (mouseX >= halfW && mouseY >= halfH)
*/


class GameBoard {
  ArrayList<GameBlock> gBlocks = new ArrayList<GameBlock>();

  GameBlock gb;
  IntList seq;
  int cntr;
  IntList[] lastSeq;
  GameBoard() {

    /*
      * GameBoard constructor. 
     * Setup all the options of the GameBoard.
     * 
     */
    int halfW = width/2;
    int halfH = height/2;
    int fullW = width;
    int fullH = height;
    color RED = color(255, 0, 0);
    color GREEN = color(0, 255, 0);
    color BLUE = color(0, 0, 255);
    color YELLOW = color(255, 255, 0);
    seq = new IntList();
    seq.append(0);
    seq.append(1);
    seq.append(2);
    seq.append(3);
    seq.append(0);

    // Add each GameBlock to the ArrayList. 
    gBlocks.add(new GameBlock(0, 0, halfW, halfH, BLUE, 0));
    gBlocks.add(new GameBlock(halfW, 0, fullW, halfH, RED, 1));
    gBlocks.add(new GameBlock(0, halfH, halfW, fullH, GREEN, 2));
    gBlocks.add(new GameBlock(halfW, halfH, fullW, fullH, YELLOW, 3));
  }

  // May be a stupid way of doing this, but I needed
  // to pass the touch event along to the block itself.
  void touch(int value) {
    // Grab the gameblock by it's blockNum
    // and pass it to the GameBlock class.
    gb = gBlocks.get(value);
    gb.touch();
  }

  //void playSeq() {
  //  /*
  //    Generate a play sequence. 
  //    Expand the sequence by 1 each round.

  //  */
  //  seq = new int[]{0,1,2,3,3,2,1,0};
  //  for ( int s : seq){
  //    this.touch(s);
  //  }
  //}

  void display() {

    // Load each gameblock, 
    // Call this in the main file's 
    // draw() function. i.e.
    /* 
     * void draw(){
     *  gb.display();
     * }
     */
    
    
    //seq.remove(cntr);
    if(seq.size() <= 4){
      cntr = 0;
    } else {
      cntr++;
      this.touch(seq.get(cntr));
    }
    for (GameBlock gb : gBlocks) {
      gb.displayBlock();
    }
  }
}
