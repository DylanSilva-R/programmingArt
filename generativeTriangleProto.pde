float scale = 1;
float yPan = 500;
float xPan = 500;
boolean zoomIn = true;
boolean zoomOut = true;
float Xone; float Yone; float Xtwo; float Ytwo;
int iterations;
float newY; float newX;

void setup()
{ 
  size(1000, 1000);

  background(0);
  Xone = width / 4; //125
  Yone = height; // 500
  Xtwo = Xone * 3; // 375
  Ytwo = height; // 500
  iterations = 0;
  //Create two recursive methods for both sides of the triangle
  line(Xone,Yone, Xtwo, Ytwo);
  newY = Ytwo/2;
  System.out.println("New Y: " + newY);
  newX = (Xone + Xtwo)/2;
  System.out.println("New X: " + newX);
  
    
  randTrianglesLeft(Xone,Yone, newY, newX, iterations);  
  randTrianglesRight(Xtwo,Ytwo, newY, newX, iterations);
}

//Might have to create 3 more methods like this one that operate differntly
void randTrianglesLeft(float Xone, float Yone, float Xtwo, float Ytwo, int iterations)
{
  stroke(255);
  System.out.println("Points at the start of the method: (" + Xone + ", " + Yone + ", " + Xtwo + ", " + Ytwo + ")");
  iterations++;
  if(iterations > 16)
  {
    return;
  }else
  {
    line(Xone, Yone, Xtwo, Ytwo);
    //This will the the perpindicular line to the original line.
    float midX = (Xone + Xtwo)/2; //187.5
    System.out.println("New Mid X: " + midX);
    float midY = (Yone + Ytwo)/2; //375
    System.out.println("New Mid Y: " + midY);
    float halfLenghtOfOriginalLine = sqrt(pow(Xone - Xtwo,2) + pow(Yone - Ytwo,2))/5;
    System.out.println("Half the length of the og line: " + halfLenghtOfOriginalLine);
    
    float PerpendicularMidX = abs(midX - halfLenghtOfOriginalLine);
    System.out.println("Perpendicular X: " + PerpendicularMidX);
    float PerpendicularMidY = abs(midY - halfLenghtOfOriginalLine);
    System.out.println("Perpendicular Y: " + PerpendicularMidY);
    //perpindicular line
    line(midX, midY, PerpendicularMidX, PerpendicularMidY);
    line(Xone,Yone, PerpendicularMidX, PerpendicularMidY);
    line(Xtwo,Ytwo, PerpendicularMidX,PerpendicularMidY);
    
    randTrianglesLeft(Xone,Yone, PerpendicularMidX, PerpendicularMidY, iterations);
    randTrianglesLeft(Xtwo,Ytwo, PerpendicularMidX, PerpendicularMidY, iterations);

  }
}

void randTrianglesRight(float Xone, float Yone, float Xtwo, float Ytwo, int iterations)
{
  stroke(255);
  System.out.println("Points at the start of the method: (" + Xone + ", " + Yone + ", " + Xtwo + ", " + Ytwo + ")");
  iterations++;
  if(iterations > 16)
  {
    return;
  }else
  {
    line(Xone, Yone, Xtwo, Ytwo);
    
    float midX = (Xone + Xtwo)/2; //187.5
    System.out.println("New Mid X: " + midX);
    float midY = (Yone + Ytwo)/2; //375
    System.out.println("New Mid Y: " + midY);
    float halfLenghtOfOriginalLine = sqrt(pow(Xone - Xtwo,2) + pow(Yone - Ytwo,2))/5;
    System.out.println("Half the length of the og line: " + halfLenghtOfOriginalLine);
    
    float PerpendicularMidX = abs(midX + halfLenghtOfOriginalLine);
    System.out.println("Perpendicular X: " + PerpendicularMidX);
    float PerpendicularMidY = abs(midY - halfLenghtOfOriginalLine);
    System.out.println("Perpendicular Y: " + PerpendicularMidY);
    //perpindicular line
    line(midX, midY, PerpendicularMidX, PerpendicularMidY);
    line(Xone,Yone, PerpendicularMidX, PerpendicularMidY);
    line(Xtwo,Ytwo, PerpendicularMidX,PerpendicularMidY);
    
    randTrianglesRight(Xone,Yone, PerpendicularMidX, PerpendicularMidY, iterations);
    randTrianglesRight(Xtwo,Ytwo, PerpendicularMidX, PerpendicularMidY, iterations);

  }
}
