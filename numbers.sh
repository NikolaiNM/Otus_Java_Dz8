#!/bin/bash

# Проверка аргумента
case $# in
	0)
		echo "Аргумент не передан"
		exit 1
		;;
	1)
		if [[ ! "$1" =~ ^[0-9]+$ ]]; then
		echo "Аргумент должен быть положительным целым числом"
		exit 1
		fi
		;;
	*)
		echo "Передано больше одного аргумента"
		exit 1
		;;
esac

# Инициализация переменых
number=$1
half=$((number / 2))
summ=0
mult=1

# Проверка четное ли число
if ((number % 2 == 0)); then
	#echo "Четное"
	for ((i=1; i<=half; i++)); do
		mult=$((mult * i))
	done
	for ((i=half+1; i<=number; i++)); do
		sum=$((sum + i))
	done
else
	#echo "Не четное"
	for ((i=1; i<=half; i++)); do
		mult=$((mult * i))
	done
	for ((i=half+2; i<=number; i++)); do
		sum=$((sum + i))
	done
fi
echo $number
echo $half
echo "mult: " $mult
echo "sum: "$sum
