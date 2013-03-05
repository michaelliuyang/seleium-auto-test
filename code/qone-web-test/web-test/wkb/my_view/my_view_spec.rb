require_relative '../../load_helper'

module WebTest
  module Wkb
    module MyView
     describe 'my view page ' do
       before :all do
         driver = Support::Login.login
         @page_container = WebDriver.create_page_container :wkb,driver
         @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
         @my_view_page = @page_container.my_view_page
         @my_view_page.to_this_page
       end
       after :all do
         @page_container.close
       end

       it 'my view page menu click test success?' do
         expect_my_view_page_title = @wkb_profiles['my_view']['my_view_page_title']
         actual_my_view_page_title = @my_view_page.title
         actual_my_view_page_title.should == expect_my_view_page_title
       end

       it 'add component success?' do
         new_component_name = @my_view_page.add_component
         component_number = @my_view_page.component_number new_component_name
         @my_view_page.add_component
         @my_view_page.component_number(new_component_name).should == (component_number + 1)
       end

       it 'delete component success?' do
         first_component_name = @my_view_page.first_component_name
         component_number = @my_view_page.component_number first_component_name
         @my_view_page.remove_component
         sleep 5  # Waiting for page to refresh
         @my_view_page.component_number(first_component_name).should == (component_number - 1)
       end

     end
    end# MyView

  end #  Wkb

end # WebTest
