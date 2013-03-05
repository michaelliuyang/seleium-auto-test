require_relative '../../load_helper'
module WebTest
  module Pm
    module ProjectPlan
     class TrainingPlanSpec
        describe 'training plan page'do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :pm,driver
          @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
          @project_list_page = @page_container.project_list_page
          @training_plan_page = @page_container.training_plan_page

          @project_list_page.to_this_page
          project_name = @pm_profiles['project_list']['project_name']
          @project_list_page.enter_project project_name
          @training_plan_page.to_this_page
        end

        after :all do
          @page_container.close
        end
         describe 'menu and link page test?' do
           it 'menu page test' do
            expect_top_title = @pm_profiles['project_plan']['project_training_plan']
            actual_top_title = @training_plan_page.top_title
            actual_top_title.should == expect_top_title
           end

           it 'maintenance_technology button click' do
             expect = @pm_profiles['project_plan']['maintenance_technology']
             actual = @training_plan_page.maintenance_technology_page_check?
             actual.should == expect
           end

           it 'maintenance_training_require button click' do
             expect = @pm_profiles['project_plan']['maintenance_training_require']
             actual = @training_plan_page.maintenance_training_require_page_check?
             actual.should == expect
           end

         end


        end #describe


      end# TrainingPlanSpec
    end # ProjectPlan
  end # Pm
end #WebTest


