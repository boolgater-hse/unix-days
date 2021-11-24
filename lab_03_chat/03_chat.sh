#!/bin/bash

clear
trap "echo $friend disconnected && exit 0" 15
trap "echo && echo Terminated && rm -f /tmp/temp_chat_log && exit 0" 2

echo "Welcome to chat!"
echo "Your PID is $$"
echo "Enter the interlocutor's PID "

re='^[0-9]+$'
read friend
while [[ -z $friend ]] || ! [[ $friend =~ $re ]] || ! [[ "$(ps -p $friend -o comm=)" = "bash" ]];
do
    echo "Wrong input or PID doesn't exist! Try again."
    read friend
done

clear
echo "Start chatting with $friend (your PID is $$)"

log=/tmp/temp_chat_log
out=/proc/$friend/fd/1
touch $log

while true
do
    read message
    if [[ "$message" = "/q" ]];
    then
        rm -f $log
        kill -15 $friend
        exit 0
    fi
    echo "$$: $message" | openssl enc -base64 >> $log
    tail -n 1 $log | openssl enc -base64 -d > $out
done
