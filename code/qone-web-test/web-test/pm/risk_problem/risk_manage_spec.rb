require_relative '../../load_helper'

module WebTest
  module Pm
    module RiskProblem
      describe 'risk manage page'do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :pm,driver
          @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
          @project_list_page = @page_container.project_list_page
          @risk_manage_page = @page_container.risk_manage_page
          @project_list_page.to_this_page
          project_name = @pm_profiles['project_list']['project_name']
          @project_list_page.enter_project project_name
          @risk_manage_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        describe 'menu and link page check testing'do

          it'risk manage menu click be success'do
            risk_manage_title = @pm_profiles['risk_problem']['risk_manage_title']
          actual_top_title = @risk_manage_page.top_title
          actual_top_title.should == risk_manage_title
          end
          it 'to add risk page be success'do
             add_risk_title = @pm_profiles['risk_problem']['add_risk']
            actual_top_title = @risk_manage_page.add_risk_page_check
             actual_top_title.should == add_risk_title
          end

          it 'add risk to import organization level risk page be success'do
           import_organization_risk_title = @pm_profiles['risk_problem']['organization_level_risk_list']
            actual_top_title = @risk_manage_page.add_risk_to_import_organization_risk_page_check
            actual_top_title.should == import_organization_risk_title
          end

        it 'import organization level risk page be success'do
             import_organization_risk_title = @pm_profiles['risk_problem']['organization_level_risk_list']

             actual_top_title = @risk_manage_page.import_organization_risk_page_check
             actual_top_title.should == import_organization_risk_title
        end

          it 'alter risk page be success'do
            alter_risk_title = @pm_profiles['risk_problem']['alter_risk_title']
            actual_top_title = @risk_manage_page.alter_risk_page_check
            actual_top_title.should == alter_risk_title
          end

          it 'view risk page be success'do
             view_risk_title = @pm_profiles['risk_problem']['view_risk_title']
            actual_top_title = @risk_manage_page.view_risk_page_check
            actual_top_title.should == view_risk_title
          end

          it 'view problem page be success'do
            view_problem_title = @pm_profiles['risk_problem']['view_problem_title']
            actual_top_title = @risk_manage_page.view_switch_problem_page_check
            actual_top_title.should == view_problem_title
          end

          #it 'view problem print page be success'do  #have problem
          #  problem_print_title = @pm_profiles['risk_problem']['problem_print_title']
          #   actual_top_title = @risk_manage_page.view_problem_print_page_check
          #    actual_top_title.should == problem_print_title
          #end

        it 'view risk list print page 'do
           risk_list_print_title =@pm_profiles['risk_problem']['risk_manage_title']
           actual_top_title = @risk_manage_page.risk_list_print_page_check
          actual_top_title.should == risk_list_print_title
          end
        end

      end
    end #RiskProblem
  end # Pm
end  # WebTest