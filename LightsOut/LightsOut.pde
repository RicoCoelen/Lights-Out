// object for background image
PImage bg;

// added challenger 4
MainMenu m = new MainMenu();

//global variables
Player player;

//  Current scene
int state = 0;  

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
    //checking if pressed key is true
    if(key == 'a' || key == 'A') {
      player.aPressed = true;
      player.texture = loadImage("assets/sprites/player_left.png");
    }
    else if(key == 'd' || key == 'D'){
      player.dPressed = true;
      player.texture = loadImage("assets/sprites/player_right.png");
    }
    else if (key == CODED) {
      if (keyCode == UP) {
        player.upPressed = true;
        player.playerInput.add("UP");
        player.playerInputButtons.add(player.upArrow);
        player.comboCounter = 0;
      }
      else if (keyCode == DOWN) {
        player.downPressed = true;
        player.playerInput.add("DOWN");
        player.playerInputButtons.add(player.downArrow);
        player.comboCounter = 0;
      }
      else if (keyCode == LEFT) {
        player.leftPressed = true;
        player.playerInput.add("LEFT");
        player.playerInputButtons.add(player.leftArrow);
        player.comboCounter = 0;
      }
      else if (keyCode == RIGHT) {
        player.rightPressed = true;
        player.playerInput.add("RIGHT");
        player.playerInputButtons.add(player.rightArrow);
        player.comboCounter = 0;
      }
    }
    if(key == '9') {
     state = 9; 
    }
    if(key == '2') {
     state = 2; 
    }
    if(key == '1') {
     state = 1; 
    }
    if(key == '0'){
     state = 0; 
    }
}

void keyReleased(){
    //checking if pressed key is false
    if(key == 'a'){
      player.aPressed = false;
    }
    else if(key == 'd'){
      player.dPressed = false;
    }
    else if (key == CODED) {
      if (keyCode == UP) {
        player.upPressed = false;
      }
      else if (keyCode == DOWN) {
        player.downPressed = false;
      }
      else if (keyCode == LEFT) {
        player.leftPressed = false;
      }
      else if (keyCode == RIGHT) {
        player.rightPressed = false;
      }
    }
}
