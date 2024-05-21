PVector[] mapNodes = {new PVector(210,300),new PVector(247,201),new PVector(307,145),new PVector(369,135),new PVector(456,161),new PVector(501,223),new PVector(531,304),new PVector(753,307),new PVector(782,410),new PVector(820,460),new PVector(869,474),new PVector(945,446),new PVector(976,385),new PVector(1000,311),new PVector(1136,308),new PVector(1136,342)};
PVector spawnPoint = new PVector(0, 300);

void drawNodes()
{
  for(int i = 0; i < mapNodes.length; i++)
  {
    circle(mapNodes[i].x, mapNodes[i].y, 10);
  }
}


class Cube
{
    PVector directionVec, position;
    int health, damage, speed, currentNode;
    int cubeSize = 32;
    Cube(int i_health, int i_damage, int i_speed)
    {
        this.health = i_health;
        this.damage = i_damage;
        this.speed = i_speed;
        this.directionVec = PVector.sub(mapNodes[0], spawnPoint).normalize();
        this.position = spawnPoint;
        this.currentNode = 0;
    }

    void updateCube()
    {
        square(position.x + directionVec.x * speed - cubeSize / 2, position.y + directionVec.y * speed - cubeSize / 2, cubeSize);
        position = PVector.add(position, PVector.mult(directionVec, speed));
        checkMapNode();
    }

    void checkMapNode()
    {
      if(currentNode + 1 >= mapNodes.length)
      {
        return;
      }
      
      if(PVector.dist(position, mapNodes[currentNode]) <= speed)
      {
          directionVec = PVector.sub(mapNodes[currentNode + 1], position).normalize();
          currentNode++;
      }
    }
}
