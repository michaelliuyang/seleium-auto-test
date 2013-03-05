require_relative '../../load_helper'

module WebTest
  module Sm
    module StaffManage
      
      describe 'work group manage page' do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :sm,driver
          @sm_profiles = Helper::ReadProfiles.apps_res_zh :sm
          @work_group_manage_page = @page_container.work_group_manage_page
          @work_group_manage_page.to_this_page
        end
      
        after :all do
          @page_container.close
        end
        
        it 'work group manage menu click success?' do
          work_group_menu_name = @sm_profiles['staff_manage']['work_group_manage']
          actual = @work_group_manage_page.top_title
          actual.should ==  work_group_menu_name
        end

        it 'add work_group test success' do
          add_work_group_name = @sm_profiles['staff_manage']['add_work_group_name']
          @work_group_manage_page.add_work_group add_work_group_name
          actual_flag = @work_group_manage_page.find_work_group_under_organization add_work_group_name
          expect_flag = true
          actual_flag.should == expect_flag

        end

      end
    end # StaffManage
  end # Sm
end # WebTest