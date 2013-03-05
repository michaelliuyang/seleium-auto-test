require_relative '../../load_helper'

module WebTest
  module Sm
    module SystemLogger
      describe 'other logger page' do

        before :all do
          driver = Support::Login.login :name=>'ssa',:pwd=>'intec'
          @page_container = WebDriver.create_page_container :sm,driver
          @sm_profiles = Helper::ReadProfiles.apps_res_zh :sm
          @other_logger_page = @page_container.other_logger_page
          @other_logger_page.to_this_page
        end

        after :all do
         @page_container.close
        end

        it 'other logger page menu click success?' do
          expect_top_title = @sm_profiles['system_logger']['other_logger_top_title']
          actual_top_title =@other_logger_page.top_title
          actual_top_title.should == expect_top_title
        end

        it 'project operate log button' do
          @other_logger_page.project_operate_log_button_click
          expect = true
          actual =  @other_logger_page.download_alert_pop_up?
          actual.should == expect
        end

        it 'enum data operate log button' do
          @other_logger_page.enum_data_operate_log_button_click
          expect = true
          actual =  @other_logger_page.download_alert_pop_up?
          actual.should == expect
        end

        it 'project monitor parameter log button' do
          @other_logger_page.project_monitor_parameter_log_button_click
          expect = true
          actual =  @other_logger_page.download_alert_pop_up?
          actual.should == expect
        end

        it 'service_set  log button' do
          @other_logger_page.service_set_log_button_click
          expect = true
          actual =  @other_logger_page.download_alert_pop_up?
          actual.should == expect
        end

        it 'message_set log button' do
          @other_logger_page.message_set_log_button_click
          expect = true
          actual =  @other_logger_page.download_alert_pop_up?
          actual.should == expect
        end

        it 'organization_set log button' do
          @other_logger_page.organization_set_log_button_click
          expect = true
          actual =  @other_logger_page.download_alert_pop_up?
          actual.should == expect
        end

         it 'general_user log button' do
          @other_logger_page.general_user_log_button_click
          expect = true
          actual =  @other_logger_page.download_alert_pop_up?
          actual.should == expect
        end

      end
    end# SystemLogger
  end  # Sm
end #WebTest