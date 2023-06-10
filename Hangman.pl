package Hangman {

    # All words which are the options for playing the game. You can add some more words also.
    @options = (
        "subject",       "country",      "enviroment",    "classroom",
        "animals",       "province",     "month",         "politics",
        "puzzle",        "instrument",   "kitchen",       "language",
        "vampire",       "ghost",        "solution",      "service",
        "software",      "virus25",      "security",      "phonenumber",
        "championship",  "government",   "popularity",    "thousand",
        "expert",        "website",      "agreement",     "support",
        "priority",      "physics",      "branche",       "science",
        "mathematics",   "lightning",    "dispersion",    "accelerator",
        "detector",      "terminology",  "design",        "operation",
        "foundation",    "application",  "prediction",    "reference",
        "production",    "release",      "emphasis",      "director",
        "trademark",     "vehicle",      "aircraft",      "experiment",
        "atmosphere",    "eventually",   "hoverboard",    "extravagant",
        "compatibility", "advanced",     "search",        "triathlon",
        "feature",       "wetsuit",      "fitness",       "legendary",
        "measurement",   "concept",      "perspective",   "overview",
        "position",      "airplane",     "symmetry",      "dimension",
       "computer",      "radio",        "calculator",    "teacher",
        "immediately",   "encyclopedia", "endurance",     "distance",
        "nature",        "history",      "organization",  "international",
        "bureau",        "police",       "geometry",      "president",
        "toxic",         "algebra",      "illustration",  "classic",
        "verification",  "citation",     "unusual",       "resource",
        "analysis",      "license",      "comedy",        "screenplay",
        "variation",     "equal",        "approximately", "segment",
        "class",         "railroad",     "gas",           "publisher",
        "year",          "modest",       "convention",    "governor",
    );


    # all the hung body parts
    @hang = ( ' ', ' ', ' ', ' ', ' ', ' ' );
    # All body parts
    @body_parts = ( 'O', '|', '\\', '/', '/', '\\' );

    #all the required variables
    @word;         # this array is for storing all the words which are used by the computer randomly in the game
    $status_of_game = 0;      # won game(1) / lost game (-1) / game going on (0) 
    $body_parts_left = 6;    # Number of all_guesses left / number of body parts left to be hung
    $correct_guess_made = 0;    # Number of correct all_guesses made
    @all_guesses;      # All all_guesses
    @letters_guessed_already; # Array storing all the letters which are guessed already in a continuing game
    $letter;       # letter entered

    sub guess {
        # Function to make guess
        
        $input = 0;
        
        while ( $input == 0 ) { # input = 0 means no input is given
            # Calling display function to display state of word guessed so far and Hangman
            display();
            $letter = <STDIN>;
            $letter = uc substr( $letter, 0, 1 );

            if ( $letter eq "\n" || $letter eq " " ) {
                # If input is blank ask for input again
                print "\nEnter valid character!\n";
            }
            else {
                $input = 1;
            }
        }
        
        # Calling update function to update the word by letter guesses
        update();
    }

    sub clear() {
        # Function to clear all the variables and intialize them back to initial states when game starts
        
        @word         = ();
        $status_of_game          = 0;
        $body_parts_left = 6;
        $correct_guess_made = 0;
        @all_guesses      = ();
        @letters_guessed_already = ();
        @hang = ( ' ', ' ', ' ', ' ', ' ', ' ' );
    }


    sub update {
        # Function to update the guessed word with the letter given as input

        for ( $i = 0 ; $i <= $#all_guesses ; $i++ ) {
            if ( $letter eq @all_guesses[$i] ) {
                # If letter is already guessed return it
                print "\nYou've Already Guessed This Word\n";
                return;
            }
        }
        
        $correct_guess = -1;
        for ( $i = 0 ; $i < $#word + 1 ; $i++ ) {
            if ( @word[$i] eq $letter ) {
                # If guessed letter is present in the word update guessed word by that letter everytime and increase count of correct guess made
                @letters_guessed_already[$i] = $letter;
                $correct_guess = 1;
                $correct_guess_made++;
            }
        }

        # Pushing the guessed letter in the array which stores guessed letters
        push @all_guesses, $letter;

        if ( $correct_guess == 1 ) {
            # If letter is found in the word then it is a good guess
            print "\nGood Guess!\n";
        }
        else {
            # If letter is not found in the word then it is a bad guess
            print "\nBad Guess!\n";
            
            # Hanging one / more body part of Hangman
            @hang[ 6 - $body_parts_left ] = @body_parts[ 6 - $body_parts_left ];

            # Decreasing the chances left
            $body_parts_left--;
        }
        
        if ( $body_parts_left == 0 ) {
            # If chances left are 0 that means user has not guessed the word and has lost the game
            $status_of_game = -1;
        }
        elsif ( $correct_guess_made == $#word + 1 ) {
            # If correct all_guesses made equals size of word that means user has guessed the word and has won the game
            $status_of_game = 1;
        }
    }

    sub display {
        # Function to display current state of Hangman, word guessed so far, all_guesses made and chances left.

        print "  _ _  \n ||   | \n ||   " . @hang[0] . " \n";
        print " ||  " . @hang[2] . @hang[1] . @hang[3] . "  Here is your word : @letters_guessed_already\n";
        print " ||   " . @hang[1] . "   Guesses Made So Far : [@all_guesses]\n";
        print " ||  " . @hang[4] . " " . @hang[5] . "\n_||___    \n";
        print "\nGuesses Left : $body_parts_left\n";
        print "\nGuess : ";
    }
    sub start {
        # Function called when every game starts
        
        # After every game calling the clear function
        clear();

        # Taking a random word from the array using rand function
        $word = uc @options[ rand( $#options + 1 ) ];

        # Making an array of uppercase letters of random word selected above
        @word = split( '', $word );

        # Making the letters_guessed_already equals size of random word and replacing characters by _
        for ( $i = 0 ; $i < $#word + 1 ; $i++ ) {
            push @letters_guessed_already, '_';
        }
        
        # Telling the user number of all_guesses he/she has
        print "\nYou Only Have 6 Body parts left\n";

        # While $status_of_game is 0 that means game is going on
        while ( $status_of_game == 0 ) {
            # Calling the guess function until the word is guessed or chances left are 0
            guess();
        }

        if ( $status_of_game == 1 ) {
            # If $status_of_game is 1 that means user has won
            print "\nYeah! You Got It! It Was $word!\n";
        }
        else {
            # If $status_of_game is -1 that means user has lost
            
            # Printing the final state of Hangman hung
            print "  _ _  \n ||   | \n ||   " . @hang[0] . " \n";
            print " ||  "  . @hang[2]  . @hang[1]  . @hang[3] . "\n";
            print " ||   " . @hang[1] . "\n";
            print " ||  "  . @hang[4] . " "  . @hang[5]  . "\n_||___    \n";
            print "\nSo Sorry, You Struck Out.\n";
            print "\nThe Word was $word\n";
            print "\n          !!GAME END!!          \n";
        }
    }

}

$play = 1;
print "\n                !!GAME START!!              \n";

while ( $play == 1 ) {
    # While $play is 1 that means we have to play a game

    # Initializing the variable $game to the class Hangman
    $game = Hangman;

    # Starting the game by calling the start function inside class Hangman
    $game->start;

    # After a game we update $play to 0
    $play = 0;

    # user's choice to play game again
    print "\nDo you want to play again? Y/y for yes and n/N for no- ";
    $user_input = <STDIN>;

    $user_input = uc substr( $user_input, 0, 1 );
    if ( $user_input eq 'Y' ) {
        # If entered character is Y/y new game is started
        $play = 1;
    }
}
