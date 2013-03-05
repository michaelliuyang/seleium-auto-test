require_relative '../../load_helper'

module WebTest
  module Wkb
    module WorkOrder
      describe 'create order page' do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :wkb, driver
          @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
          @data_wkb = Helper::ReadProfiles.data :wkb
          @create_order_page = @page_container.create_order_page
          @create_order_page.to_this_page

        end
        after :all do
          @page_container.close
        end
        it 'create order menu click success?' do
          
          create_order = @wkb_profiles['create_order']['create_order']
          actual_top_title = @create_order_page.top_title
          actual_top_title.should == create_order
        end
        it 'start order success ?' do
          order_name = @data_wkb['create_order']['order_name']
          order_type = @data_wkb['create_order']['order_type']
          project_name = @data_wkb['create_order']['project_name']
          expect_success_notice = @wkb_profiles['create_order']['expect_success_notice']
          expect_order_title_name = @create_order_page.start_order(order_name,order_type,project_name)
          actual_success_notice = @create_order_page.notice_success.text
          actual_success_notice.should == expect_success_notice
          @create_order_page.click_my_order_link
          my_order_page = @page_container.my_order_page
          actual_order_title = my_order_page.order_title
          actual_order_title.should == expect_order_title_name

        end
      end
    end #WorkOrder
  end #Wkb
end #WebTest