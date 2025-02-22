
# Number Guessing Game

## Description
This is a simple **Command Line Interface (CLI) game** where the computer randomly selects a number between **1 and 100**, and the user has to guess it within a limited number of attempts. The game includes different difficulty levels, a hint system, and a timer to track the user's performance. The game will continue until the user either guesses the number correctly or runs out of attempts. Additionally, the user has the option to play multiple rounds.

## Features
- **Difficulty Levels**: Choose from easy, medium, or hard mode, each with a different number of allowed guesses.
- **Hint System**: Get clues if you are stuck.
- **Timer**: Track how long it takes to guess the number.
- **Multiple Rounds**: Play as many times as you want until you decide to quit.
- **Interactive Feedback**: The game provides feedback after each guess, indicating whether the correct number is higher or lower.

## How to Play
1. When the game starts, a **welcome message** and the **rules** will be displayed.
2. The computer will randomly select a number between **1 and 100**.
3. You will be prompted to **choose a difficulty level**:
   - **Easy**: 10 chances
   - **Medium**: 5 chances 
   - **Hard**: 3 chances
4. After each round, you can choose to **play again or quit**.

## Sample Output
```
Welcome to the Number Guessing Game!
I'm thinking of a number between 1 and 100.

Please select the difficulty level:
1. Easy (10 chances)
2. Medium (5 chances)
3. Hard (3 chances)

Enter you choice: 
3

Great! You have selected the Hard difficulty level.
=================================================

Round 1°

Enter you guess: 
2

Incorrect! The number is greater than 2
=================================================

Round 2°

Are you stuck? Would you like a clue?
1.Yes
2.No
2

Enter you guess: 
2

Incorrect! The number is greater than 2
=================================================

Round 3°

Enter you guess: 
2

Incorrect! The number is greater than 2

=================================================

Game Over !! You didn't discover the number

This round during 03 seconds

The correct number was 32

=================================================

Would you like play again?
1.Yes
2.No

Thanks for playing!!
```

## Requirements
- A command-line interface (CLI) environment.
- Python or another programming language that supports CLI input/output.

## How to Run the Game
1. Clone this repository:
   ```sh
   git clone https://github.com/victormoreira92/number-guessing.git
   ```
2. Navigate to the project directory:
   ```sh
   cd number-guessing
   ```
3. Run the game:
   ```sh
   ruby number_guessing.rb
   ```

## Future Improvements
- Add a **leaderboard** to track high scores.
- Implement a **multiplayer mode** where players compete.
- Allow the user to select a **custom range** of numbers.

---
Enjoy the game and test your number-guessing skills! 🎯

