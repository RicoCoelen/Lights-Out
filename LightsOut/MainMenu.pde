class MainMenu{
  
  // important mechanics
  int selectedButton = 0;
  
  // style
  int buttonWidth = 200;
  int center = (width / 2) - (buttonWidth / 2);
  int textX = center - 85;
  
  /*
  setup function
  */
  MainMenu() {
   
  }

  /*
  Function to update select up
  */
  void buttonUp() {
    if (selectedButton > 0) {
      selectedButton--;
    }
  }
  
  /*
  Function to update select down
  */
  void buttonDown() {
    if (selectedButton < 4) {
      selectedButton++; 
    }
  }
    
  /*
  Function to update menu
  */
  void update() {
    //println(selectedButton);
  }
  
  /*
  Function to draw
  */
  void draw() {
    
    // color and fill
    background(bgDeath);
    fill(255);
    
    // logo // magic numbers for width
    rect(center - 100, 50, 400, 100);
    
    // start
    rect(center, 200, buttonWidth, 50);

    // highscore
    rect(center, 260, buttonWidth, 50);
    
    // option
    rect(center, 320, buttonWidth, 50);
    
    // quit
    rect(center, 380, buttonWidth, 50);
    
    // placeholder text
    fill(0);
    textSize(102);
    text("LIGHTS OUT!", textX, 122);
  }
  
}
