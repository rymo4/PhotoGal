module ApplicationHelper
  
  def college
    if signed_in?
      College.find(current_user.college_id).name
    end
  end
  
  def schools
    if signed_in?
      all_schools_for_college=[]
      College.find(current_user.college_id).schools.each do |school|
        all_schools_for_college<<school.name
      end
        all_schools_for_college
    end
  end
  
  def dorms
    if signed_in?
      #all_dorms_for_college=[]
      #College.find(current_user.college_id).dorms.each do |dorm|
       # all_dorms_for_college<<dorm.name
      #end
      all_dorms_for_college=College.find(current_user.college_id).dorms
    end
  end

  
  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end

  

end
