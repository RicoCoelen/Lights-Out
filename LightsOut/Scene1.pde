class Scene1 {
   
  /*
  setup function
  */
  Scene1() {
    
  }
 
  /*
  Function to update Scene1
  */
  void update() {
    player.update(); // update player
    if (enemyList.size() == 0) {
      wave++;
      waveSwitcher();
    }
    
    for (int i = 0; i < enemyList.size(); i++) {
      enemyList.get(i).update();
    }
  }

  /*
  Function to draw Scene1
  */
  void draw() {
    background(bg); // drawing background
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
    switch (wave) {
      case 1:
        enemyList.add(new Enemy(700, groundHeight, 1));
        enemyList.add(new Enemy(-1000, groundHeight, 1));
        enemyList.add(new Enemy(1500, groundHeight, 1));
        enemyList.add(new Enemy(2000, groundHeight, 1));
        break;
       case 2:
        enemyList.add(new Enemy(700, groundHeight, 2));
        enemyList.add(new Enemy(-1000, groundHeight, 1));
        enemyList.add(new Enemy(1500, groundHeight, 2));
        enemyList.add(new Enemy(2000, groundHeight, 1));
        break;
       case 3:
        enemyList.add(new Enemy(700, groundHeight, 1));
        enemyList.add(new Enemy(-1000, groundHeight, 1));
        enemyList.add(new Enemy(1500, groundHeight, 3));
        enemyList.add(new Enemy(2000, groundHeight, 1));
        break;
       case 4:
        enemyList.add(new Enemy(800, groundHeight, 1));
        enemyList.add(new Enemy(900, groundHeight, 1));
        enemyList.add(new Enemy(1000, groundHeight, 1));
        enemyList.add(new Enemy(1100, groundHeight, 1));
        enemyList.add(new Enemy(1200, groundHeight, 1));
        enemyList.add(new Enemy(-800, groundHeight, 1));
        enemyList.add(new Enemy(-900, groundHeight, 1));
        enemyList.add(new Enemy(-1000, groundHeight, 1));
        enemyList.add(new Enemy(-1100, groundHeight, 1));
        enemyList.add(new Enemy(-1200, groundHeight, 1));
        break;
    }
  }
}
