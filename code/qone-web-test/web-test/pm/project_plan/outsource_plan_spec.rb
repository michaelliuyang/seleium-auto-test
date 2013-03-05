require_relative '../../load_helper'
module WebTest
  module Pm
    module ProjectPlan
     class OutsourcePlanSpec
        describe 'outsource plan page'do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :pm,driver
          @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
          @project_list_page = @page_container.project_list_page
          @outsource_plan_page = @page_container.outsource_plan_page

          @project_list_page.to_this_page
          project_name = @pm_profiles['project_list']['project_name']
          @project_list_page.enter_project project_name
          @outsource_plan_page.to_this_page
        end

        after :all do
          @page_container.close
        end
         describe 'menu and link page test?' do
           it 'menu page test' do
            expect_top_title = @pm_profiles['project_plan']['outsource_plan']
            actual_top_title = @outsource_plan_page.top_title
            actual_top_title.should == expect_top_title
           end

           it 'add outsource plan button click' do
             expect_text = @pm_profiles['project_plan']['add_outsource_plan']
             actual_text = @outsource_plan_page.add_outsource_plan_page_check?
             actual_text.should  == expect_text
           end

           it 'modify outsource plan img click' do
             expect_text = @pm_profiles['project_plan']['add_outsource_plan']
              actual = @outsource_plan_page.modify_outsource_plan_page_check?
              actual.should == expect_text
           end

         end


        end #describe


      end# OutsourcePlanSpec
    end # ProjectPlan
  end # Pm
end #WebTest

