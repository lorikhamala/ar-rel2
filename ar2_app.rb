 require "sinatra"
 require "sinatra/reloader"
 require "sinatra/activerecord"
  
set :database, { adapter: "sqlite3", database: "mydb.db" }

require './models/college_class'
require './models/student'
require './models/student_class'

get '/' do
	@college_class = CollegeClass.all
	@students = Student.all
	@student_class = StudentClass.all
	erb :admin
end 

get '/viewstudents' do
    @college_class = CollegeClass.all
	@students = Student.all
	@student_class = StudentClass.all
	erb :viewstudents
end 

get '/displaystudent' do
    @college_class = CollegeClass.all
	@students = Student.all
	@student_class = StudentClass.all
	erb :displaystudent
end 

get '/viewclasses' do
    @college_class = CollegeClass.all
	@students = Student.all
	@student_class = StudentClass.all
	erb :viewclasses
end 

get '/displayclass/:id' do
	@collegeclass = CollegeClass.find(params[:id])
	if @collegeclass.nil?
		return "Class not found"
	end 
	@college_class = CollegeClass.all
	@students = Student.all
	@student_class = StudentClass.all
	erb :displayclass
end 
		

get '/displaystudent/:id' do   #this finds the id number of the user
   @student = Student.find(params[:id]) #finds the user id that corresponds to that parameter
   if @student.nil?
      return "Student not found"
   end 
   erb :displaystudent
end 