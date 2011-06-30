class JavascriptsController < ApplicationController
  def dynamic_schools
    @schools=School.all
  end
  
  def dynamic_dorms
    @dorms=Dorm.all
  end

end
