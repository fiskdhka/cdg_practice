# Лабораторная работа №2. Знакомство с синтаксисом Ruby
# Программа для ввода и вывода данных студентов

students = []  # массив хэшей со студентами

# 1. Спрашиваем, сколько студентов добавить
print "Сколько студентов добавить? "
n = gets.chomp.to_i

# 2. Ввод данных каждого студента
n.times do |i|
  puts "\n=== Студент #{i + 1} ==="

  print "Имя: "
  name = gets.chomp

  print "Возраст: "
  age = gets.chomp.to_i

  print "Пол (male / female): "
  gender = gets.chomp.downcase.to_sym

  print "Группа: "
  group = gets.chomp.strip

  print "Электронная почта: "
  email = gets.chomp

  # Навыки — комплексная структура (Hash)
  print "Сколько навыков у студента? "
  skills_count = gets.chomp.to_i
  skills = {}

  skills_count.times do |j|
    print "  Навык #{j + 1} — ключ (например key_1, programming и т.д.): "
    key = gets.chomp.strip.to_sym
    print "  Описание уровня: "
    value = gets.chomp
    skills[key] = value
  end

  # Добавляем студента в массив
  students << {
    name: name,
    age: age,
    gender: gender,
    group: group,
    email: email,
    skills: skills
  }
end

# 3. Вывод в требуемом формате с группировкой по группе
puts "\n" + "=" * 50
puts "ВЫВОД ДАННЫХ СТУДЕНТОВ"
puts "=" * 50 + "\n"

# Группируем студентов по полю group (если группа пустая — "None")
grouped = students.group_by { |s| s[:group].empty? ? "None" : s[:group] }

grouped.each do |group_name, group_students|
  puts group_name

  group_students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]}: _"
    puts "#{student[:age]} лет, #{student[:gender]}"
    puts student[:email]
    puts "Навыки:"

    if student[:skills].empty?
      puts "  (нет навыков)"
    else
      student[:skills].each do |key, value|
        puts "  #{key}: #{value}"
      end
    end

    puts ""  # пустая строка между студентами
  end
end

puts "=" * 50
puts "Программа завершена."