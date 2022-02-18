#The array of students
students = [
    "Dr. Hannibal Lecter",
    "Darth Vader",
    "Nurse Ratched",
    "Michael Corleone",
    "Alex DeLarge",
    "The Wicked Witch of the West",
    "Terminator",
    "Freddy Krueger",
    "The Joker",
    "Joffrey Baratheon",
    "Norman Bates"
]
#Print all students and list the nubmer of them
puts "The students of Villians Academy"
puts "-------------"
students.each do |student|
  puts student
end
puts "Overall, we have #{students.count} great students"