def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  name = gets.chomp
  cohort_check = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", "N/A", ""]
  
  #while the name is not empty, repeat this code
  while !name.empty? do
    puts "And what cohort are they in?"
    cohort_entry = gets.chomp
      while !cohort_check.include?(cohort_entry)
        puts "Please re enter the cohort or state 'N/A'"
        cohort_entry = gets.chomp
      end
      if cohort_entry.empty?
        cohort = "N/A"
      else cohort = cohort_entry
      end
  
    puts "And what's their favourite Hobby?"
    hobby = gets.chomp
    puts "And finally, what country were they born in?"
    country = gets.chomp
    #  add the student hash to the array
    students << {name: name, cohort: cohort, hobby: hobby, origin_country: country}
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
  puts "What cohort would you like to see?"
  cohort_to_view = gets.chomp
  viewable_cohort = []
  students.map do |student|
    if student[:cohort] == cohort_to_view
      viewable_cohort.push(student)
    end
  end
  viewable_cohort.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
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