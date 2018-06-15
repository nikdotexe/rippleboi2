/************************
 Water Ripple Coding Challenge
 Koby W.
 June 15 2018
 
 Overall Changes:
 - Changed float dampening to 0.90
 - Made it so the user can decide if they want the ripples using mouseClicked() or mouseDragged() by pressing '1' or '2'
 *************************/

int cols;
int rows;
float[][] current;  // 2d arrays - [cols][rows]
float[][] previous; // ^

float dampening = 0.90;

int dragOrClick = 1; // Value that user can change in the program that makes it mousePressed or mouseClicked

void setup() {
  size (600, 400);
  cols = width;
  rows = height;
  current  = new float [cols][rows];
  previous = new float [cols][rows];
}



void keyPressed() {
  if (key == '1') {
    dragOrClick = 1;
  }

  if (key == '2') {
    dragOrClick = 2;
  }
}

void mouseDragged() {
  if (dragOrClick == 1) {
    previous[mouseX][mouseY] = 300;
  }
}

void mouseClicked() {
  if (dragOrClick == 2) {
    previous[mouseX][mouseY] = 300;
  }
}

void draw() {
  background(0);

  loadPixels();
  for (int i = 1; i < cols-1; i++) {
    for (int j = 1; j < rows-1; j++) {
      current[i][j] = (
        previous[i-1][j] + 
        previous[i+1][j] +
        previous[i][j-1] + 
        previous[i][j+1]) / 2 -
        current[i][j];
      current[i][j] = current[i][j] * dampening;
      int index = i + j * cols;
      pixels[index] = color(current[i][j]*255);
    }
  }
  updatePixels();
  fill(255);
  textSize(15);
  text("Press 1 for mouse drag mode, Press 2 for mouse click mode", 10, 20);
  text("Mode:", 10, 40);
  text(dragOrClick, 60, 40);
  float[][] temp = previous;
  previous = current;
  current = temp;
}