class HomeController < ApplicationController
  def index
    unless Setting.is_first_load?
      print("aaaaaaaabbbb")
      Make.get_make_info
    end

    @makes = Make.all
    print(@makes.count)
  end
end
