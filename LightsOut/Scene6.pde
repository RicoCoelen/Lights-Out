class Scene6 {
   
  /*
  setup function
  */
  Scene6() {

  }
 
  /*
  Function to update Scene1
  */
  void update() {
    if (state == 6) {
      if(player.leftPressed) {
        state = 0;
      }
    }
  }

  /*
  Function to draw Scene1
  */
  void draw() {
    // drawing background
    background(bgDeath); 
    textSize(20);
    // draw text
    text("Press Left Arrow to return.", 10, height - 10);
  }
}
