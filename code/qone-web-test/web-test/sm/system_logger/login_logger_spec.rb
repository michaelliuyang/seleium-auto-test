require_relative '../../load_helper'

module WebTest
  module Sm
    module SystemLogger

      describe 'Login logger page' do
        before :all do
          driver = Support::Login.login :name=>'ssa', :pwd=>'intec'
          @page_container = WebDriver.create_page_container :sm, driver
          @sm_profiles = Helper::ReadProfiles.apps_res_zh :sm
          @login_logger_page = @page_container.login_logger_page
          @login_logger_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        describe 'menu and link page check testing ' do

          it 'login logger page menu click success?' do
            expect_top_title = @sm_profiles['system_logger']['login_logger']
            actual_top_title = @login_logger_page.top_title
            actual_top_title.should == expect_top_title
          end

          it 'system login monitor tab page check testing success? ' do
            expect = @sm_profiles['system_logger']['system_monitor_status']
            @login_logger_page.to_system_monitor_tab_page
            actual = @login_logger_page.system_monitor_page_flag_text
            actual.should == expect
          end

          it 'system login log tab page check testing success?' do
            expect = @sm_profiles['system_logger']['login_time_field']
            @login_logger_page.to_system_log_tab_page
            actual = @login_logger_page.system_log_flag_text
            actual.should == expect
          end

        end
      end
    end # SystemLogger
  end # Sm
end # WebTest