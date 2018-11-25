class MainMenu{
  // important mechanics
  int selectedButton = 1;
  float delayCounter;
  float delay = 0.15; //  sets delay in seconds 
  
  // style
  int buttonWidth = 200;
  int center = (width / 2) - (buttonWidth / 2);
  int textX = center - 85;
  
  // images
  PImage logo = loadImage("data/sprites/logo.png");
  
  /*
  setup function
  */
  
  MainMenu() {
    background = new AudioController(lightsOut, "audio/main_menu.mp3");
    background.loop();
  }
  
  /*
  Function to update menu
  */
  void update() {
    // menu to update select
    if (state == 0) {
       if(player.upPressed) {
        buttonUp();
      }
      if(player.downPressed) {
        buttonDown();
      }
      if(player.rightPressed) {
        buttonRight();
      }
    }
  }
  
  /*
  Function to draw
  */
  void draw() {
    
    // color and fill
    background(bgDeath);
    
    // give white background
    fill(255, 255, 255, 75);
    
    // start
    rect(center, 200, buttonWidth, 50);
    // highscore
    rect(center, 260, buttonWidth, 50);
    // option
    rect(center, 320, buttonWidth, 50);
    // quit
    rect(center, 380, buttonWidth, 50);
    
    
    
    // give white background
    fill(255);
    textSize(50);
    if (selectedButton == 1) { fill(255, 255, 0); } else { fill(255); }
    text("Start", center + 20, 235);
    if (selectedButton == 2) { fill(255, 255, 0); } else { fill(255); }
    text("Highscore", center + 20, 295);
    if (selectedButton == 3) { fill(255, 255, 0); } else { fill(255); }
    text("Options", center + 20, 355);
    if (selectedButton == 4) { fill(255, 255, 0); } else { fill(255); }
    text("Quit", center + 20, 415);
    fill(255);
    
    imageMode(CENTER);
    image(logo, width/2, 105);
    imageMode(CORNER);
  }
  
  
  /*
  Function to update select up
  */
  void buttonUp() {
    delayCounter+=(float)1/60;
    if (delayCounter >= delay) {
      if (selectedButton > 1) {
        selectedButton--;
      }
      delayCounter = 0;
    }
  }
  
  /*
  Function to update select down
  */
  void buttonDown() {
    delayCounter+=(float)1/60;
    if (delayCounter >= delay) {
      if (selectedButton < 4) {
        selectedButton++; 
      }
      delayCounter = 0;
    }
  }
  
  /*
  Function to select
  */
  void buttonRight() {
    delayCounter+=(float)1/60;
    if (delayCounter >= delay) {
      if (selectedButton == 1) {
        state = 1;
        background.stop();
        background.changeSource(lightsOut, "audio/level_1.mp3");
        background.loop();
      }
      if (selectedButton == 2) {
        state = 7;
      }
      if (selectedButton == 3) {
        state = 6;
      }
      if (selectedButton == 4) {
       exit();
      }
      delayCounter = 0;
    }
  }
}
