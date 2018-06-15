// Michael Lam
// June 15, 2018
// Coding Challenge 102: Water Ripples

// Changes
// - They're not really water ripples anymore but it's nice!!
//    - Increased dampening value to 5
//    - i increases by 2 in each loop

// Declaring variables
int cols, rows;
float dampening = 5;
float[][] current, previous;

// Initial setup
void setup() {
  size(600, 400);
  cols = width;
  rows = height;
  current = new float[cols][rows];
  previous = new float[cols][rows];
}

// Runs animation continuously
void draw() {
  background(0);
  loadPixels();
  for (int i = 1; i < cols - 1; i += 2) {
    for (int j = 2; j < rows - 1; j++) {
      current[i][j] = (previous[i+1][j] + previous[i-1][j] + previous[i][j+1] + previous[i][j-1]) / 2 - current[i][j];
      current[i][j] = current[i][j] * dampening;
      int index = i + j * cols;
      pixels[index] = color(current[i][j] * 255);
    }
  }
  updatePixels();
  // Resets program
  float[][] temp = previous;
  previous = current;
  current = temp;
}

// Draws ripple on mouse press
void mousePressed() {
  previous[mouseX][mouseY] = 100;
}
