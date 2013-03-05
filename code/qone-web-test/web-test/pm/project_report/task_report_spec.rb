require_relative '../../load_helper'
module WebTest
   module Pm
     module ProjectReport
       
       describe 'task report page' do
               
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
          @task_report_page = @page_container.task_report_page
          @task_report_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu page test' do
          #given
          project_task_list = @pm_profiles['project_report']['project_task_list']
          #when
          actual_top_title = @task_report_page.top_title
          #then
          actual_top_title.should == project_task_list
        end
        
        it 'examination conclution task success?' do
          #given
          task_report_title = @pm_profiles['project_report']['task_report_title']
          task_report_for_find = @pm_data['project_report']['task_report_for_find']
          examination_conclution = @pm_data['project_report']['examination_conclution']
          #when
          actual_top_title = @task_report_page.examination_and_approval_task_report task_report_for_find,examination_conclution
          #then
          actual_top_title.should == task_report_title
        end
        
        it 'look task report success?' do
          #given
          task_report_title = @pm_profiles['project_report']['task_report_title']
          task_report_for_look = @pm_data['project_report']['task_report_for_look']
          #when
          actual_top_title = @task_report_page.look_task_report task_report_for_look
          #then
          actual_top_title.should == task_report_title
        end
        
        it 'click task name super link success?' do
          #given
          task_information = @pm_profiles['project_report']['task_information']
          task_report_for_look = @pm_data['project_report']['task_report_for_look']
          #when
          actual_top_title = @task_report_page.look_task_report_detail(task_report_for_look)
          #then
          actual_top_title.should == task_information
        end
        
      end  # describe
    end   #  ProjectReport
  end   # Pm
end # WebTest



