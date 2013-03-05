require_relative '../../load_helper'
module WebTest
  module Pm
    module ProjectPlan
     class PlanChangeSpec
        describe 'plan change page'do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :pm,driver
          @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
          @project_list_page = @page_container.project_list_page
          @plan_change_page = @page_container.plan_change_page
          @project_list_page.to_this_page
          project_name = @pm_profiles['project_list']['project_name']
          @project_list_page.enter_project project_name
          @plan_change_page.to_this_page
        end

        after :all do
          @page_container.close
        end
         describe 'menu and link page test?' do
           it 'menu page test' do
            expect_top_title = @pm_profiles['project_plan']['plan_change_list']
             actual_top_title = @plan_change_page.top_title
              actual_top_title.should == expect_top_title
           end

           it 'change infomation link page test'  do
             row = 1
             actual_text = @plan_change_page.change_information_link_page_test row
             expect_text = @pm_profiles['project_plan']['plan_change_information']
             actual_text.should == expect_text
           end

           it 'changed gannt link page test' do
             expect = true
             row = 1
             actual = @plan_change_page.change_gannt_link_page_test row
             actual.should == expect
           end

           it 'spi cpi link page test' do
             expect = true
             row = 1
             actual = @plan_change_page.spi_cpi_link_page_test row
             actual.should == expect
           end

           it 'related plan download page test ' do
             expect = true
             row = 1
             actual = @plan_change_page.related_plan_download_link_page_test row
             actual.should == expect

           end

           it ' modify plan change page test' do
             expect_text = @pm_profiles['project_plan']['modify_plan_change']
             row = 2
             actual_text = @plan_change_page.modify_plan_change_page_test row
             actual_text.should == expect_text
           end

            it ' approval plan change page test' do
             expect_text = @pm_profiles['project_plan']['approval_plan_change']
             row = 2
             actual_text = @plan_change_page.approval_plan_change_page_test row
             actual_text.should == expect_text

           end

         end


        end #describe


      end# PlanChangeSpec
    end # ProjectPlan
  end # Pm
end #WebTest
