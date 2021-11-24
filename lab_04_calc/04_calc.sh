#!/bin/bash

function runByNumbers
{
    regex='^[-]?[0-9]+([.][0-9]+)?$'
    operator='^[\+-\*\/\^%]$'

    echo "Введите первое число:"
    read first
    while ! [[ $first =~ $regex ]];
    do
        echo "Ошибка: некорректный ввод"
        read first
    done

    echo "Введите второе число:"
    read second
    while ! [[ $second =~ $regex ]];
    do
        echo "Ошибка: некорректный ввод"
        read second
    done

    echo "Введите оператор (+ - * / ^ %):"
    read op
    while ! [[ $op =~ $operator ]];
    do
        echo "Ошибка: не оператор"
        read op
    done
    
    if [[ $second == '0' ]] && [[ $op == '/' ]] || [[ $op == '%' ]];
    then
        echo
        echo "Ошибка: деление на ноль"
        echo

        return 0;
    fi

    echo
    echo "результат = $(echo "scale=10; $first$op$second" | bc)"
    echo

    return 0
}

function runByWords
{
    # Dictionaries
    zero='^([Нн]+[ОоУу]+[Лл]+)([Ьь])?$'
    one='^([ОоАа0]+[ДдТт]+[ИиЫы]+[Нн]+)()?$'
    two='^([ДдТт]+[ВвФф]+[Аа]+)()?$'
    three='^([ТтДд]+[Рр]+[ИиЫы]+)()?$'
    four='^([Чч]+[ЕеИиЫыЭэУу]+[ТтДд]+[Ыы]+[Рр]+[ЕеЭэИи]+)()?$'
    five='^([Пп]+[ЯяАа]+[ТтДд]+)([Ьь]+)?$'
    six='^([ШшЩщ]+[ЕеИиЭэЫы]+[СсЗз]+[ТтДд]+)([Ьь]+)?$'
    seven='^([СсЗз]+[ЕеЭэ]+[Мм]+)([Ьь]+)?$'
    eight='^([Вв]+[ОоАа]+[СсЗз]+[ЕеИиЭэ]+[Мм]+)([Ьь]+)?$'
    nine='^([ДдТт]+[ЕеИиЭэ]+[Вв]+[ЯяАа]+[ТтДд]+)([Ьь]+)?$'
    plus='^([ПпБб]+[Лл]+[ЮюУу]+[СсЗз]+)()?$'
    minus='^([Мм]+[ИиЕеЭэЫы]+[Нн]+[Уу]+[СсЗз]+)()?$'
    div='^([ДдТт]+[ЕеЭэЫы]+[Лл]+[ИиЫы]+[Тт]+)([Ьь]+)?$'
    mult='^([Уу]+[Мм]+[Нн]+[ОоАа]+[ЖжШш]+[ИиЫы]+[ТтДд]+)([Ьь]+)?$'
    power='^([СсЗз]+[ТтДд]+[ЕеЭэИи]+[ПпБб]+[ЕеЭэИи]+[Нн]+)([Ьь]+)?$'
    rem='^([ОоАа]+[СсЗз]+[ТтДд]+[Аа]+[ТтДд]+[ОоАа]+[КкГг]+)()?$'

    echo "Введите первое число:"
    read first
    while true;
    do
        if [[ $first =~ $zero ]];
        then
            first=0
        elif [[ $first =~ $one ]];
        then
            first=1
        elif [[ $first =~ $two ]];
        then
            first=2
        elif [[ $first =~ $three ]];
        then
            first=3
        elif [[ $first =~ $four ]];
        then
            first=4
        elif [[ $first =~ $five ]];
        then
            first=5
        elif [[ $first =~ $six ]];
        then
            first=6
        elif [[ $first =~ $seven ]];
        then
            first=7
        elif [[ $first =~ $eight ]];
        then
            first=8
        elif [[ $first =~ $nine ]];
        then
            first=9
        else
            echo "Ошибка: некорректный ввод"
            read first
            continue
        fi
        break
    done

    echo "Введите второе число:"
    read second
    while true;
    do
        if [[ $second =~ $zero ]];
        then
            second=0
        elif [[ $second =~ $one ]];
        then
            second=1
        elif [[ $second =~ $two ]];
        then
            second=2
        elif [[ $second =~ $three ]];
        then
            second=3
        elif [[ $second =~ $four ]];
        then
            second=4
        elif [[ $second =~ $five ]];
        then
            second=5
        elif [[ $second =~ $six ]];
        then
            second=6
        elif [[ $second =~ $seven ]];
        then
            second=7
        elif [[ $second =~ $eight ]];
        then
            second=8
        elif [[ $second =~ $nine ]];
        then
            second=9
        else
            echo "Ошибка: некорректный ввод"
            read second
            continue
        fi
        break
    done

    echo "Введите оператор (плюс минус умножить делить степень остаток):"
    read op
    while true;
    do
        if [[ $op =~ $plus ]];
        then
            op='+'
        elif [[ $op =~ $minus ]];
        then
            op='-'
        elif [[ $op =~ $div ]];
        then
            op='/'
        elif [[ $op =~ $mult ]];
        then
            op='*'
        elif [[ $op =~ $power ]];
        then
            op='^'
        elif [[ $op =~ $rem ]];
        then
            op='%'
        else
            echo "Ошибка: некорректный ввод"
            read op
            continue
        fi
        break
    done

    if [[ $second == '0' ]] && [[ $op == '/' ]] || [[ $op == '%' ]];
    then
        echo
        echo "Ошибка: деление на ноль"
        echo

        return 0;
    fi

    echo
    echo "результат = $(echo "scale=10; $first$op$second" | bc)"
    echo

    return 0
}

