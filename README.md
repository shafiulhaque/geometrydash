# Geometry Dash!
### Group Name: Gwuh Hawk Productions 🤯
### Group Members: Shafiul Haque 🙈 and Jacob Guo 🗿

## Brief Project Description
Welcome to Gwuh Hawk Productions! We are aiming to make the platform game Geometry Dash in Processing using Java. We plan on developing this game through loading pre set maps (levels) and having a square block character play through the level. The playing screen is 900 (width) by 600 (height) on Processing. Depending on what modes each level has to offer, the square block may switch to a rocket ship, upside down, backwards mode, etc. as the level progresses. The character will face obstacles in its path, such as triangles or colliding with objects, and interacting with these obstacles will cause the character to die and reset the game. In the home screen, the user will have the option to alternate between levels, see their progress on levels, and click the level of their choice. The ultimate goal of Geometry Dash is for the user to complete the levels successfully without dying.


## 📃 Prototype Document:
https://docs.google.com/document/d/1DoeC03GguchyTU4rn-WnNg-sOMY7gM8NtqaWRC1FQis/edit?usp=sharing


## Compile/Run Instructions:
In Words:
1. Clone the repository.
2. Change working director to the main geometrydash folder.
3. Change current working directory to geometryDash folder.
4. Open geometryDash.pde in Processing.
5. Click the play button on the top left of the Processing screen to start the game!

Terminal Commands:
```
git clone git@github.com:shafiulhaque/geometrydash.git
cd geometrydash
cd geometryDash
open geometryDash.pde
```


## Developer Log:
Note: Because Shafiul's family suffered from COVID-19 for a week and Jacob's computer was busted for a few days, there are some times where we were unable to push code of the project because we did not have access to a computer athome. However, on those days, we were always developing the project and designing the game before writing code for it, and as always, we were working on the code during class time.

5/23/22

### Jacob 🗿

Added the basic skeleton of the code and then also completed the Chars class.

### Shafiul 🙈

Added the basic skeleton of the Block class and the Triangle class, the later of which extends the Block class. Made sure that both types of obstacles are able to display on the game screen.

5/24/22

### Jacob 🗿

Adding the constructor and fixing some heavy merge issues today.

### Shafiul 🙈

Experimenting with the obstacle movement, and successfully made the obstacles move towards the character.

5/25/22

### Jacob 🗿

Jacob - Created the basis of the Levels class, and will now work on extra map features. Also fixing the weird merge issues too.

### Shafiul 🙈

Made the character die when interacting with the obstacles, and movement at the beginning of the level is shown.

5/26/22

### Jacob 🗿

Bug fixes with the blocks and chars, then starting to try larger level files and testing.

### Shafiul 🙈

Fixing up movement for the character.

5/27/22

### Jacob 🗿

More testing conceptually, I drew out diagrams with all the block movements to see how it would be implemented.

### Shafiul 🙈

More platforming with the block. When the character moves on top of a block, it's platform changes, which means that the character can stay on top of the block.

5/28/22

### Jacob 🗿

Working on increasing levels size and reading still, settled on a 20 x W dimension. Now working on block interactions in map.

### Shafiul 🙈

Created a new object slab, and made sure that collisions with the character on the block work.

5/29/22

### Jacob 🗿

Working on platforms and how they stack, and how chars interacts with that.

### Shafiul 🙈

Worked on creating new characters, such as the rocket and UFO, which extend the Chars class. This character change would allow the user to move in completely different ways.

5/30/22

### Jacob 🗿

Finishing MVP up- massive work with Shafiul to edit the platforming, jumping, and block interaction. Then created a level transition and user interface things.

### Shafiul 🙈

Worked on creating portals, which would allow the character to change if it jumps inside it. There are different portals based on the different characters, and all of them work. However, we haven't implemented them in the level yet, as we have to see how that changes the platforming. Also created a new ball character.

5/31/22

