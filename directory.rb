@students = []

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    user_input = STDIN.gets.chomp
    while !user_input.empty? do
        @students << {name: user_input, cohort: :november}
        if @students.count == 1
          puts "We now have #{@students.count} student"
        else
          puts "We now have #{@students.count} students"
        end
        user_input = gets.chomp
    end
end

def print_header
puts "Students at Villains Academy"
puts "----------------------------"
end

def print_student_list
    @students.each_with_index do |student, index|
        puts "#{index + 1}. #{student[:name]}, (#{student[:cohort]} cohort)"
    end
end

def print_footer
if @students.count == 1
puts "Overall we have #{@students.count} great student!"
else
puts "Overall we have #{@students.count} great students!"
end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save students to students.csv"
  puts "4. Load students from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "Try Again, I didn't understand"
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu