class Player {
  
  // global variables
  float positionX, positionY, velocityX, velocityY, speed, w, h, left, right, top, bottom, comboCounter;
  boolean aPressed, dPressed, qPressed, ePressed, upPressed, downPressed, leftPressed, rightPressed;
  int health;

  ArrayList<String> playerInput = new ArrayList<String>();
  ArrayList<PImage> playerInputButtons = new ArrayList<PImage>();
  ArrayList<DrawScore> scoreList = new ArrayList<DrawScore>();
  ArrayList<DrawScore> healthList = new ArrayList<DrawScore>();
  ArrayList<DrawScore> lifeList = new ArrayList<DrawScore>();
  
  
  PImage texture;
  PImage upArrow = loadImage("data/sprites/up-arrow.png");
  PImage downArrow = loadImage("data/sprites/down-arrow.png");
  PImage leftArrow = loadImage("data/sprites/left-arrow.png");
  PImage rightArrow = loadImage("data/sprites/right-arrow.png");
  
  AudioController playerDamageSound;

  Player() {
    aPressed = false;
    dPressed = false;
    qPressed = false;
    ePressed = false;
    health = 100;
    speed = 5;
    w = 60;
    h = 110;
    positionX = width/2;
    positionY = groundHeight - h;
    left = positionX - (w/2);
    right = positionX + (w/2);
    top = positionY - (h/2);
    bottom = positionY + (h/2);
  }

  //displaying player
  void display() {
    image(texture, positionX, positionY);
    this.drawButtons();
    this.drawScores();
    this.drawDamage();
    this.drawLife();
  }
  
  void update() {
    //this.collision();
    //this.collisionMove();
    this.display();
    this.movement();
    this.border();
    this.counter();
    positionX += velocityX;
    positionY += velocityY;
    velocityX *= 0.4;
    if (playerInput.size() > 10) {
      clearInput();
    }
  }

  // player movement
  void movement() {
    if (aPressed) {
      velocityX -=  speed;
    }
    if (dPressed) {
      velocityX += speed;
    }  
    //dash
    if (ePressed) {
    }
    if (qPressed) {
    }
  }

  //stops player
  void border() {
    if (positionX < 0) {
      positionX = positionX + speed;
    }
     else if(positionX > width - w){
      positionX = positionX - speed;
    }
  }
  
  //  Player takes damage
  void takeDamage(int damage) {
     playerDamageSound = new AudioController(lightsOut, "audio/steve.mp3");
     playerDamageSound.setVolume(-10);
     playerDamageSound.play();
      health -= damage;
      healthList.add(new DrawScore(positionX, positionY, damage, 5));
      // death / save score to file
      if (health <= 0) {
        state = 8;
        background.stop();
        background.changeSource(lightsOut, "audio/death_screen.mp3");
        background.setVolume(-30);
        background.loop();
      }
  }
  
  //  Counter for player input
  void counter() {
    comboCounter += (float) 1/60;
    if (comboCounter >= 0.5) {
      playerInput.clear();  //  Clears the input array if the user didnt press a combo button after 0.5 seconds
      playerInputButtons.clear();  //  Clears the input array if the user didnt press a combo button after 0.5 seconds
      //  replaces the green combo icons with black ones
      for (int i = 0; i < enemyList.size(); i++) {
        for (int j = 0; j < enemyList.get(i).enemyCombo.size(); j++) {
          if (enemyList.get(i).enemyComboButtons.get(j) == enemyList.get(i).upArrowCorrect) {
            enemyList.get(i).enemyComboButtons.set(j, enemyList.get(i).upArrow);
          } 
          else if (enemyList.get(i).enemyComboButtons.get(j) == enemyList.get(i).downArrowCorrect) {
            enemyList.get(i).enemyComboButtons.set(j, enemyList.get(i).downArrow);
          } 
          else if (enemyList.get(i).enemyComboButtons.get(j) == enemyList.get(i).leftArrowCorrect) {
            enemyList.get(i).enemyComboButtons.set(j, enemyList.get(i).leftArrow);
          } 
          else if (enemyList.get(i).enemyComboButtons.get(j) == enemyList.get(i).rightArrowCorrect) {
            enemyList.get(i).enemyComboButtons.set(j, enemyList.get(i).rightArrow);
          }
        } 
      }
    }
  }
  
