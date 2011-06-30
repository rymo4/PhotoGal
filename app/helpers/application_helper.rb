module ApplicationHelper
  
  def college
    College.find(current_user.college).name
  end
  
  def schools
    College.find(current_user.college).schools.split(', ')
  end
end
