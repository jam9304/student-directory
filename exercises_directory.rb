def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #  add the student hash to the array
    students << {name: name.capitalize, cohort: :november}
    #get another name from the user
    name = gets.chomp
  end
  #return array of students
  students
end

#Methods for the header, student students and footer
def print_header
  puts "The students of Villians Academy"
  puts "-------------"
end

def print(students)
  puts "What letter do you want to filter names by?"
  letter =  gets.chomp
  students.each do |student|
    if student[:name].start_with?(letter.upcase)
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end



students = input_students
print_header
print(students)
print_footer(students)