require_relative '../../load_helper'

module WebTest
  module Pm
    module RiskProblem
      describe 'risk count page'do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :pm,driver
          @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
          @project_list_page = @page_container.project_list_page
          @risk_count_page = @page_container.risk_count_page
          @project_list_page.to_this_page
          project_name = @pm_profiles['project_list']['project_name']
          @project_list_page.enter_project project_name
          @risk_count_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        describe 'menu and link page check testing'do

          it'risk count menu click be success'do
            risk_count_title = @pm_profiles['risk_problem']['risk_count_title']
          actual_top_title = @risk_count_page.top_title
          actual_top_title.should == risk_count_title
          end

          it 'risk attribute count tab'do
               submit_date_sign = @pm_profiles['risk_problem']['submit_date_sign']
            actual_sign = @risk_count_page.risk_attribute_tab_check
            actual_sign.should == submit_date_sign
          end

          it 'risk trend count tab'do
            periods_of_time_sign = @pm_profiles['risk_problem']['periods_of_time_sign']
            actual_sign = @risk_count_page.risk_trend_tab_check
          end
        end
      end
    end #RiskProblem
  end # Pm
end  # WebTest