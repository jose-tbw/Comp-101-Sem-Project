
Are you fast enough?




Designed by: D.I.S. 3206
—
Ja’Zaire, Eric, Diego, Jose


Architecture

Figure 1. Simple flowchart displaying the major functions of the project

Major Functions:
void setup()
Creates the initial size of the sketch
Calls the drawStarterScene function
void draw()
Housing for the other functions such as controlKeys(), drawStage(int stageNumber) etc.
void controlKeys()
Function to determine how the protagonist icon will move
Uses the predefined keyPressed method to take inputs from the user
Includes the collision physics for the game
 void mousePressed()
Input: Left Click
Output: Character Jump
void drawIcons()
Draws the icons for the buffs, debuffs and main character.
void drawStage(int stageNumber)
Draws a new stage based on the input given by a user decision within the game.
void drawStarterScene()
Draws the opening scene
void drawButtons()
Draws the buttons that the user will use to navigate through the game.




Data Design - Diego
- includes declarations, explanations AND reasonable names  

Stat Bars: 
int	intGrades	//a progress bar that indicates how well our characters grades 
int	intSocial	//a progress bar that indicates how social our character is being
int	intHunger	//a progress bar that indicates how well fed our character is
int	intHappiness	//a progress bar that indicates how happy our character is
int	intMoney	//a progress bar that indicates how much money our character has


Drawings:
Image		LocationPic	//the background image for where our character resides in the level
Image		CharacterPic	//the image that represents our character, reflective of their made decisions 
		






Look and Feel  - Ja’Zaire & Jose
- Input: player will move the character through levels and platforms with keys w, a, s, d, and spacebar. Once a “?” block (questionBlock) is hit, the player will be prompted with a decision that will either increase or decrease one of the 3 statbars. Additionally, tunnels will be placed at the end of a level; the player will decide which level they will move onto next.




- Output: depending on user input, the statbars will become longer or shorter, each level prompts the player with different questions with different outcomes. 
















Group Member Contribution 

Diego
- Data Design
- Declaring global variables 
- Creative Design
- setup() 
- draw()

Ja’Zaire
- Cover page
- Creative Design
- drawStage()
- drawStarterScene()
- controlKeys()

Eric
- Architecture / flow chart
- Creative Design
- drawButton()
- buttonPressed()

Jose
- Creative Design
- Programmer
- controlKeys()
- mousePressed()
- drawIcons()


Github Repo: https://github.com/jose-tbw/Comp-101-Sem-Project










