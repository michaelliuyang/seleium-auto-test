require_relative '../../load_helper'
module WebTest
   module Pm
     module Test
        describe 'bug count page' do
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
          @bug_count_page = @page_container.bug_count_page
          @bug_count_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu page test' do
          #given
          bug_count_title = @pm_profiles['test']['bug_count_title']
          #when
          actual_top_title = @bug_count_page.top_title
          #then
          actual_top_title.should == bug_count_title
        end

        end  # describe

     end   #  Test
   end   # Pm
end # WebTest
