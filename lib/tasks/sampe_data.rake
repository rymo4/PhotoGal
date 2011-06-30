require 'find'  

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_colleges_with_schools_and_dorms
    make_user
  end
end
  
def make_user
    admin = User.create!(:first_name => "Ryder",
                         :last_name => "Moody",
                         :email => "RydTheMoodster@gmail.com",
                         :password => "password",
                         :password_confirmation => "password",
                         :college_id => 1,
                         :year => 2014,
                         :school_id => School.find_by_name('SEAS').id,
                         :dorm_id => Dorm.find_by_name('Watt').id 
                         )
    admin.toggle!(:admin)
end



def make_colleges_with_schools_and_dorms

  College.create!(:name => "Columbia University")
  Dorm.create!(:college_id=>College.find_by_name("Columbia University").id, :name=>"Carman")
  Dorm.create!(:college_id=>College.find_by_name("Columbia University").id, :name=>"Wallach") 
  Dorm.create!(:college_id=>College.find_by_name("Columbia University").id, :name=>"John Jay") 
  Dorm.create!(:college_id=>College.find_by_name("Columbia University").id, :name=>"Watt")
  Dorm.create!(:college_id=>College.find_by_name("Columbia University").id, :name=>"East Campus")
  Dorm.create!(:college_id=>College.find_by_name("Columbia University").id, :name=>"Wein") 
  Dorm.create!(:college_id=>College.find_by_name("Columbia University").id, :name=>"Furnald") 
  Dorm.create!(:college_id=>College.find_by_name("Columbia University").id, :name=>"Schapiro")
  Dorm.create!(:college_id=>College.find_by_name("Columbia University").id, :name=>"Hartley")
  Dorm.create!(:college_id=>College.find_by_name("Columbia University").id, :name=>"Harmony") 
  Dorm.create!(:college_id=>College.find_by_name("Columbia University").id, :name=>"Ruggles") 
  Dorm.create!(:college_id=>College.find_by_name("Columbia University").id, :name=>"McBain")  
  Dorm.create!(:college_id=>College.find_by_name("Columbia University").id, :name=>"McBain")  
  Dorm.create!(:college_id=>College.find_by_name("Columbia University").id, :name=>"Hogan") 
  Dorm.create!(:college_id=>College.find_by_name("Columbia University").id, :name=>"47 Claremont")
  Dorm.create!(:college_id=>College.find_by_name("Columbia University").id, :name=>"Nussbaum")
  Dorm.create!(:college_id=>College.find_by_name("Columbia University").id, :name=>"Broadway")
  Dorm.create!(:college_id=>College.find_by_name("Columbia University").id, :name=>"River") 
  Dorm.create!(:college_id=>College.find_by_name("Columbia University").id, :name=>"Woodbridge") 
  Dorm.create!(:college_id=>College.find_by_name("Columbia University").id, :name=>"Off Campus Housing")   
  School.create!(:college_id=>College.find_by_name("Columbia University").id, :name=>'SEAS')
  School.create!(:college_id=>College.find_by_name("Columbia University").id, :name=>'CC')
  School.create!(:college_id=>College.find_by_name("Columbia University").id, :name=>'GS')
  School.create!(:college_id=>College.find_by_name("Columbia University").id, :name=>'JTS')
     
end




    
 
