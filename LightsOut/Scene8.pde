class Scene8 {
  
  char char1 = 'A';
  char char2 = 'A';
  char char3 = 'A';
  
  int selectedWheel = 1;
  
  String name = "AAA";
  
  /*
  setup function
  */
  Scene8() {

  }
 
  /*
  Function to update Scene1
  */
  void update() {
    if (state == 8) {
      if(player.leftPressed) {
        wheelLeft();
      }
      if(player.rightPressed) {
        wheelRight();
      }
      if(player.downPressed) {
        charDown();
      }
      if(player.upPressed) {
        charUp();
      }
      if(player.ePressed) {
        saveName();
      }
    }
  }

  /*
  Function to draw Scene1
  */
  void draw() {
    // drawing background
    background(bgDeath);
    // draw text
    fill(255);
    textSize(60);
    text("Oops, Lights out buddy!", width / 8, 90);
    textSize(40);
    text("Enter 3 Initials: ", width / 8, 130);
    
    text(char1 + " " + char2 + " " + char3, width / 8, 200);
  }
  
  void charUp() {
    if(selectedWheel == 1) {
      if (char1 > 'A') {
        char1--;
      }
    }
    if(selectedWheel == 2) {
      if (char2 > 'A') {
        char2--;
      }
    }
    if(selectedWheel == 3) {
      if (char3 > 'A') {
        char3--;
      }
    }
  }
  
  /*
  Function to update select down
  */
  void charDown() {
    if(selectedWheel == 1) {
      if (char1 < 'Z') {
        char1++; 
      }
    }
    if(selectedWheel == 2) {
      if (char2 < 'Z') {
        char2++; 
      }
    }
    if(selectedWheel == 3) {
      if (char3 < 'Z') {
        char3++; 
      }
    }
  }
  
  void wheelLeft() {
    if (selectedWheel > 1) {
      selectedWheel--;
    }
  }
  
  /*
  Function to update select down
  */
  void wheelRight() {
    if (selectedWheel < 3) {
      selectedWheel++; 
    }
  }
  
  /*
  Function to save name and go on
  */
  void saveName() {
    name = str(char1) + str(char2) + str(char3);
    highscore.saveScore(name, score);
    state = 9;
  }
}
