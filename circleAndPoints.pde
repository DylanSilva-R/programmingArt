import processing.pdf.*;

import java.util.Random;
import java.lang.Math;
Random rand = new Random();

float newX; float newY;
float rotate =0;
float radius;
int denominator = rand.nextInt(2, 100);
int rotations = denominator * 2;

void setup()
{
  translate(width/2, height/2);
  background(0, 0, 0);
  size(1000, 1000);
  stroke(255, 255, 255);
  
  //float center = width/2;
  // Create a random generator from 0-2pi
  PVector center = new PVector(0, 0);
  PVector edge = new PVector(radius, 0.0);
  
  point(center.x, center.y);
  point(edge.x, edge.y);

  
  for(int i = 0; i <= rotations; i++) // The first for loop focuses on rotations.
  {
    int start = rand.nextInt(0, height/3);
    radius = rand.nextInt(start, height/2);
    radius = height/2;
    
    for(double f = 0.01; f < 1; f+=0.01) // The second for loop focuses on dot sepration within a line.
    {
      float tempX = ((float) f * radius) * cos(-rotate);
      float tempY = ((float) f * radius) * sin(-rotate);
      point(tempX*((float)f), tempY*((float)f)); // This line of code spaces out the dots by differnt increments.
      point(tempX, tempY); // This line of code will print out points equally distant from each other. 
    }
    
    newX = radius * cos(-rotate);
    newY = radius * sin(-rotate);
    point(newX, newY);
    
    
    rotate += PI/denominator;
  }
  
}
