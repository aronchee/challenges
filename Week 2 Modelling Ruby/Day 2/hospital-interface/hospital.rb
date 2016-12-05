# Write your code here!
require 'byebug'

class Hospital

	def initialize(name, location, employees, patients)
		@name = name
		@location = location
		@employees = employees #number of employees
		@patients = patients #number of patients
	end

end

class Employee 
	attr_reader :name, :security_level

 # 	def initialize(name)
 # 		@name = name
 # 		@security_level = 2
	# end

	def can_access_patient_documents?
		return true if security_level > 1
		false
	end

end

class Patient
	attr_accessor :name

	def initilize(name)
		@name = name
	end

end

class Doctor < Employee
	attr_reader :name, :security_level

	def initialize(name)
		@name = name 
		@security_level = 2
	end

end

class Administartor < Employee
	attr_reader :name, :security_level

	def initialize(name)
		@name = name
		@security_level = 3
	end

end

class Janitor < Employee

	def initialize
		@security_level = 1
	end

end

class Folder
	attr_accessor :patient_list, :employee_list
	def initialize
		@patient_list = ["mayuyu", "yuki"]
		@employee_list = ["sakura", "aron"]
	end

	def add_patient
		puts "Add new patient?"
		new_patient = gets.chomp
		person = Patient.new(new_patient)
		@patient_list << person.name
	end

	def remove_patient
		puts "Remove patient?"
		patient_name = gets.chomp
		@patient_list = @patient_list.delete_if{ |p| p.name == patient_name } 
		#delete a patient when patient.name = patient_name
	end

	def add_doctor
		puts "Add new employee?"
		new_doctor = gets.chomp
		person = Doctor.new(new_doctor)
		@employee_list << person.name
	end

	def remove_employee
		puts "Remove an employee?"
		employee_name = gets.chomp
		@employee_list = @employee_list.delete_if{ |e| e.name == employee_name}
	end

end

def menu(person, option)

	puts "Welcome, #{person.name}. Your security_level is #{person.security_level}"
	puts "what would you like to do?"
	puts "1. see patient list"
	puts "2. see doctor list"
	puts "3. add patient"
	puts "4. remove patient"
	puts "5. add employee"
	puts "6. remove employee"
	puts "or press any other key to exit"
	answer = gets.chomp
	if answer == "1" 
		puts option.patient_list
	elsif answer == "2"
		puts option.employee_list
	elsif answer == "3"
		option.add_patient
	elsif answer == "4"
		option.remove_patient
	elsif answer == "5"
		option.add_doctor
	elsif answer == "6"
		option.remove_employee
	else
		end_program?
	end

end

def end_program?
	puts "Exit this program? [Y/N]"
	answer = gets.chomp.upcase
	return true if answer == "Y"
	return false
end

puts "---------------------------------"
puts "> Welcome to Misty River Hospital"
puts "---------------------------------"
puts "Please enter your username"
username = gets.chomp
puts "Please enter your password"
password = gets.chomp
puts "---------------------------------"
option = Folder.new
puts "---------------------------------"

while true do
	if username == "admin" && password =="admin"
		person = Administartor.new("Admin")
		menu(person, option)
		if end_program? == true
			break
		end
	elsif username == "doctor" && password == "doctor"
		person = Doctor.new("Doctor")
		menu(person, option)
		if end_program? == true
			break
		end
	else
		puts "Error raised. You are virus!!!"
		break
	end
end