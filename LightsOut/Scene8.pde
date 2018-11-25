class Scene8 {
   
  /*
  setup function
  */
  Scene8() {

  }
 
  /*
  Function to update Scene1
  */
  void update() {

  }

  /*
  Function to draw Scene1
  */
  void draw() {
    // drawing background
    background(bgDeath);
    // draw text
    fill(255);
    textSize(40);
    text("Oops, Lights out buddy!", width / 8, 90);
    textSize(20);
    text("Enter 3 Initials: ", width / 8, 130);
  }
}
