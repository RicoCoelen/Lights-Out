// object for background image
PImage bg;
// added challenger 1
SmallEnemy c1 = new SmallEnemy();
// added challenger 2
MediumEnemy c2 = new MediumEnemy();
// added challenger 3
BigEnemy c3 = new BigEnemy();

void setup() {
  frameRate(60);  // 60 fps
  size(640, 480);  // size determined by company
  bg = loadImage("assets/background.jpg");
}

void draw() {
  // draw 60 frames
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
  c1.draw();
  c2.draw();
  c3.draw();
}
