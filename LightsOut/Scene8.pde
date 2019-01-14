class Scene8 {
  
  char char1 = 'A';
  char char2 = 'A';
  char char3 = 'A';
  
  int selectedWheel = 1;
  
  String name = "AAA";
  float delayCounter;
  float delay = 0.15; //  sets delay in seconds 
  
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
      if(player.aPressed) {
        wheelLeft();
      }
      if(player.dPressed) {
        wheelRight();
      }
      if(player.sPressed) {
        charDown();
      }
      if(player.wPressed) {
        charUp();
      }
      if(player.downPressed) {
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
    text("Oops, Lights Out Buddy!", width / 8, 90);
    textSize(40);
    text("You made it to wave " + wave, width / 8, 130);
    text("Enter your initials: ", width / 8, 200);
    
    if (selectedWheel == 1) { fill(255, 255, 0); } else { fill(255); }
    text(char1 + " ", width * 0.13, 240);
    
    if (selectedWheel == 2) { fill(255, 255, 0); } else { fill(255); }
    text(char2 + " ", width * 0.16, 240);
    
    if (selectedWheel == 3) { fill(255, 255, 0); } else { fill(255); }
    text(char3 + " ", width * 0.19, 240);
  
  }
    
  void charUp() {
    delayCounter+=(float)1/60;
    if (delayCounter >= delay) {
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
      delayCounter = 0;
    }
  }
  
  /*
  Function to update select down
  */
  void charDown() {
    delayCounter+=(float)1/60;
    if (delayCounter >= delay) {
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
      delayCounter = 0;
    }
  }
  
  void wheelLeft() {
    delayCounter+=(float)1/60;
    if (delayCounter >= delay) {
      if (selectedWheel > 1) {
        selectedWheel--;
      }
      delayCounter =0;
    }
  }
  
  /*
  Function to update select down
  */
  void wheelRight() {
    delayCounter+=(float)1/60;
    if (delayCounter >= delay) {
      if (selectedWheel < 3) {
        selectedWheel++; 
      }
      delayCounter =0;
    }
  }
  
  /*
  Function to save name and go on
  */
  void saveName() {
    name = str(char1) + str(char2) + str(char3);
    highscore.saveScore(name, score);
    //  sorts highscores
    highscore.sortScores();
    state = 9;
  }
}
