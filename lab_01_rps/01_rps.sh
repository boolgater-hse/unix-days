#!/bin/bash

clear

echo "Welcome to the Rock, paper and scissors"
echo "Сhoose one: 'rock', 'paper', 'scissors' or 'otpustite' for stop"

while [ true ]
do
    read user

    pc=$(($RANDOM%3+1))
    cheat_param=17

    ROCK='rock'
    PAPER='paper'
    SCISSORS='scissors'
    STOP='otpustite'

    if [ $pc -eq 1 ]
    then
        pc=$ROCK
    elif [ $pc -eq 2 ]
    then
        pc=$PAPER
    else
        pc=$SCISSORS
    fi

    if [ -z "$user" ]
    then
        echo "Wrong input! Try 'rock', 'paper', 'scissors' or 'otpustite' for stop"
        continue
    elif [ "$user" = $ROCK ]
    then
        echo
        echo "User picked $user"
    elif [ "$user" = $PAPER ]
    then
        echo
        echo "User picked $user"
    elif [ "$user" = $SCISSORS ]
    then
        echo
        echo "User picked $user"
    elif [ "$user" = $STOP ]
    then
        echo "Thanks for playing!"
        sleep 1.5s
        clear
        exit 0
    else
        echo
        echo "Wrong input! Try 'rock', 'paper', 'scissors' or 'otpustite' for stop"
        continue
    fi

    cheat=$(($RANDOM%100))
    
    if [ $cheat -le $cheat_param ]
    then
        if [ $user = $ROCK ]
        then
            echo "PC picked paper"
            echo "PC wins (f)"
        elif [ $user = $PAPER ]
        then
            echo "PC picked scissors"
            echo "PC wins (f)"
        else
            echo "PC picked rock"
            echo "PC wins (f)"
        fi

    else

        if [ $user = $ROCK -a $pc = $SCISSORS -o $user = $SCISSORS -a $pc = $PAPER -o $user = $PAPER -a $pc = $ROCK ]
        then
            echo "PC picked $pc"
            echo "You win!"
        elif [ $user = $ROCK -a $pc = $ROCK -o $user = $PAPER -a $pc = $PAPER -o $user = $SCISSORS -a $pc = $SCISSORS ]
        then
            echo "PC picked $pc"
            echo "Draw!"
        else
            echo "PC picked $pc"
            echo "PC win!"
        fi
    fi

    echo
    echo "Сhoose one: 'rock', 'paper', 'scissors' or 'otpustite' for stop"

done
