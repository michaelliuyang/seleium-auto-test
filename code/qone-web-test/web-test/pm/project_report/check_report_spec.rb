require_relative '../../load_helper'
module WebTest
   module Pm
     module ProjectReport
        
          describe 'check report page' do
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
            @check_report_page = @page_container.check_report_page
            @check_report_page.to_this_page
          end

          after :all do
            @page_container.close
          end

          it 'menu page test' do
            #given
            write_check_report = @pm_profiles['project_report']['write_check_report']
            #when
            actual_top_title = @check_report_page.top_title
            #then
            actual_top_title.should == write_check_report
          end
          
          it 'write inspection report success?' do
            #given
            write_check_report = @pm_profiles['project_report']['write_check_report']
            project_overview = @pm_data['project_report']['project_overview_for_add']
            software_actual_size = @pm_data['project_report']['software_actual_size_for_add']
            software_reusability = @pm_data['project_report']['software_reusability_for_add']
            productivity_evaluation = @pm_data['project_report']['productivity_evaluation_for_add']
            acceptance_advice = @pm_data['project_report']['acceptance_advice_for_add']
            #when
            @check_report_page.write_inspection_report(project_overview,software_actual_size,software_reusability,productivity_evaluation,acceptance_advice)
            #then
            #actual_top_title.should == write_check_report
          end

          end  # describe
     end   #  ProjectReport
   end   # Pm
end # WebTest


