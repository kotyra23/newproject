---
title: "Bash Скриптинг: Продвинутый"
description: "Циклы, функции, массивы, case, строки"
tags: [linux, bash, scripting, advanced]
last-tested: "2026-01-12"
---

# 🔄 Bash Скриптинг: Продвинутый

## 🔁 ЦИКЛЫ

### For (перебор значений)

**Базовый синтаксис:**
```bash
for var in список; do
    команды
done




Примеры:

# Перебор чисел
for i in 1 2 3 4 5; do
    echo "Число: $i"
done

# Перебор строк
for fruit in apple banana cherry; do
    echo "Фрукт: $fruit"
done

# Перебор аргументов скрипта
for arg in "$@"; do
    echo "Аргумент: $arg"
done

# Перебор файлов в папке
for file in *.txt; do
    echo "Файл: $file"
done

For (C-стиль)

Синтаксис:

for ((инициализация; условие; инкремент)); do
    команды
done

Примеры:

# Классический счётчик
for ((i=0; i<5; i++)); do
    echo "Итерация $i"
done

# Обратный отсчёт
for ((i=10; i>0; i--)); do
    echo "$i..."
done
sleep 1
echo "Поехали!"

# Шаг больше 1
for ((i=0; i<=20; i+=2)); do
    echo "Чётное: $i"
done

While (пока условие истинно)

Синтаксис:

while [ условие ]; do
    команды
done

Примеры:

# Обратный отсчёт
count=5
while [ $count -gt 0 ]; do
    echo "$count..."
    ((count--))
done
echo "Старт!"

# Чтение файла построчно
while IFS= read -r line; do
    echo "Строка: $line"
done < file.txt

# Бесконечный цикл с выходом
while true; do
    read -p "Введите 'quit' для выхода: " cmd
    if [ "$cmd" = "quit" ]; then
        break
    fi
    echo "Вы ввели: $cmd"
done

Until (пока условие ложно)

Синтаксис: Выполняется, пока условие НЕ истинно.

until [ условие ]; do
    команды
done

Пример:

# Ждём пока файл не появится
until [ -f /tmp/ready ]; do
    echo "Ждём файл..."
    sleep 2
done
echo "Файл появился!"

Управление циклами

| Команда | Описание | Пример |
| :--- | :--- | :--- |
| `break` | Выйти из цикла | `break` / `break 2` (из двух циклов) |
| `continue` | Перейти к следующей итерации | `continue` |
| `exit N` | Выйти из скрипта с кодом | `exit 0` |

for i in {1..10}; do
    if [ $i -eq 5 ]; then
        continue  # Пропустить 5
    fi
    if [ $i -gt 8 ]; then
        break  # Выйти после 8
    fi
    echo $i
done
# Вывод: 1 2 3 4 6 7 8

⚡ ФУНКЦИИ

Объявление и вызов

# Способ 1
my_func() {
    echo "Привет из функции!"
}

# Способ 2
function my_func {
    echo "Привет из функции!"
}

# Вызов
my_func

Аргументы функции

greet() {
    local name=$1      # $1 — первый аргумент функции
    local age=$2
    echo "Привет, $name! Тебе $age лет."
}

greet "Alice" 25
# Вывод: Привет, Alice! Тебе 25 лет.

Возврат значений

# Код возврата (0-255)
check_user() {
    if [ "$1" = "admin" ]; then
        return 0  # Успех
    else
        return 1  # Ошибка
    fi
}

check_user "admin"
if [ $? -eq 0 ]; then
    echo "Доступ разрешён"
fi

# Возврат данных через echo
get_date() {
    echo "$(date +%Y-%m-%d)"
}

today=$(get_date)
echo "Сегодня: $today"

Локальные переменные

test_scope() {
    local temp="локальная"  # Видна только внутри функции
    echo "Внутри: $temp"
}

temp="глобальная"
test_scope
# Внутри: локальная
echo "Снаружи: $temp"
# Снаружи: глобальная

Рекурсия

factorial() {
    local n=$1
    if [ $n -le 1 ]; then
        echo 1
    else
        echo $(( n * $(factorial $((n-1))) ))
    fi
}

result=$(factorial 5)
echo "5! = $result"  # 120

# 📚 МАССИВЫ

Индексированные массивы

# Объявление
fruits=("apple" "banana" "cherry")

# Доступ к элементам
echo ${fruits[0]}      # apple (первый элемент)
echo ${fruits[1]}      # banana
echo ${fruits[-1]}     # cherry (последний, Bash 4.2+)

# Все элементы
echo ${fruits[@]}      # apple banana cherry
echo "${fruits[*]}"    # apple banana cherry (как одна строка)

# Количество элементов
echo ${#fruits[@]}     # 3

# Длина элемента
echo ${#fruits[0]}     # 5 (длина "apple")

# Добавление
fruits+=("date")       # Добавить в конец

# Удаление
unset fruits[1]        # Удалить элемент по индексу

# Перебор
for fruit in "${fruits[@]}"; do
    echo "Фрукт: $fruit"
done

Ассоциативные массивы (Bash 4+)

# Объявление
declare -A user

# Заполнение
user[name]="Alice"
user[age]=25
user[city]="Moscow"

# Доступ
echo ${user[name]}     # Alice
echo ${user[age]}      # 25

# Все ключи
echo ${!user[@]}       # name age city

# Все значения
echo ${user[@]}        # Alice 25 Moscow

# Перебор
for key in "${!user[@]}"; do
    echo "$key: ${user[$key]}"
done

🧩 CASE (Выбор варианта)
Базовый синтаксис

case $переменная in
    шаблон1)
        команды
        ;;
    шаблон2)
        команды
        ;;
    *)
        команды по умолчанию
        ;;
esac

Шаблоны (паттерны)

| Шаблон | Значение | Пример |
| :--- | :--- | :--- |
| `*` | Любое количество символов | `*.txt` — все txt файлы |
| `?` | Один любой символ | `file?.txt` — file1.txt, fileA.txt |
| `[abc]` | Любой один из набора | `[Yy]` — Y или y |
| `[a-z]` | Диапазон символов | `[0-9]` — любая цифра |
| `[!abc]` | Любой, кроме набора | `[!0-9]` — не цифра |

✂️ МАНИПУЛЯЦИИ СО СТРОКАМИ
Подстроки (Slicing)

s="Hello World"

echo ${s:0:5}    # Hello (начиная с 0, 5 символов)
echo ${s:6}      # World (с позиции 6 до конца)
echo ${s: -5}    # World (последние 5, пробел перед минусом!)
echo ${s:(-5)}   # World (альтернативный синтаксис)

Замена и удаление

s="hello world hello"

# Заменить первое вхождение
echo ${s/hello/hi}        # hi world hello

# Заменить все вхождения
echo ${s//hello/hi}       # hi world hi

# Удалить (заменить на пустоту)
echo ${s//hello/}         #  world 

# Удалить с начала (короткое совпадение)
echo ${s#hello}           #  world hello

# Удалить с начала (длинное совпадение)
echo ${s##hello}          #  world hello

# Удалить с конца (короткое)
echo ${s%hello}           # hello world 

# Удалить с конца (длинное)
echo ${s%%hello*}         # (пусто)

# Заменить расширение файла
file="report.txt"
echo ${file%.txt}.pdf     # report.pdf

Регистр

s="Hello World"

# В верхний регистр
echo ${s^^}      # HELLO WORLD
echo ${s^}       # Hello World (только первая буква)

# В нижний регистр
echo ${s,,}      # hello world
echo ${s,}       # hello World (только первая буква)

🧮 АРИФМЕТИКА В (( ))
Операторы

# Базовые
(( a = 5 + 3 ))      # Сложение
(( a = 10 - 4 ))     # Вычитание
(( a = 6 * 7 ))      # Умножение
(( a = 20 / 4 ))     # Деление
(( a = 17 % 5 ))     # Остаток (2)
(( a = 2 ** 3 ))     # Степень (8)

# Инкремент/декремент
(( i++ ))            # Постфиксный
(( ++i ))            # Префиксный
(( i-- ))

# Сравнение (возвращают 0=истина, 1=ложь)
(( 5 > 3 )) && echo "Да"    # Да
(( 5 < 3 )) || echo "Нет"   # Нет

# Логические
(( 1 && 1 ))       # И
(( 0 || 1 ))       # ИЛИ
(( ! 0 ))          # НЕ

⚠️ НЮАНСЫ И ПОДВОДНЫЕ КАМНИ

Всегда кавычки для массивов: "${arr[@]}" вместо ${arr[@]} (защита от пробелов в элементах).

Локальные переменные: Используй local в функциях, чтобы не затереть глобальные.

Код возврата: return возвращает 0-255, для больших чисел используй echo.

Case паттерны: * нужно экранировать в некоторых контекстах.

Ассоциативные массивы: Требуют declare -A и Bash 4+.

Арифметика: В (( )) не нужны $ перед переменными.


#📚 ШПАРГАЛКА

| Задача | Синтаксис |
| :--- | :--- |
| Цикл for | `for i in list; do ... done` |
| Цикл for (C) | `for ((i=0; i<10; i++)); do ... done` |
| Цикл while | `while [ условие ]; do ... done` |
| Объявить функцию | `func() { ... }` |
| Аргумент функции | `$1`, `$2`, `"$@"` |
| Локальная переменная | `local var=value` |
| Код возврата | `return 0` / `echo $result` |
| Массив | `arr=(1 2 3)` |
| Элемент массива | `${arr[0]}`, `${arr[@]}` |
| Case шаблон | `*.txt`, `[0-9]`, `[!abc]` |
| Подстрока | `${s:0:5}`, `${#s}` |
| Замена в строке | `${s/old/new}`, `${s//old/new}` |
| Арифметика | `(( a + b ))`, `(( i++ ))` |