function runHelp
{
    echo
    echo "Счет в цифрах"
    echo "   - доступные операции: + - * / ^ %"
    echo "   - вводные значения: int или float"
    echo "   - формат вывода: int или float с точностью 10 знаков после запятой"
    echo
    echo "Счет в буквах"
    echo "   - доступные операции: плюс минус умножить делить степень остаток"
    echo "   - вводные значения: 0-9 текстом"
    echo "   - формат вывода: int или float с точностью 10 знаков после запятой"
    echo
}

function runAnime
{
    echo
    echo "⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠛⢻⣿⣯⣿⣿⣿⣶⣶⣶⣶⣤⣤⣤⣀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⢨⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠈⠻⣿⡛⠉⠭⠉⠉⢉⣿⣿⣧⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠈⠙⠲⣶⠖⠄⠄⢿⣿⠄⠶⣶⣾⣿⣿⣿⣿⣧⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠈⠄⠄⠄⠺⢿⡗⠄⣹⣿⣿⠿⣟⣿⡏⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠤⠤⢾⣿⣿⣿⣦⠘⡿⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠈⢻⡿⣷⣶⣶⣤⣤⣤⣶⣦⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⣽⣿⣿⣿⣿⣿⣿⣿⣿⡟⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠘⠿⣿⣿⣿⣿⣿⣿⣿⠃⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠉⠉⠛⠋⠉⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄"
    echo
}

clear
echo "Калькулятор"
echo

command=""
until [[ "$command" == "уйти" ]];
do
    echo "Как будем считать?"
    echo "   - цифрами"
    echo "   - буквами"
    echo "   - хелп (help)"
    echo "   - anime"
    echo "   - уйти"
    read command

    if [[ "$command" == "цифрами" ]];
    then
        runByNumbers
    elif [[ "$command" == "буквами" ]];
    then
        runByWords
    elif [[ "$command" == "хелп" ]] || [[ "$command" == "help" ]]
    then
        runHelp
    elif [[ "$command" == "anime" ]];
    then
        runAnime
    elif [[ "$command" == "уйти" ]];
    then
        clear
        exit 0
    elif [[ -z $command ]]
    then
        continue
    else
        echo
        echo "Что-то пошло не так, попробуйте еще раз"
        echo
    fi
done
