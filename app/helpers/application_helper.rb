module ApplicationHelper
  
  def name(user)
    if signed_in?
      if user.id==current_user.id
        'You'
      else
        user.first_name + " " + user.last_name
      end
    end
  end
  
  def punctuate(words)
    if words.split('').last == "." 
      words.split('').first.capitalize!.to_s
    elsif words.split('').last == "?" 
      words.split('').first.capitalize!.to_s
    elsif words.split('').last == "!" 
      words.split('').first.capitalize!.to_s
    else
      words + "."
    end
    
  end
  
  def markdown(text)
    options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :filter_styles, :no_image, :safelink, :strikethrough]
      Redcarpet.new(text, *options).to_html.html_safe
  end
  
  def college
    if signed_in?
      College.find(current_user.college_id).name
    end
  end
  
  def schools
    if signed_in?
        all_schools_for_college=College.find(current_user.college_id).schools
    end
  end
  
  def dorms
    if signed_in?
      all_dorms_for_college=College.find(current_user.college_id).dorms
    end
  end
  def tags
    if signed_in?
      all_tags_for_college=Tag.all
    end
  end

  
  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end

  

end
