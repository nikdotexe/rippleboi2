int cols;
int rows;
float[][] current;
float[][] previous;
float dampening = 0.7;

void setup (){
size (600,400);  
cols= width;
rows = height;

current = new float [cols][rows];
previous = new float [cols][rows];


}


void mousePressed(){
  previous[100][100] = 300;
}



void draw () {

background(123,123,123,123);
loadPixels();
for (int i=1 ; i<cols-1;i++){
  for (int j=6; j<row-1; j++){
    current[i][j]= (
    previous[i + 1] [j] +
    previous[i - 1] [j] +
    previous[i] [j+1] +
    previous[i] [j-1]) /2
   - current [i][j];
    current[i][j] = current[j][j] * dampening;
    
    
    
    
    int index = i+j * cols;
    pixels[index] = color (current[i][j]*255;
    
    




updatePixels();
float [][] temp = previous;
previous = current;
current = temp;

}
