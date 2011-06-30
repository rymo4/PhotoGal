module CollegesHelper
  def schools(college_id, school_num)
    if (num>=0)
      College.find(college_id).schools.split(', ')[school_num]
    else
      nil
    end
  end
end
