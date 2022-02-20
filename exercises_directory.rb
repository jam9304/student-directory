def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    puts "And what's their favourite Hobby?"
    hobby = gets.chomp
    puts "And finally, what country were they born in?"
    country = gets.chomp
    #  add the student hash to the array
    students << {name: name, cohort: :november, hobby: hobby, origin_country: country}
    #get another name from the user
    puts "Thank you, now the next student please."
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
    students.each_with_index do |student, number|  
    puts "#{number + 1}. #{student[:name]} (#{student[:cohort]} cohort). They were born in #{student[:origin_country]} and enjoys #{student[:hobby]}" 
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end


students = input_students
print_header
print(students)
print_footer(students)