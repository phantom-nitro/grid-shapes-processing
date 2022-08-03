int size =20;
float w, h;
float n = 0;

void setup() {
  size(1080, 1080);
  w = width/size;
  h = height/size;
}

void draw() {
  background(30);

  for (float i = w * 0.5; i< width; i+=w) {
    for (float j = h * 0.5; j<height; j+=h) {

      //perlin noise
      float noi = noise((i + n) * 0.01, j * 0.01);

      //mapping size, angle
      float s = map(noi, 0, 1, 1, 10);
      float angle = map(noi, 0, 1, 0, TWO_PI);

      //common color
      fill(255);
      stroke(255);
      if (random(1) < 0.1) {
        fill(250, 10, 10);
        stroke(250, 10, 10);
      }

      //translate and draw shapes
      pushMatrix();
      translate(i, j);
      rotate(angle);

      //sphere
      if (random(1)<0.9) {
        ellipse(0, 0, s, s);
        if (random(1) < 0.5) {
          noFill();
          strokeWeight(random(2));
          float ring = random(10);
          ellipse(0, 0, s+ ring, s+ ring);
        }
      }

      //arrow
      else {
        float p = map(s, 1, 10, 1, 3);
        stroke(250, 10, 10);
        strokeWeight(p);
        line(0, 0, s, s);
        line(0, 0, s, -s);
        if (random(1)<0.5) {
          int ite = (int)random(3);
          for(int k = 1; k<=ite; k++){
          line(-5 * k, 0, s - 5 * k, s);
          line(-5 * k, 0, s-5 * k, -s);
          }
        }
      }
      popMatrix();
    }
  }
  n += 1;
  noLoop();
  saveFrame("01.png");
}
