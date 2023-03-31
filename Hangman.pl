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
    );
    //continue from here
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
