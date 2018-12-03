class Scene2 {
   
  /*
  setup function
  */
  Scene2() {
  
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
    background(bgMountains);
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
    if (state == 2) {
      switch (wave) {
        case 1:
          // LEFT
          enemyList.add(new Enemy(-900, groundHeight, 1));
          enemyList.add(new Enemy(-1500, groundHeight, 1));
          enemyList.add(new Enemy(-1800, groundHeight, 1));
          enemyList.add(new Enemy(-2200, groundHeight, 1));
          enemyList.add(new Enemy(-2500, groundHeight, 1));
          
          // RIGHT
          enemyList.add(new Enemy(1000, groundHeight, 1));
          enemyList.add(new Enemy(1500, groundHeight, 1));
          enemyList.add(new Enemy(3000, groundHeight, 1));
          enemyList.add(new Enemy(3200, groundHeight, 1));
          enemyList.add(new Enemy(3500, groundHeight, 1));
          enemyList.add(new Enemy(4000, groundHeight, 2));
          
          break;
        case 2:
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
          
          enemyList.add(new Enemy(2300, groundHeight, 2));
          
          break;
        case 3:
          // LEFT
          enemyList.add(new Enemy(-2500, groundHeight, 3));
          enemyList.add(new Enemy(-3000, groundHeight, 2));
          
          enemyList.add(new Enemy(-6000, groundHeight, 2));
          enemyList.add(new Enemy(-6100, groundHeight, 1));
          enemyList.add(new Enemy(-6300, groundHeight, 1));
          enemyList.add(new Enemy(-6400, groundHeight, 2));
          
          // RIGHT
          enemyList.add(new Enemy(1000, groundHeight, 2));
          enemyList.add(new Enemy(1500, groundHeight, 2));
          
          enemyList.add(new Enemy(4000, groundHeight, 1));
          enemyList.add(new Enemy(4200, groundHeight, 1));
          enemyList.add(new Enemy(4500, groundHeight, 1));
          
          enemyList.add(new Enemy(5000, groundHeight, 4));
          enemyList.add(new Enemy(5050, groundHeight, 4));
          enemyList.add(new Enemy(5100, groundHeight, 4));
          enemyList.add(new Enemy(5150, groundHeight, 4));
          enemyList.add(new Enemy(5200, groundHeight, 4));
          
          
          break;
        case 4:
          // LEFT
          
          // RIGHT
          
          break;
        case 5:
          // LEFT
          
          // RIGHT
          
          break;
        case 6:
          // LEFT
          
          // RIGHT
          
          break;
        case 7:
          // LEFT
          
          // RIGHT
          
          break;
        case 8:
          // LEFT
          
          // RIGHT
          
          break;
        case 9:
          // LEFT
          
          // RIGHT
          
          break;
        case 10:
          // LEFT
          
          // RIGHT
          enemyList.add(new Enemy(-200, groundHeight, 5));
          
          break;
        case 11:
          // go to next level scene3
          player.health = 100;
          player.playerInput.clear();
          player.playerInputButtons.clear();
          enemyList.clear();
          wave = 0;
          background.stop();
          background.changeSource(lightsOut, "audio/death_screen.mp3");
          background.loop();
          state = 3;
          break;
      }
    }
  }
}
