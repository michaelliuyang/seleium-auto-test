require_relative '../../load_helper'

module WebTest
  module Pm
    module RiskProblem
      describe 'problem mange page' do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :pm, driver
          @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
          @project_list_page = @page_container.project_list_page
          @problem_manage_page = @page_container.problem_manage_page
          @project_list_page.to_this_page
          project_name = @pm_profiles['project_list']['project_name']
          @project_list_page.enter_project project_name
          @problem_manage_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        describe 'menu and link page check testing' do

          it'problem manage menu click be success'do
          problem_manage_title = @pm_profiles['risk_problem']['problem_manage_title']
          actual_top_title = @problem_manage_page.top_title
          actual_top_title.should ==  problem_manage_title
          end

         it 'add problem page be success'do
           add_problem_title = @pm_profiles['risk_problem']['add_problem_title']
           actual_title = @problem_manage_page.add_problem_page_check
           actual_title.should == add_problem_title
         end

          it 'add problem to task page be success'do
            task_title = @pm_profiles['risk_problem']['task_title']
            actual_title = @problem_manage_page.add_problem_to_task_page_check
            actual_title.should == task_title
          end

         it 'import problem page be success'do
           import_problem_sign = @pm_profiles['risk_problem']['import_problem_sign']
           actual_sign = @problem_manage_page.import_problem_page_check
           actual_sign.should == import_problem_sign
         end
          it 'export problem page be success'do
            export_problem_sign = @pm_profiles['risk_problem']['export_problem_sign']
            actual_sign = @problem_manage_page.export_problem_page_check
            actual_sign.should == export_problem_sign
          end
          it 'view problem page be success'do
            view_problem_title = @pm_profiles['risk_problem']['view_problem_title']
            actual_title = @problem_manage_page.view_problem_page_check
            actual_title.should == view_problem_title
          end

          it 'view problem to print page be success' do
            problem_print_title = @pm_profiles['risk_problem']['problem_print_title']
            actual_title = @problem_manage_page.view_problem_print_page_check
            actual_title.should == problem_print_title
          end

          it 'prblem list print page be success' do
            problem_list_print_title = @pm_profiles['risk_problem']['problem_list_print_title']
            actual_title = @problem_manage_page.problem_list_print_page_check
            actual_title.should == problem_list_print_title
          end

          it 'alter problem page be success'do
             alter_problem_title = @pm_profiles['risk_problem']['alter_problem_title']
            actual_title = @problem_manage_page.alter_problem_page_check
            actual_title.should == alter_problem_title
          end

          it 'turn task page be success'do
            task_information = @pm_profiles['risk_problem']['task_information']
            actual_title = @problem_manage_page.turn_task_page_check
            actual_title.should == task_information
          end

          it 'change identify problem tab '    do
            identify_problem_title = @pm_profiles['risk_problem']['identify_problem_title']
            actual_title = @problem_manage_page.change_identify_problem_tab_page_check
            actual_title.should == identify_problem_title
          end

        end
      end
    end #RiskProblem
  end # Pm
end # WebTest