require 'find'  

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_user
    make_colleges
  end
end
  
def make_user
    admin = User.create!(:first_name => "Ryder",
                         :last_name => "Moody",
                         :email => "RydTheMoodster@gmail.com",
                         :password => "password",
                         :password_confirmation => "password",
                         :college_id => 1 
                         )
    admin.toggle!(:admin)
end



def make_colleges   

  College.create!(:name => "Columbia University", :schools=>'CC, SEAS', 
    :dorms =>'Carmen, Wallach, John Jay, Watt, East Campus, Wein, Furnald, Schipiro, Hartley, Harmony, Ruggles, McBain, Hogan, Off Campus')
     
end




    
 
