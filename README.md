# APCSA FINAL

**Name:** Arman Johal, Elias Xu

**Period:** 7

**Email:** ajohal50@stuy.edu, exu51@stuy.edu

## Description:

This mini-arcade project has three mini-games: Tic-Tac-Toe, 2048, and Wordle. A menu allows you to choose the specific games you want to play. 
For tic-tac-toe, board placements will start with “x” and from clicks with a mouse. With a loss or a victory, the board will reset, and the score tracker will mark the change.
For wordle, a word will be chosen from all valid words in the top ten thousand most used words with a length equal to five letters, which will serve as an answer. Then, the player could enter words from the keyboard, registering a keypress once the key is released if the input is a backspace, the last. Different colors will appear with an entry for each letter depending on the position and whether the letter appears in the answer. If there is a yellowish color for a letter, it seems but it's in the wrong position.  If it is green, the letter appears both in the correct position and exists at that position in the answer. If it is grey, the letter will not be in the word.
For 2048, tiles will be controlled by the up, down, left, and right keys. Each key corresponds to a shift by every “line” to the indicated direction. The blocks will merge if they are the same, creating a singular block that is double the side of the original, and after each move, an additional block of value two or value four will be made (this is chosen randomly). If no move could change the board state, the player loses, but if they manage to get a block equal to 2048, the player wins.
We used multiple libraries for the project (to see graphically, look at UML diagram). For the Wordle and the TwentyFortyEight class, we used the java.util.arrays class to work with the respective patches and boards. Additionally, we used the java.util.ArrayList library in in the Wordle class to work with the words that were returned. We also used java.io.file, java.util.Scanner, java.util.ArrayList, and java.io.FileException, and java.io.FileWriter to work with reading and writing words to the dictionary .txt files. 
