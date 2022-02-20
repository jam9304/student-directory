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
  output_1 = "The Students of Villians Academy"
  output_2 = "----------------------------------"
  puts output_1.center(100)
  puts output_2.center(100)
end

def print(students)
    students.each_with_index do |student, number|  
    output_3 = "#{number + 1}. #{student[:name]} (#{student[:cohort]} cohort). They were born in #{student[:origin_country]} and enjoys #{student[:hobby]}" 
    puts output_3.center(100)
  end
end

def print_footer(students)
  puts " "
  output_4 = "Overall, we have #{students.count} great students"
  puts output_4.center(100)
end


students = input_students
print_header
print(students)
print_footer(students)