int cols;
int rows;
float[][] current;
float[][] previous;

float dampening = 0.90; //controls the "Wave Length", so// 
                                                                 //the the distance and frequency// 
                                                                //of the wave.                  //

void setup() {                       
  size (600, 400);                       //Set window size                                                  //
  cols = width;                         //Defining the variable for calling                                // 
  rows = height;                       //the columns & rows of pixels                                     //
  current = new float [cols][rows];   //Creates the pixel array, on both the x & y axis                  //
  previous = new float [cols][rows]; //Similar pixel array for the "previous" wave                      //
                                    //(will allow the effect of the wave to be seen), on the x & y axis//
}

void mouseDragged() {
  previous[mouseX][mouseY] = 255;  //sets the current value for the pixel array in the wave so wave can be created //

}


void draw() {
  background(0);                                           
  loadPixels();                          //Allows the program to access the pixels on the screen                  //
  for (int i = 1; i< cols-1; i++) {     //Access the arrays so that the alorithm can add/subtract from the column// 
    for (int j = 1; j< rows-2; j++) {  //Access the arrays so that the alorithm can add/subtract from the rows  //
      current[i][j] = (               //Creates the state of the array for the current water ripple            //   
        previous [i-1][j]+                                   
        previous [i+1][j]+
        previous [i][j-1]+            //*Explain on Board*//
        previous [i][j+1])/2 - 
        current [i][j];
      current[i][j] = current[i][j] * dampening; //Combines the new algorithm and state of the pixels with dampening to "move the wave"//
      int index = i+j * cols;                              //Variable for the wave to be visible//
      pixels[index] = color(current[i][j]*100, 255, 255); //Makes the ripple visible, done throught the use of the index array and color//
    }
  }
  updatePixels(); //Refeshes the pixels so that you can see the wave moving//

  float[][] temp = previous; //algorithm to allow for the program to keep looping, allows the array to update//
  previous = current;       //turns the previous array and setting of the ripple to the temp                //
  current = temp;          //makes the current value of the ripple the previous, so that the wave can keep moving up to a certain point//
}
