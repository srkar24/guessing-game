**GUESSING GAME ON ZYBO DEVELOPMENT BOARD**

The hot-cold number guessing game is played between a machine and a human player. The machine will generate a random number and save it in a signal called secret_number. The user tries to guess the number. The machine will give hints whether their guess is "hot" (greater than the secret number) or "cold" (smaller than the secret number).

Here's an example of how the game might be played:
The machine generates a secret number between 0 and 15. In this example, we assume 8.
The player begins by making an initial guess, for example, 5.
The machine then hints whether the guess is hot or cold, in this example, "cold."
The player then makes another guess based on the hint, for example, 9.
The machine gives another hint, in this example, "hot."
This process continues until the player successfully guesses the secret number. 

A demo video has been attached to showcase the game.

Hardware used:
Zybo Z7-10

Software used:
Xilinx Vivado
