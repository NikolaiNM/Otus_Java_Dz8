#!/bin/bash

# Иницаялизация переменных
FILES=()
EXTENSION=""
REPLACEMENT=""

# Подсказка
usage() {
	# Скрипт который меняет расширение у файлов
	echo "Принцип работы:" 
	echo "$0 --file <файл> --extension <расширение> --replacement <новое_расширение>"
	echo
	echo "Параметры:"
	echo "--file <файл>                    - Список файлов(может быть несколько)"
	echo "--extension <расширение>         - Расширение которое нуно изменить"
	echo "--replacement <новое_расширение> - Новое расширение для файлов"
	exit 1
}

# Обработка аргументов
while [[ $# -gt 0 ]]; do # Цикл пока не обработаем все аргументы [[ $# -gt 0 ]]
	case "$1" in
		--file)
			FILES+=("$2")
			shift
			shift
			;;
		--extension)
			EXTENSION="$2"
			shift
			shift
			;;
		--replacement)
			REPLACEMENT="$2"
			shift
			shift
			;;
		*)
			echo "Неизвестный параметр $1"
			echo
			usage
			;;
	esac
done

# Проверка всех параметров
if [[ -z $EXTENSION || -z $REPLACEMENT || ${#FILES[@]} -eq 0 ]]; then
	echo "Параметры --file --extension --replacement являются обязательными"
	echo
	usage
fi

# Цикл преобразования файлов
for file in "${FILES[@]}"; do
	dirname=$(dirname "$file")
	filename=$(basename "$file")
	basename="$dirname/$filename"
	if [[ $filename =~ \.$EXTENSION$ ]]; then
		new_name="${basename%.$EXTENSION}.$REPLACEMENT"
		mv $basename $new_name
		echo $new_name
	fi
done
