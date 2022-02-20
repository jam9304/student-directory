@students = [] #global variable

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  name = STDIN.gets.strip
  cohort_check = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", "N/A", ""]
  
  #while the name is not empty, repeat this code
  while !name.empty? do
    puts "And what cohort are they in?"
    cohort_entry = STDIN.gets.strip
      while !cohort_check.include?(cohort_entry)
        puts "Please re enter the cohort or state 'N/A'"
        cohort_entry = STDIN.gets.strip
      end
      if cohort_entry.empty?
        cohort = "N/A"
      else cohort = cohort_entry
      end
  
    puts "And what's their favourite Hobby?"
    hobby = STDIN.gets.strip
    puts "And finally, what country were they born in?"
    country = STDIN.gets.strip
    #  add the student hash to the array
    @students << {name: name, cohort: cohort, hobby: hobby, origin_country: country}
    #get another name from the user
    puts "Thank you, now the next student please."
    name = STDIN.gets.strip
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

def print_students_list
    @students.each_with_index do |student, number|  
    output_3 = "#{number + 1}. #{student[:name]} (#{student[:cohort]} cohort). They were born in #{student[:origin_country]} and enjoys #{student[:hobby]}" 
    puts output_3.center(100)
  end
end


def print_footer
  puts " " #just to get a line split the end result
  if @students.count < 2
  output_4 = "Overall, we have #{@students.count} great student"
  puts output_4.center(100)
  else
  output_5 = "Overall, we have #{@students.count} great students"
  puts output_5.center(100)
  end
end

def print_menu
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit" 
end

def show_students
  print_header
  print_students_list
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
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:origin_country], student[:hobby]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort, country, hobby = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym, origin_country: country, hobby: hobby}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
