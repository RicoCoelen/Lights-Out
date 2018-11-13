// object for background image
PImage bg;

// added challenger 4
MainMenu m = new MainMenu();

//global variables
Player player;
int state = 0;  
int dashCoolDown = 0;
int dashCoolTime = 90;
int dashDistance = 50;
int score;

int enemyAmount;  //  Amount of enemies in wave
ArrayList<Enemy> enemyList = new ArrayList<Enemy>();

void setup() {
  frameRate(60); //60 fps
  size(640,480); // size
  bg = loadImage("assets/sprites/background.jpg");
  player = new Player(); // initialize class
  player.texture = loadImage("assets/sprites/player_right.png");
  
  //  WAVE 1 TEST //
  enemyList.add(new Enemy(700, 325, 1));
  enemyList.add(new Enemy(-700, 325, 1));
  enemyList.add(new Enemy(1400, 245, 2));
  //  END WAVE 1 TEST //
}

void draw() {
  // select scene
  switch (state) { 
    case 0:
      menu();
      break;
    case 1:
      scene1();
      break;
    case 2:
      scene2();
      break;  
    case 9:
      death();
      break;  
  } 
}

void menu() {
  // update menu
  updateMainMenu();
}

void scene1() {
  // update scene 1
  update1();
  draw1();
  fill(50);
  text("Score: " + score, 0, 0, 1000, 80);  // Text wraps within text box
}

void scene2() {
  // update scene 2
}

void death() {
  // update death scene
  deathUpdate();
  deathDraw();
}

void updateMainMenu(){
  m.draw();
  m.keyPressed();
}

/*
========= scene 1 ===========
*/

void update1() {
  // update game mechanics here
  player.update();
  for (int i = 0; i < enemyList.size(); i++) {
    enemyList.get(i).update();
  }
}

void draw1() {
  // drawing background
  background(bg);
  // update draw here
  player.display();
  for (int i = 0; i < enemyList.size(); i++) {
    enemyList.get(i).draw();
  }
}

/*
========= scene 2 ===========
*/

void update2() {
  // update game mechanics here

}

void draw2() {
  // drawing background
  background(bg);
}

/*
========= game over screen ===========
*/

void deathUpdate() {
  // update game mechanics here
  frameCount = -1;
}

void deathDraw() {
  // drawing background
  background(255);
  // draw text
  fill(0);
  textSize(40);
  text("Oops, Lights out buddy!", width / 8, 100);
  textSize(20);
  text("You might want to try again by pressing 1.", width / 8, 200);
}

/*
========= user input ===========
*/

void keyPressed() {
  if(key == CODED) {
    // check coded key
    switch(keyCode) {
      case UP:
        player.upPressed = true;
        player.playerInput.add("UP");
        player.playerInputButtons.add(player.upArrow);
        player.comboCounter = 0;
      break;
      case DOWN:
        player.downPressed = true;
        player.playerInput.add("DOWN");
        player.playerInputButtons.add(player.downArrow);
        player.comboCounter = 0;
      break;
      case LEFT:
        player.leftPressed = true;
        player.playerInput.add("LEFT");
        player.playerInputButtons.add(player.leftArrow);
        player.comboCounter = 0;
      break;
      case RIGHT:
        player.rightPressed = true;
        player.playerInput.add("RIGHT");
        player.playerInputButtons.add(player.rightArrow);
        player.comboCounter = 0;
      break;
    }
  }
  else {
    // check non coded key
    switch(key) {
      case 'a':
      case 'A':
        player.aPressed = true;
        player.texture = loadImage("assets/sprites/player_left.png");
      break;
      case 'd':
      case 'D':
        player.dPressed = true;
        player.texture = loadImage("assets/sprites/player_right.png");
      break;
      case 'q':
      case 'Q':
        if (dashCoolDown + dashCoolTime < frameCount) {
        player.velocityX = player.velocityX - dashDistance; 
        dashCoolDown = frameCount;
        }
      break;
      case 'e':
      case 'E':
        if(dashCoolDown + dashCoolTime  < frameCount){
        player.velocityX = player.velocityX + dashDistance;
        dashCoolDown = frameCount;
        }
      break;    
      case '0':
        state = 0; 
      break;
      case '1':
        state = 1; 
      break;
      case '2':
        state = 2; 
      case '9':
        state = 9; 
      break;
    }
  }
}

void keyReleased(){
  // check non coded key
  if(key == CODED) {
    // check coded key
    switch(keyCode) {
      case UP:
        player.upPressed = false;
      break;
      case DOWN:
        player.downPressed = false;
      break;
      case LEFT:
        player.leftPressed = false;
      break;
      case RIGHT:
        player.rightPressed = false;
      break;
    }
  }
  else {
    // check non coded key
    switch(key) {
      case 'a':
      case 'A':
        player.aPressed = false;
      break;
      case 'd':
      case 'D':
        player.dPressed = false;
      break;
      case 'q':
      case 'Q':
        player.qPressed = false;
      break;
      case 'e':
      case 'E':
        player.ePressed = false;
      break;    
    }
  }  
}
