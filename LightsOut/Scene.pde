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
          enemyList.add(new Enemy(700, 325, 1));
          enemyList.add(new Enemy(-700, 325, 1));
          enemyList.add(new Enemy(1400, 245, 2));
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
    for (int i = 0; i < enemyList.size(); i++) {
      enemyList.get(i).update();
    }
  }
  
  void scene1Draw() {
    background(bg); // drawing background
    fill(50);
    textSize(25);
    text("Score: " + score, 0, 0, 1000, 80);  // Text wraps within text box
    text("Health: " + player.health, 0, 25, 1000, 80);  // Text wraps within text box
    player.display(); // draw player
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
}
