class Scene1 {
   
  /*
  setup function
  */
  Scene1() {
    //background = new AudioController(lightsOut, "audio/level_1.wav");
    //background.play();
  }
 
  /*
  Function to update Scene1
  */
  void update() {
    player.update(); // update player
    if (enemyList.size() == 0) {
      wave++;
      this.waveSwitcher();
    }
    
    for (int i = 0; i < enemyList.size(); i++) {
      enemyList.get(i).update();
    }
  }

  /*
  Function to draw Scene1
  */
  void draw() {
    background(bgMountains); // drawing background
    fill(50);
    textSize(40);
    text("Wave: " + wave, 5, 30, 1000, 80);  // Text wraps within text box
    highscore.draw();
    player.display(); // draw player
    healthBar();
    for (int i = 0; i < enemyList.size(); i++) {
      enemyList.get(i).draw(); // draw enemies
    }
  }
  
  void healthBar () {
    fill(0);
    rect(5, 10, 100, 10);
    fill(255, 0, 0);
    rect(5, 10, player.health, 10);
  }
  
  void waveSwitcher() {
    if (state == 1) {
      switch (wave) {
        case 1:
          // RIGHT
          enemyList.add(new Enemy(700, groundHeight, 1));
          enemyList.add(new Enemy(1100, groundHeight, 1));
          break;
        case 2:
          // RIGHT
          enemyList.add(new Enemy(700, groundHeight, 1));
          enemyList.add(new Enemy(1100, groundHeight, 1));
          
          // LEFT
          enemyList.add(new Enemy(-700, groundHeight, 1));
          
          break;
        case 3:
          // RIGHT
          enemyList.add(new Enemy(-400, groundHeight, 1));
          enemyList.add(new Enemy(-700, groundHeight, 1));
          enemyList.add(new Enemy(-900, groundHeight, 1));
          enemyList.add(new Enemy(-1200, groundHeight, 2));
          
          // LEFT
          enemyList.add(new Enemy(900, groundHeight, 1));
          enemyList.add(new Enemy(1000, groundHeight, 1));
          enemyList.add(new Enemy(1100, groundHeight, 1));
          break;
        case 4:
          // LEFT
          enemyList.add(new Enemy(700, groundHeight, 2));
          enemyList.add(new Enemy(800, groundHeight, 1));
          enemyList.add(new Enemy(900, groundHeight, 1));
          enemyList.add(new Enemy(1000, groundHeight, 2));
          
          
          // RIGHT
          enemyList.add(new Enemy(-100, groundHeight, 1));
          enemyList.add(new Enemy(-200, groundHeight, 1));
          
          break;
        case 5:
          // RIGHT
          enemyList.add(new Enemy(800, groundHeight, 2));
          enemyList.add(new Enemy(900, groundHeight, 2));
          enemyList.add(new Enemy(1000, groundHeight, 2));
          
          // LEFT
          enemyList.add(new Enemy(-300, groundHeight, 2));
          enemyList.add(new Enemy(-500, groundHeight, 2));
          enemyList.add(new Enemy(-700, groundHeight, 2));
          
          break;
        case 6:
          // LEFT
          enemyList.add(new Enemy(-200, groundHeight, 4));
          enemyList.add(new Enemy(-250, groundHeight, 4));
          enemyList.add(new Enemy(-300, groundHeight, 4));
          enemyList.add(new Enemy(-350, groundHeight, 4));
          enemyList.add(new Enemy(-400, groundHeight, 4));
          enemyList.add(new Enemy(-450, groundHeight, 4));
          enemyList.add(new Enemy(-500, groundHeight, 4));
          enemyList.add(new Enemy(-550, groundHeight, 4));
          enemyList.add(new Enemy(-600, groundHeight, 4));
          enemyList.add(new Enemy(-650, groundHeight, 4));
          enemyList.add(new Enemy(-700, groundHeight, 4));
          enemyList.add(new Enemy(-750, groundHeight, 4));
          
          // RIGHT
          enemyList.add(new Enemy(1400, groundHeight, 4));
          enemyList.add(new Enemy(1450, groundHeight, 4));
          enemyList.add(new Enemy(1500, groundHeight, 4));
          enemyList.add(new Enemy(1550, groundHeight, 4));
          enemyList.add(new Enemy(1600, groundHeight, 4));
          enemyList.add(new Enemy(1650, groundHeight, 4));
          enemyList.add(new Enemy(1700, groundHeight, 4));
          enemyList.add(new Enemy(1750, groundHeight, 4));
          enemyList.add(new Enemy(1800, groundHeight, 4));
          enemyList.add(new Enemy(1850, groundHeight, 4));
          enemyList.add(new Enemy(1900, groundHeight, 4));
          enemyList.add(new Enemy(1950, groundHeight, 4));
          
          
          break;
        case 7:
          // RIGHT
          enemyList.add(new Enemy(700, groundHeight, 1));
          enemyList.add(new Enemy(800, groundHeight, 1));
          enemyList.add(new Enemy(900, groundHeight, 2));         
          
          // LEFT
          enemyList.add(new Enemy(-300, groundHeight, 3));
          
          
          break;
          case 8:
          // RIGHT
          enemyList.add(new Enemy(700, groundHeight, 1));
          enemyList.add(new Enemy(800, groundHeight, 1));
          enemyList.add(new Enemy(900, groundHeight, 3));
          
          // LEFT
          enemyList.add(new Enemy(-300, groundHeight, 3));
          enemyList.add(new Enemy(-800, groundHeight, 3));
          
          
          break;
        case 9:
          // RIGHT
          enemyList.add(new Enemy(700, groundHeight, 1));
          enemyList.add(new Enemy(730, groundHeight, 4));
          enemyList.add(new Enemy(760, groundHeight, 4));
          enemyList.add(new Enemy(800, groundHeight, 1));
          enemyList.add(new Enemy(830, groundHeight, 4));
          enemyList.add(new Enemy(860, groundHeight, 4));
          enemyList.add(new Enemy(900, groundHeight, 1));
          enemyList.add(new Enemy(930, groundHeight, 4));
          enemyList.add(new Enemy(960, groundHeight, 4));
          enemyList.add(new Enemy(1000, groundHeight, 1));
          enemyList.add(new Enemy(1030, groundHeight, 4));
          enemyList.add(new Enemy(1060, groundHeight, 4));
          
          
          // LEFT
          
          break;
        case 10:
          // LEFT
          enemyList.add(new Enemy(800, groundHeight, 5));
          // RIGHT
           
          
          break;
        case 11:
          background.stop();
          background.changeSource(lightsOut, "audio/victory.mp3");
          background.setVolume(-20);
          background.loop();
          player.clearInput();
          state = 2;
          break;
      }
    }
  }
}
