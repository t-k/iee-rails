class TemplatesController < ApplicationController

  def get_list
    return render :json =>
      {
        :category => "Templates",
        :templates => [
          {
            :name => "Column Drop",
            :id => "1"
          },
          {
            :name => "2 Equal-Width Columns",
            :id => "2"
          },
          {
            :name => "3 Equal-Width Columns",
            :id => "3"
          },
          {
            :name => "Shrink Wrap",
            :id => "4"
          },
          {
            :name => "Main Column w/ Sidebar",
            :id => "5"
          },
          {
            :name => "Image Surround",
            :id => "6"
          },
          {
            :name => "Layout Shifter",
            :id => "7"
          },
          {
            :name => "Source Order Shift",
            :id => "8"
          }
        ]
      }
  end

end
