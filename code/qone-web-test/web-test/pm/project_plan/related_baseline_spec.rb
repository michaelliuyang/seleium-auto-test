require_relative '../../load_helper'
module WebTest
  module Pm
    module ProjectPlan
     class RelatedBaselineSpec
        describe 'related baseline page'do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :pm,driver
          @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
          @project_list_page = @page_container.project_list_page
          @related_baseline_page = @page_container.related_baseline_page

          @project_list_page.to_this_page
          project_name = @pm_profiles['project_list']['project_name']
          @project_list_page.enter_project project_name
          @related_baseline_page.to_this_page
        end

        after :all do
          @page_container.close
        end
         describe 'menu and link page test?' do
           it 'menu page test' do
            expect_top_title = @pm_profiles['project_plan']['baseline_list']
            actual_top_title = @related_baseline_page.top_title
            actual_top_title.should == expect_top_title
           end


         end


        end #describe


      end# RelatedBaselineSpec
    end # ProjectPlan
  end # Pm
end #WebTest






