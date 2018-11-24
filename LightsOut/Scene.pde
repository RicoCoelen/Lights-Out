class Scene {
  
  // setup for single run
  boolean runOnce1 = true;
   
  /*
  Function to draw
  */
  void draw() {
    switch (state) { 
      case 0:
        m.draw();
        m.update();
      break;
      case 1:
        if (runOnce1 == true) {
          runOnce1 = false;
        }
        scene1Update();
        scene1Draw();
      break; 
      case 2:
        scene2Update();
        scene2Draw();
      break;  
      case 9:
        scene9Update();
        scene9Draw();
      break; 
    }  
  }
  
  void scene1Update() {
    player.update(); // update player
    if (enemyList.size() == 0) {
      wave++;
      waveSwitcher();
    }
    
    for (int i = 0; i < enemyList.size(); i++) {
      enemyList.get(i).update();
    }
  }
  
  void scene1Draw() {
    background(bg); // drawing background
    fill(50);
    textSize(25);
    text("Wave: " + wave, width/2, 0, 1000, 80);  // Text wraps within text box
    highscore.draw();
    player.display(); // draw player
    healthBar();
    for (int i = 0; i < enemyList.size(); i++) {
      enemyList.get(i).draw(); // draw enemies
    }
  }
  
  void scene2Update() {
  }
  
  void scene2Draw() {
    background(bg);
  }
  
  void scene9Update() {
    // update game mechanics here
    frameCount = -1;
  }
  
  void scene9Draw() { 
    // drawing background
    background(255);
    // draw text
    fill(0);
    textSize(40);
    text("Oops, Lights out buddy!", width / 8, 100);
    textSize(20);
    text("You might want to try again by pressing 1.", width / 8, 200);
  }
  
   void healthBar () {
    fill(0);
    rect(0, 30, 100, 10);
    fill(255, 0, 0);
    rect(0, 30, player.health, 10);
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
