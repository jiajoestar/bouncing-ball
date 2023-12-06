float ballX; // X coordinate of the ball
float ballY; // Y coordinate of the ball
float ballWidth; // diameter of the ball
float speedX; // speed of movement in X direction
float speedY; // speed of movement in Y direction
float holeX; // X coordinate of the hole
float holeY; // Y coordinate of the hole
float holeWidth; // diameter of the hole

void setup() {
  size(600,600);
  // reset ball parameters, position and size
  ballX = 30;
  ballY = height/2;
  ballWidth = 60;
  // initalize the speed to random values
  initializeSpeed();
  initializeHole();

}

void draw() {
  background(127);
  // draw te ball
  drawColourCircle(ballX, ballY, ballWidth, color(255,0,0));
  // move the ball
  moveBall();
  // collision
  if (checkCollide(ballX, ballY, ballWidth, holeX, holeY, holeWidth)) {
    initializeHole();
    initializeSpeed();
  }
  // bounce the ball (if necessary)
  bounceBall();
  drawColourCircle(holeX, holeY, holeWidth, color(0));


}

void initializeSpeed() {
  speedX = random(5,10);
  speedY = random(5,10);
}

void drawColourCircle(float xBall, float yBall, float widthBall, color fillBall) {
  fill(fillBall);
  ellipse(xBall, yBall, widthBall, widthBall);
}

void moveBall() {
  ballX = ballX + speedX;
  ballY = ballY + speedY;
}

void bounceBall() {
  if ( (ballX+ballWidth/2) >= width || (ballX-ballWidth/2) <= 0) {
    speedX = speedX * -1;
  } else if ( (ballY+ballWidth/2) >= height || (ballY-ballWidth/2) <= 0) {
    speedY = speedY * -1;
  }
}

void initializeHole() {
  holeX = random(0,width);
  holeY = random(0,height);
  holeWidth = random(100,300);
}

float distance(float x1, float y1, float x2, float y2) {
  float side1 = x1 - x2;
  float side2 = y1 - y2;
  float distance = sqrt((side1*side1) + (side2*side2));
  return distance;
}

boolean checkCollide(float xCircle, float yCircle, float diamCircle, float xHole, float yHole, float diamHole) {
  if (distance(xCircle, yCircle, xHole, yHole) <= (diamCircle/2 + diamHole/2)) {
    return true;
  } else {
    return false;
  }
}

void keyPressed() {
  
  if (key == 'x') {
    speedX = random(5,10);
  } else if (key == 'y') {
    speedY = random(5,10);
  }
}
