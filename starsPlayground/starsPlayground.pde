final static ArrayList<Ball> balls = new ArrayList<>();
PImage img;

void setup() {
  size(600, 600);
  smooth();
  img = loadImage("stars.jpg");
}

void draw() {
  background(0);
  image(img, width/2 - img.width/2, height/2 - img.height/2);
  for (Ball b : balls)
    b.run();
}

void mousePressed() {
  balls.add(new Ball(mouseX, mouseY));
}

class Ball {
  float x, y;
  float speedX, speedY;
  float radius = 20;

  Ball(float x, float y) {
    this.x = x;
    this.y = y;
    this.speedX = random(-2, 2);
    this.speedY = random(-2, 2);
  }

  void run() {
    move();
    display();
  }

  void move() {
    x += speedX;
    y += speedY;

    if (x < 0 || x > width) {
      speedX *= -1;
    }
    if (y < 0 || y > height) {
      speedY *= -1;
    }
  }

  void display() {
   float angle = TWO_PI / 5; // Angle between star points (72 degrees)
    float halfAngle = angle / 2.0;
    float radius2 = radius / 2.0;
    
    fill(#E8D150);
    beginShape();
    for (float a = -PI/2; a < TWO_PI - PI/2; a += angle) {
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      vertex(sx, sy);
      sx = x + cos(a + halfAngle) * radius2;
      sy = y + sin(a + halfAngle) * radius2;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  
  }
}
