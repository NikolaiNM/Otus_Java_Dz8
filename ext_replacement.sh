#!/bin/bash

# Иницаялизация переменных
FILES=()
EXTENSION=""
REPLACEMENT=""

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
			exit 1
			;;
	esac
done

# Проверка всех параметров
if [[ -z $EXTENSION || -z $REPLACEMENT || ${#FILES[@]} -eq 0 ]]; then
	echo "Параметры --file --extension --replacement являются обязательными"
	exit 1
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
