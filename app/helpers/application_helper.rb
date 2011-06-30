module ApplicationHelper
  
  def college
    College.find(current_user.college_id).name
  end
  
  def schools
    all_schools_for_college=[]
    College.find(current_user.college_id).schools.each do |school|
      all_schools_for_college<<school.name
    end
      all_schools_for_college
  end
  
  def dorms
    all_dorms_for_college=[]
    College.find(current_user.college_id).dorms.each do |dorm|
      all_dorms_for_college<<dorm.name
    end
      all_dorms_for_college
  end
  
  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end

  

end
