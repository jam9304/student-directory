def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  name = gets.strip
  cohort_check = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", "N/A", ""]
  
  #while the name is not empty, repeat this code
  while !name.empty? do
    puts "And what cohort are they in?"
    cohort_entry = gets.strip
      while !cohort_check.include?(cohort_entry)
        puts "Please re enter the cohort or state 'N/A'"
        cohort_entry = gets.strip
      end
      if cohort_entry.empty?
        cohort = "N/A"
      else cohort = cohort_entry
      end
  
    puts "And what's their favourite Hobby?"
    hobby = gets.strip
    puts "And finally, what country were they born in?"
    country = gets.strip
    #  add the student hash to the array
    students << {name: name, cohort: cohort, hobby: hobby, origin_country: country}
    #get another name from the user
    puts "Thank you, now the next student please."
    name = gets.strip
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
  if students.count < 2
  output_4 = "Overall, we have #{students.count} great student"
  puts output_4.center(100)
  else
  output_5 = "Overall, we have #{students.count} great students"
  puts output_5.center(100)
  end
end


students = input_students
print_header
if students.length > 0
  print(students)
  print_footer(students)
end