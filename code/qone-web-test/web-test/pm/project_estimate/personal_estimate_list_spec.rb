require_relative '../../load_helper'
module WebTest
   module Pm
     module ProjectEstimate
         
        describe 'personal data page' do
          
           before :all do
             @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
             @pm_data = Helper::ReadProfiles.data :pm
             @pm_login_name = @pm_profiles['sa_login_name']
             @pm_password = @pm_profiles['password']
             @driver = Support::Login.login(:name => @pm_login_name, :pwd => @pm_password)
             @page_container = WebDriver.create_page_container :pm, @driver
             @personal_estimate_list_page = @page_container.personal_estimate_list_page
             @personal_estimate_list_page.to_this_page
           end

           after :all do
             @page_container.close
           end

           it 'menu page test' do
             #given
             personal_estimate_list = @pm_profiles['project_estimate']['personal_estimate_list']
             #when
             actual_top_title = @personal_estimate_list_page.top_title
             #then
             actual_top_title.should == personal_estimate_list
           end

         end  # describe
     end   #  ProjectReport
   end   # Pm
end # WebTest
