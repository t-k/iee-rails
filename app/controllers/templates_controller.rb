class TemplatesController < ApplicationController

  def index
    return render :json =>
      {
        :category => "Templates",
        :templates => [
          {
            :name => "Column Drop"
          },
          {
            :name => "2 Equal-Width Columns"
          },
          {
            :name => "3 Equal-Width Columns"
          },
          {
            :name => "Shrink Wrap"
          },
          {
            :name => "Main Column w/ Sidebar"
          },
          {
            :name => "Image Surround"
          },
          {
            :name => "Layout Shifter"
          },
          {
            :name => "Source Order Shift"
          },
        ]
      }
  end

end
