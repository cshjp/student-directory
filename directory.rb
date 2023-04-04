def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    students = []
    user_input = gets.chomp
    while !user_input.empty? do
        students << {name: user_input, cohort: :november}
        puts "We now have #{students.count} students"
        user_input = gets.chomp
    end
    students
end

def print_header
puts "Students at Villains Academy"
puts "----------------------------"
end

def print(names)
    names.each_with_index do |name, index|
        puts "#{index + 1}. #{name[:name]}, (#{name[:cohort]} cohort)"
    end
end

def print_footer(names)
puts "Overall we have #{names.count} great students!"
end

students = input_students
print_header
print(students)
print_footer(students)