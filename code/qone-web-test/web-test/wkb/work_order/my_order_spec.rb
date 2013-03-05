require_relative '../../load_helper'

module WebTest
  module Wkb
    module WorkOrder
      describe 'my order page' do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :wkb, driver
          @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
          @my_order_page = @page_container.my_order_page
          @my_order_page.to_this_page

        end
        after :all do
          @page_container.close
        end
        it 'my order menu click success?' do
          my_order = @wkb_profiles['work_order']['my_order']

          actual_top_title = @my_order_page.top_title
          actual_top_title.should == my_order
        end
      end
    end #WorkOrder
  end #Wkb
end #WebTest