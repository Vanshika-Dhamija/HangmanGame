Run the program using the command perl Hangman.pl in the terminal.
     win = 0 game is going on , win = 1 user won , win = -1 user lost.
Running The Program
    Enter the command perl Hangman.pl to run the program. While making a guess, you have to guess only one letter. In case multiple letters, only the first letter is considered.
    When asked for another game enter y/Y for another game and n/N for exiting it. No. of guesses, correct guess and incorrect guess are displayed on the screen

The class Hangman is created  and inside it the functions/subroutines are defined to run it.
If you wish to add some more random words to the game, you can add those in the array @options in the code on line 4.

The start function is called to start the game, after that clear is called which clears previous game data.
The word is chosen randomly from the list of words in the code.

The Input is taken by the function guess in the class Hangman : 
    Input is expected to be a single character.If it is not a single character and a lot of characters then the first letter is only considered.If the entered first character is a blank space or new line then the error is displayed.

After every guess the guessed word is updated or the chances decreased using update function :
    If the guessed letter is already guessed then the message is displayed that it has already been guessed and function returns from there.If not already guessed then it is pushed in the array and is checked whether it is present in the word or not.
    If the letter is present in word then it is a good guess and is updated and count of correct guesses is increased by 1.
    Otherwise if it is not present in word then it is a bad guess and chances left is decreased by 1.
    If the count of correct guesses become equal to size of word that means user has won and has guessed the word.
    If the chances left are 0 that means the user has lost all the chances and didn't guess the word correct and hence lost the game.

