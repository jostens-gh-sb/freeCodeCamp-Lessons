#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t -c"

echo "Enter your username: "
read USERNAME

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

USER_LOOKUP=$($PSQL "select user_id from users where username = '$USERNAME'")

if [[ -z $USER_LOOKUP ]]
then
  echo -e "Welcome, $(echo $USERNAME | sed -r 's/^ *| *$//g')! It looks like this is your first time here."
  INSERT_USER=$($PSQL "insert into users(username) values('$USERNAME')")
else
  USER_DATA_LOOKUP=$($PSQL "select count(game_id) as games_played, min(guesses) as best_guesses from games where user_id = $USER_LOOKUP")
  echo "$USER_DATA_LOOKUP" | while read GAMES_PLAYED BAR BEST_GUESSES
    do echo -e "Welcome back, $(echo $USERNAME | sed -r 's/^ *| *$//g')! You have played $GAMES_PLAYED games, and your best game took $BEST_GUESSES guesses."
  done
fi

echo "Guess the secret number between 1 and 1000:"
GUESS_COUNT=0

GAME() {
  read GUESS  
  (( GUESS_COUNT++ ))
  
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then echo "That is not an integer, guess again:"
  GAME
  
  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    GAME
  
  elif [[ $GUESS -lt $SECRET_NUMBER ]]
    then echo "It's higher than that, guess again:"
    GAME
  
  else
    USER_ID_LOOKUP=$($PSQL "select user_id from users where username = '$USERNAME'")
    INSERT_GAME=$($PSQL "insert into games(user_id, secret_number, guesses) values($USER_ID_LOOKUP, $SECRET_NUMBER, $GUESS_COUNT)")
    echo -e "You guessed it in $(echo $GUESS_COUNT | sed -r 's/^ *| *$//g') tries. The secret number was $SECRET_NUMBER. Nice job!"
  fi
}

GAME