### Jacob 🗿

Presenting our project. My laptop's screen got cracked and I had to go to a repair shop and order a replacement screen - kept my laptop to work.

### Shafiul 🙈

Presentation day!! 🎉 Testing out edge cases for the jump and move functions of the different characters such as the block, rocket, and UFO.

6/1/22

### Jacob 🗿

Sort of hooked up my laptop to a tv to try and code. Made a few diagrams for collisions when I was not able to use my laptop.

### Shafiul 🙈

Conceptual work: Debugging for the jump functions; seeing how the new platform for the front block and the back block placee the character when moving.

6/2/22

### Jacob 🗿

Laptop still broken, still trying to figure out jump during class and adding more visualization.

### Shafiul 🙈

Testing exceptions with jumping, and simplified code in the main class as well as the dead function in the Chars class.

6/3/22

### Jacob 🗿

Still waiting on replacement screen to arrive. Used TV again after parents were done and still  trying to work on block collisions.

### Shafiul 🙈

Worked on block collisions and platforming checking between blocks of different kinds.

6/4/22

### Jacob 🗿

Brought laptop to repair shop and gave it in for the whole day, so no work done.

### Shafiul 🙈

Attempted to make a level, using both the block and triangle obstacles. Using platforming, the character would navigate through them.

6/5/22

### Jacob 🗿

Troubleshooting laptop - adding more features to new levels and debugging for collisions.

### Shafiul 🙈

Fixing movement up with additional characters in order to make the level work.

6/6/22

### Jacob 🗿

Designing levelsMenu with shafiul and also starting to do the additions for more levels. Also starting to use PImage with blocks.


### Shafiul 🙈

More designing along with Jacob, planning how to use the levelsMenu and incorporating other levels with it.

6/7/22

### Jacob 🗿

Decided to use PImages for the blocks and everything bugged out on me. Designing with shafiul, working on ideas for displaying levelMenus. Tried to debug for the rest of the day. 

### Shafiul 🙈

Additional designing with Jacob, we got the basics for the levelsMenu just now need to put our design into code. I'm working on coloring for levels, loading levels, and how to implement an end/pause for levels.

6/8/22

### Jacob 🗿

Laptop not responsive at home. In class work with shafiul to fix the bug from last night.

### Shafiul 🙈

Starting making levels: made a 250 character level and added new types of triangles that would be incorporated in the late game of the level. Organized functions into small areas in the bottom of the main geometryDash class.

6/9/22

### Jacob 🗿

Implementing levelsMenu and fixing the display especially. Trying to make it look basic now, will update later. Also added new info class for the menu.


### Shafiul 🙈

Starting making levels part two, from the original game (stereo madness and back on track) but with additional twists and modified obstacles. Worked on smoothening the jumping and platforming issues.

6/10/22

### Jacob 🗿

Laptop not working again - worked on loading bar and other cosmetic things.

### Shafiul 🙈

Added a new transporter object which moves the character upwards, and did more organizing especially with the merges that Jacob and I did. Made sure that when the character interacts with the transporter, it moves upwards higher than a jump.

6/11/22

### Jacob 🗿

Completely confused about the menu sliding but I got it to work ! also fixed the holding button problem with the menu.

### Shafiul 🙈

Successfully completed back on track, now working on stereo madness. More organization with the level txts, and the new functions for all the levels and level reading. Got platforming to work with the rocket jumps, whenever it moves upwards and downwards.

6/12/22

### Jacob 🗿

cosmetics for death, menu, and pause screen. also doing more with levels with shafiul and helping test for bugs. changing up a lot of the buttons to replicare geometrydash too. also creating a new level with shafiul.

### Shafiul 🙈

Worked on adding additional images for the obstacles, and also added a custom batman skin for the character, rocket, and UFO objects. Completed progress on both of the levels that I designed. Got platforming to work with the UFO jumps, whenever it moves upwards and downwards.

