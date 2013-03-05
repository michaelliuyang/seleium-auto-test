require_relative '../../load_helper'

module WebTest
  module Sm
    module SystemSettings
      
      describe 'role setting page' do
        before :all do
          @sm_profiles = Helper::ReadProfiles.apps_res_zh :sm
          @ss_login_name =@sm_profiles['ss_login_name']
          @ss_password =@sm_profiles['password']
          driver = Support::Login.login(:name=>@ss_login_name, :pwd=>@ss_password)
          @page_container = WebDriver.create_page_container :sm,driver
          @role_setting_page = @page_container.role_setting_page
          @role_setting_page.to_this_page
        end
      
        after :all do
          @page_container.close
        end
        
        it 'role setting menu click success?' do
          expect_top_title = @sm_profiles['system_settings']['role_setting_top_title']
          actual_top_title = @role_setting_page.top_title
          actual_top_title.should ==  expect_top_title
        end

        it 'add system role test success? ' do
          add_role_name = @sm_profiles['system_settings']['add_role_name']
          expect_notice = @sm_profiles['system_settings']['add_role_notice_success']
          @role_setting_page.add_system_role_function add_role_name
          actual = @role_setting_page.notice_success_text
          actual.should == expect_notice
          @role_setting_page.notice_success_click
        end

        it 'alter role name test success' do
          name = @sm_profiles['system_settings']['add_role_name']
          new_name = @sm_profiles['system_settings']['alter_role_name']
          expect_notice = @sm_profiles['system_settings']['add_role_notice_success']
          @role_setting_page.alter_role_name name,new_name
          actual = @role_setting_page.notice_success_text
          actual.should == expect_notice
          @role_setting_page.notice_success_click
        end

        it 'del role name test success' do
           del_name = @sm_profiles['system_settings']['alter_role_name']
           expect_flag = -1
           @role_setting_page.del_role_name del_name
           actual = @role_setting_page.find_row_by_role_name del_name
           actual.should == expect_flag

        end

        it 'view role link page check testing'do
          #expect_name = @sm_profiles['system_settings']['view_role']
          name = @sm_profiles['system_settings']['view_role_name']
          actual =  @role_setting_page.view_role_by_name name
          actual.should == name
        end

       end
    end # SystemSettings
  end # Sm
end # WebTest