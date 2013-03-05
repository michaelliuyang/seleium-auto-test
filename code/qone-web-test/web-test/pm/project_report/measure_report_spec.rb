require_relative '../../load_helper'
module WebTest
   module Pm
     module ProjectReport
          
        describe 'measure report  page' do
        before :all do
          @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
          @pm_data = Helper::ReadProfiles.data :pm
          @pm_login_name = @pm_profiles['pm_login_name']
          @pm_password = @pm_profiles['password']
          @driver = Support::Login.login(:name => @pm_login_name, :pwd => @pm_password)
          @page_container = WebDriver.create_page_container :pm, @driver
          @project_list_page = @page_container.project_list_page
          @project_list_page.to_this_page
          project_name = @pm_data['project_list']['project_name']
          @project_list_page.enter_project project_name
          @measure_report_page = @page_container.measure_report_page
          @measure_report_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu page test' do
          #given
          project_measure_active_list = @pm_profiles['project_report']['project_measure_active_list']
          #when
          actual_top_title = @measure_report_page.top_title
          #then
          actual_top_title.should == project_measure_active_list
        end
        
        it 'click measurement of target tab success?' do
          #given
          measure_of_target_title = @pm_profiles['project_report']['measure_of_target_title']
          #when
          actual_top_title = @measure_report_page.measurement_of_target_tab
          #then
          actual_top_title.should == measure_of_target_title
        end
        
        it 'click measurement of activity tab success?' do
          #given
          measure_of_activity_title = @pm_profiles['project_report']['measure_of_activity_title']
          #when
          actual_top_title = @measure_report_page.measurement_of_activity_tab
          #then
          actual_top_title.should == measure_of_activity_title
        end
        
        it 'click plan summary tab success?' do
          #given
          plan_summary_title = @pm_profiles['project_report']['plan_summary_title']
          #when
          actual_top_title = @measure_report_page.plan_summary_tab
          #then
          actual_top_title.should == plan_summary_title
        end
        
       end  # describ
     end   #  ProjectReport
   end   # Pm
end # WebTest
