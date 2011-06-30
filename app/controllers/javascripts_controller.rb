class JavascriptsController < ApplicationController
  def dynamic_schools
    @schools=Schools.all
  end

end
