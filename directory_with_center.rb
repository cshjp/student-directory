def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    students = []
    user_input = gets.chomp
    while !user_input.empty? do
        students << {name: user_input, cohort: :november}
        if students.count == 1
          puts "We now have #{students.count} student"
        else
          puts "We now have #{students.count} students"
        end
        user_input = gets.chomp
    end
    students
end

def print_header
puts "Students at Villains Academy"
puts "----------------------------"
end

def print(names)
    names.each do |name|
        puts "#{name[:name]}, (#{name[:cohort]} cohort)".center(30-name[:name].length)
    end
end

def print_footer(names)
if names.count == 1
puts "Overall we have #{names.count} great student!"
else
puts "Overall we have #{names.count} great students!"
end
end

students = input_students
print_header
print(students)
print_footer(students)