//Colors used in this program

final color white = color(255, 255, 255); //Regular white
final color black = color(0, 0, 0); //Regular black

final color upsdell_red = color(174, 28, 40); //Austria red tone

final color dark_cornflower_blue = color(33, 70, 139); //France blue tone

final color eletric_red = color(221, 0, 0); //Germany red tone
final color tangerine_yellow = color(255, 206, 0); //Germany yellow tone

final color philippine_green = color(0, 140, 69); //Italy green tone
final color anti_flash_white = color(244, 245, 240); //Italy white tone
final color fire_engine_red = color(205, 33, 42); //Italy red tone

//Window Size
final int windowWidth = 720;
final int windowHeight = 480;

//Flag size
final float xSize = windowWidth / 2;
final float ySize = windowHeight / 2;

//Rectangle class
class Rectangle 
{
  float x; //Horizontal coordinate of upper left corner
  float y; //Vertical coordinate of upper left corner
  float w; //Width of rectangle
  float h; //Height of rectangle
  color c; //Color of rectangle
  
  //Constructor
  Rectangle(float x, float y, float w, float h, color c) 
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
  }
  
  //Custom method for drawing
  void display() 
  {
    fill(c);
    rect(x, y, w, h);
  }
  
  void display(float dx, float dy) 
  {
    fill(c);
    rect(x + dx, y + dy, w, h);
  }
}

//Flag class
class Flag
{
  Rectangle bands[]; //Array of rectangles

  //Constructor
  Flag(Rectangle a[]) 
  {
    bands = a;
  }
  
  //Custom method for drawing
  void display() 
  {
    for(int i = 0; i < bands.length; i++)
      bands[i].display();
  }
  
  void display(float dx, float dy) 
  {
    for(int i = 0; i < bands.length; i++)
      bands[i].display(dx, dy);
  }
}

//Country class
class Country extends Flag 
{
  //Constructor
  Country(Rectangle a[]) 
  {
    super(a); //Flag class constructor
  }
}

//Custom method for drawing all flags
void drawFlags(Country a[], float dx, float dy) 
{
  for(int i = 0; i < a.length; i++) 
  {
    a[i].display(dx, dy);
  }
}

float xGer[] = {0, xSize + 20, xSize + 20, 0};
float yGer[] = {0, 0, ySize + 20, ySize + 20};

float xAus[] = {0, 0, -(xSize + 20), -(xSize + 20)};
float yAus[] = {0, ySize + 20, ySize + 20, 0};

float xFra[] = {0, 0, xSize + 20, xSize + 20};
float yFra[] = {0, -(ySize + 20), -(ySize + 20), 0};

float xIta[] = {0, -(xSize + 20), -(xSize + 20), 0};
float yIta[] = {0, 0, -(ySize + 20), -(ySize + 20)};

//Germanmy Flag
Rectangle ger1 = new Rectangle(20, 0 * ySize / 3 + 20, xSize, ySize / 3, black);
Rectangle ger2 = new Rectangle(20, 1 * ySize / 3 + 20, xSize, ySize / 3, eletric_red);
Rectangle ger3 = new Rectangle(20, 2 * ySize / 3 + 20, xSize, ySize / 3, tangerine_yellow);
Rectangle germany[] = {ger1, ger2, ger3};
Country ger = new Country(germany);


//Austria Flag
Rectangle aus1 = new Rectangle(xSize + 40, 0 * ySize / 3 + 20, xSize, ySize / 3, upsdell_red);
Rectangle aus2 = new Rectangle(xSize + 40, 1 * ySize / 3 + 20, xSize, ySize / 3, white);
Rectangle aus3 = new Rectangle(xSize + 40, 2 * ySize / 3 + 20, xSize, ySize / 3, upsdell_red);
Rectangle austria[] = {aus1, aus2, aus3};
Country aus = new Country(austria);

//Fraqnce Flag
Rectangle fra1 = new Rectangle(0 * xSize / 3 + 20, ySize + 40, xSize / 3, ySize, dark_cornflower_blue);
Rectangle fra2 = new Rectangle(1 * xSize / 3 + 20, ySize + 40, xSize / 3, ySize, white);
Rectangle fra3 = new Rectangle(2 * xSize / 3 + 20, ySize + 40, xSize / 3, ySize, fire_engine_red);
Rectangle france[] = {fra1, fra2, fra3};
Country fra = new Country(france);

//Italy Flag
Rectangle ita1 = new Rectangle(3 * xSize / 3 + 40, ySize + 40, xSize / 3, ySize, philippine_green);
Rectangle ita2 = new Rectangle(4 * xSize / 3 + 40, ySize + 40, xSize / 3, ySize, anti_flash_white);
Rectangle ita3 = new Rectangle(5 * xSize / 3 + 40, ySize + 40, xSize / 3, ySize, fire_engine_red);
Rectangle italy[] = {ita1, ita2, ita3};
Country ita = new Country(italy);

//Settings
void settings() 
{
  size(windowWidth + 60, windowHeight + 60);
}

//Setup
void setup() 
{
  background(155); 
}

int t = 0;
float dxGer = 0;
float dyGer = 0;
float dxFra = 0;
float dyFra = 0;
float dxIta = 0;
float dyIta = 0;
float dxAus = 0;
float dyAus = 0;


//Draw
void draw() 
{
  int t = frameCount;
  ger.display(dxGer, dyGer);
  dxGer = xGer[t/60 % 4] % (windowWidth + 60);
  dyGer = yGer[t/60 % 4] % (windowHeight + 60);
  
  fra.display(dxFra, dyFra);
  dxFra = xFra[t/60 % 4] % (windowWidth + 60);
  dyFra = yFra[t/60 % 4] % (windowHeight + 60);
  
  ita.display(dxIta, dyIta);
  dxIta = xIta[t/60 % 4] % (windowWidth + 60);
  dyIta = yIta[t/60 % 4] % (windowHeight + 60);
  
  
  aus.display(dxAus, dyAus);
  dxAus = xAus[t/60 % 4] % (windowWidth + 60);
  dyAus = yAus[t/60 % 4] % (windowHeight + 60);
  
  
 }
