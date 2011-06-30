require 'find'  

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_user
    make_colleges_with_schools
  end
end
  
def make_user
    admin = User.create!(:first_name => "Ryder",
                         :last_name => "Moody",
                         :email => "RydTheMoodster@gmail.com",
                         :password => "password",
                         :password_confirmation => "password",
                         :college_id => 1,
                         :year => 2014 
                         )
    admin.toggle!(:admin)
end



def make_colleges_with_schools

  College.create!(:name => "Columbia University",  
    :dorms =>'Carmen, Wallach, John Jay, Watt, East Campus, Wein, Furnald, Schipiro, Hartley, Harmony, Ruggles, McBain, Hogan, Off Campus')
  School.create!(:name=>'SEAS', :college_id=>College.find_by_name("Columbia University"))
  School.create!(:name=>'CC', :college_id=>College.find_by_name("Columbia University"))
     
end




    
 
