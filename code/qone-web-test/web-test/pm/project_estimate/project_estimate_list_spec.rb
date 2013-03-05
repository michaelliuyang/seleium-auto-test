require_relative '../../load_helper'
module WebTest
   module Pm
     module ProjectEstimate
          
      describe 'project estimate list  page' do
        
        before :all do
          @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
          @pm_data = Helper::ReadProfiles.data :pm
          @pm_login_name = @pm_profiles['sa_login_name']
          @pm_password = @pm_profiles['password']
          @driver = Support::Login.login(:name => @pm_login_name, :pwd => @pm_password)
          @page_container = WebDriver.create_page_container :pm, @driver
          @project_estimate_list_page = @page_container.project_estimate_list_page
          @project_estimate_list_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu page test' do
          #given
          project_estimate_list = @pm_profiles['project_estimate']['project_estimate_list']
          #when
          actual_top_title = @project_estimate_list_page.top_title
          #then
          actual_top_title.should == project_estimate_list
        end
                
        it 'click start project estimate success?' do
          #given
          project_estimate_table = @pm_profiles['project_estimate']['project_estimate_table']
          #when
          actual_top_title = @project_estimate_list_page.start_project_estimate_test
          #then
          actual_top_title.should == project_estimate_table
        end
                
        it 'click input offline  estimate success?' do
          #given
          project_estimate_table = @pm_profiles['project_estimate']['project_estimate_table']
          #when
          actual_top_title = @project_estimate_list_page.input_offline_estimate_test
          #then
          actual_top_title.should == project_estimate_table
        end


       end  # describe
     end   #  ProjectReport
   end   # Pm
end # WebTest
