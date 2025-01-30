#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

USER_EXISTS=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")

if [[ -z $USER_EXISTS ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE username='$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUMBER=$((RANDOM % 1000 + 1))
echo "Guess the secret number between 1 and 1000:"
GUESSES=0

while true
do
  read GUESS

  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    ((GUESSES++))
    if [[ $GUESS -lt $SECRET_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    elif [[ $GUESS -gt $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    else
      echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
      break
    fi
  fi
done

INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(username, guesses) VALUES('$USERNAME', $GUESSES)")


#verify all rows before commited issue