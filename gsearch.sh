#!/bin/bash

# Скрипт для поиска совпадений в файле
usage() {
	echo "Принцип работы:"
	echo "$0 --file <файл> --seacrch <текст>"
	echo "--file     - Имя файла в котором необходимо выполнить поиск"
	echo "--search   - Текст для поиска в файле"
	exit
}

# Инициализация переменных
file=""
search=""

# Обработка аргументов
while [[ $# -gt 0 ]]; do
	case "$1" in
		--file)
			file="$2"
			shift
			shift
			;;
		--search)
			search="$2"
			shift
			shift
			;;
		*)
			echo "Неизвестный параметр $1"
			usage
			;;
	esac
done

# Проверка всех параметров
if [[ -z "$file" || -z "$search" ]]; then
	echo "Параметры --file --search являются обязательными и не могут быть пустыми"
	usage
fi

# Проверка что файл существует
if [[ ! -f "$file" ]]; then
	echo "Файл $file не существует"
	exit 1
fi

# Количество совпадений
count=$(grep -o -F "$search" "$file" | wc -l)

# Результат
if (( count == 0 )); then
	echo "Не найдено не одного совпадения в файле $(realpath "$file")"
else
	echo "Количество совпадений: $count"
fi
