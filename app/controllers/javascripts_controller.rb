class JavascriptsController < ApplicationController
  def dynamic_schools
    College.all.each do |college|
      @schools<<college.schools.split(', ')
    end
    @schools
  end

end
