# Домашняя работа №8 - Написание bash-скриптов

Эта домашняя работа содержит bash-скрипты для выполнения различных задач с файлами и числами.

## Скрипт 1: `ext_replacement.sh`

### Описание
Скрипт `ext_replacement.sh` используется для изменения расширения указанных файлов. 
Скрипт принимает список файлов с текущим расширением и новое расширение, на которое необходимо изменить файлы.

### Пример запуска
```bash
./ext_replacement.sh --file test.txt --file test2.sh --extension txt --replacement sh
```

## Скрипт 2: `numbers.sh`

### Описание
Скрипт `numbers.sh` принимает на вход целое число и выполняет следующие операции:

- **Вычисляет произведение** первой половины чисел от 1 до указанного числа.
- **Вычисляет сумму** второй половины чисел от 1 до указанного числа.
- Если число **нечетное**, игнорирует центральное значение.

### Пример запуска
```bash
./numbers.sh 8
```