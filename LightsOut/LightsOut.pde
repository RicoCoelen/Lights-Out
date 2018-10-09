// object for background image
PImage bg;
// added challenger 1
SmallEnemy c1 = new SmallEnemy();
// added challenger 2
MediumEnemy c2 = new MediumEnemy();
// added challenger 3
BigEnemy c3 = new BigEnemy();
// added challenger 4
MainMenu m = new MainMenu();

void setup() {
  frameRate(60);  // 60 fps
  size(640, 480);  // size determined by company
  bg = loadImage("assets/background.jpg");
  int state = 1;
}

void draw() {
  // draw 60 frames
  updateMainMenu();
  switch (state) { 
    case 1:
    scene1();
    break;
  }
}

void scene1() {
  // draw 60 frames
  updateMainMenu();
  updateGame();
  updateDraw();
}


void updateGame() {
  // update game mechanics here
  c1.update();
  c2.update();
  c3.update();
}

void updateDraw() {
  // drawing background
  background(bg);
  // update draw here
  m.draw();
  c1.draw();
  c2.draw();
  c3.draw();
}

void updateMainMenu(){
  
  m.keyPressed();
  m.keyPressedForStateMenu();
  m.keyPressedForStateStartGame();
  m.showMenu();
  m.handleStateStartGame();
}
