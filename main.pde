PImage backgroundimg;
Cube mainCube;

void setup()
{
    size(1200, 600);
    backgroundimg = loadImage("pictures/bloons.png");
    mainCube = new Cube(35, 35, 12);
}

void draw()
{
    background(backgroundimg);
    drawNodes();
    mainCube.updateCube();
}
