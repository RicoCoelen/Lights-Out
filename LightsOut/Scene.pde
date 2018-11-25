class Scene {
  
  // setup for single run
  boolean runOnce1 = true;
   
  /*
  Function to draw
  */
  void draw() {
    println(state);
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
      case 8:
        scene8Update();
        scene8Draw();
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
    background(0);
  }
  
  void scene8Update() {
  }
  
  void scene8Draw() {
    // drawing background
    background(255); 
    // top part
    fill(50);
    // change text
    textSize(20);
    text("Highscores:", 10, 50); 
    // scorey postion for loop
    int scoreY = 90;
    // get json array from higscore class
    for (int i = 0; i < highscore.highscores.size(); i++) {
      // get json object from higscore class
      JSONObject item = highscore.highscores.getJSONObject(i); 
      // get from object
      int id = item.getInt("id");
      String name = item.getString("name");
      String time = item.getString("time");
      int score = item.getInt("score");
      // draw score
      text("ID   " + id + "   Name: " + name + "   Score: " + score + "   Time: " + time, 10, scoreY); // print score
      // add 100 for position
      scoreY += 25;
    }
     // if arrow return
    if (state == 8 && player.leftPressed) {
      state = 0;
    }
  }
  
  void scene9Update() {
    // update game mechanics here
    frameCount = -1;
  }
  
  void scene9Draw() { 
    // drawing background
    background(bgDeath);
 
    // draw text
    fill(255);
    textSize(40);
    text("Oops, Lights out buddy!", width / 8, 90);
    textSize(20);
    text("Top 10 Highscores:", width / 8, 130);
    
    int scoreY = 180;
    
    // get json array and max ten scores
    for (int i = 0; i < 10; i++) {
      // get json object from higscore class
      JSONObject item = highscore.highscores.getJSONObject(i); 
      // get from object
      int id = item.getInt("id");
      String name = item.getString("name");
      String time = item.getString("time");
      int score = item.getInt("score");
      // draw score
      text("Name: " + name + "   Score: " + score, width / 8, scoreY); // print score
      // add 100 for position
      scoreY += 25;
    }
    text("You might want to try again by pressing 1.", width / 8, 450);
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