  void clearInput() {
      playerInput.clear();  //  Clears the input array if the user didnt press a combo button after 0.5 seconds
      playerInputButtons.clear();  //  Clears the input array if the user didnt press a combo button after 0.5 seconds
      for (int i = 0; i < enemyList.size(); i++) {
        for (int j = 0; j < enemyList.get(i).enemyCombo.size(); j++) {
          if (enemyList.get(i).enemyComboButtons.get(j) == enemyList.get(i).upArrowCorrect) {
            enemyList.get(i).enemyComboButtons.set(j, enemyList.get(i).upArrow);
          } 
          else if (enemyList.get(i).enemyComboButtons.get(j) == enemyList.get(i).downArrowCorrect) {
            enemyList.get(i).enemyComboButtons.set(j, enemyList.get(i).downArrow);
          } 
          else if (enemyList.get(i).enemyComboButtons.get(j) == enemyList.get(i).leftArrowCorrect) {
            enemyList.get(i).enemyComboButtons.set(j, enemyList.get(i).leftArrow);
          } 
          else if (enemyList.get(i).enemyComboButtons.get(j) == enemyList.get(i).rightArrowCorrect) {
            enemyList.get(i).enemyComboButtons.set(j, enemyList.get(i).rightArrow);
          }
        } 
      }
  }

  void drawButtons() {
    float debugPos = 150;
    for (int i = 0; i < playerInputButtons.size(); i++) {
      if (i < 15) {
        image(playerInputButtons.get(i), debugPos, 10);
        debugPos += 20;
      }
    }
  }
  
  void drawScores() {
    for (int i = 0; i < scoreList.size(); i++) {
      scoreList.get(i).drawEnemyScore();
    }
  }
  
  void drawDamage() {
    for (int i = 0; i < healthList.size(); i++) {
      healthList.get(i).drawPlayerDamage();
    }
  }
  
  void drawLife() {
    for (int i = 0; i < lifeList.size(); i++) {
      lifeList.get(i).drawLife();
    }
  }

  void checkCombo() {
    for (int i = 0; i < enemyList.size(); i++) {
      //  resets result if combo doesn't match player input
      enemyList.get(i).result = 0;
      if (enemyList.get(i).checkRange()) {
        //  loops through all enemies 
        for (int j = 0; j < enemyList.get(i).enemyCombo.size(); j++) {
          //  checks if index is in range of array
          if (playerInput.size() > j && enemyList.get(i).enemyCombo.size() > j) {
            //  checks if player input matches enemy combo
            if (enemyList.get(i).enemyCombo.get(j) == playerInput.get(j)) {
              enemyList.get(i).result++;
              // checks if the entered combo is correct
              if (enemyList.get(i).result == playerInput.size()) {
                //  if statements below replace the black combo icons with green ones if entered correctly by the player
                if (enemyList.get(i).enemyComboButtons.get(j) == enemyList.get(i).upArrow) {
                  enemyList.get(i).enemyComboButtons.set(j, enemyList.get(i).upArrowCorrect);
                } 
                else if (enemyList.get(i).enemyComboButtons.get(j) == enemyList.get(i).downArrow) {
                  enemyList.get(i).enemyComboButtons.set(j, enemyList.get(i).downArrowCorrect);
                } 
                else if (enemyList.get(i).enemyComboButtons.get(j) == enemyList.get(i).leftArrow) {
                  enemyList.get(i).enemyComboButtons.set(j, enemyList.get(i).leftArrowCorrect);
                } 
                else if (enemyList.get(i).enemyComboButtons.get(j) == enemyList.get(i).rightArrow) {
                  enemyList.get(i).enemyComboButtons.set(j, enemyList.get(i).rightArrowCorrect);
                }
              } 
            }
            //  checks if the correct input by the player has the same length as the enemy combo
            if (enemyList.get(i).result == enemyList.get(i).enemyCombo.size()) {
              scoreList.add(new DrawScore(enemyList.get(i).x, enemyList.get(i).y, enemyList.get(i).reward, 5));
              if (enemyList.get(i).life == 1) {
                lifeList.add(new DrawScore(enemyList.get(i).x, enemyList.get(i).y, enemyList.get(i).reward, 10));
              }
              enemyList.get(i).takeDamage();
              clearInput();
            }
          }
          //  checks if the correct input by the player has the same length as the enemy combo
          if (enemyList.get(i).result == enemyList.get(i).enemyCombo.size()) {
            enemyList.get(i).takeDamage();
            clearInput();
          }
        }
      }
    }
  }
  
}
