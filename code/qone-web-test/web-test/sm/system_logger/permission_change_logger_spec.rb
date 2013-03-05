require_relative '../../load_helper'

module WebTest
  module Sm
    module SystemLogger

      describe 'permission change logger page' do
        before :all do
          driver = Support::Login.login :name=>'ssa', :pwd=>'intec'
          @page_container = WebDriver.create_page_container :sm, driver
          @sm_profiles = Helper::ReadProfiles.apps_res_zh :sm
          @permission_change_logger_page = @page_container.permission_change_logger_page
          @permission_change_logger_page.to_this_page
        end

        after :all do
          @page_container.close
        end
        describe 'menu and link page check testing ' do

          it 'permission change logger page menu click success?' do
            expect_top_title = @sm_profiles['system_logger']['permission_change_logger']
            actual_top_title = @permission_change_logger_page.top_title
            actual_top_title.should == expect_top_title
          end

          it 'system permission change tab page check testing success? 'do
            @permission_change_logger_page.to_system_permission_change_tab_page
            expect = true
            actual = @permission_change_logger_page.system_permission_change_page_flag
            actual = expect
          end

          it 'role Permission Change tab page check testing success?' do
             @permission_change_logger_page.to_role_permission_change_tab_page
            expect = true
            actual = @permission_change_logger_page.role_permission_change_page_flag
            actual = expect
          end

           it 'project permission change tab page check testing success?' do
             @permission_change_logger_page.to_project_permission_change_tab_page
             expect = true
             actual = @permission_change_logger_page.project_permission_change_page_flag
             actual = expect
          end


        end
      end
    end # SystemLogger
  end # Sm
end # WebTest