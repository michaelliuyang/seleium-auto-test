require_relative '../../load_helper'
module WebTest
   module Pm
     module ProjectEstimate
          
             describe 'estimate expert list  page' do
               
               before :all do
                 @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
                 @pm_data = Helper::ReadProfiles.data :pm
                 @pm_login_name = @pm_profiles['sa_login_name']
                 @pm_password = @pm_profiles['password']
                 @driver = Support::Login.login(:name => @pm_login_name, :pwd => @pm_password)
                 @page_container = WebDriver.create_page_container :pm, @driver
                 @estimate_expert_list_page = @page_container.estimate_expert_list_page
                 @estimate_expert_list_page.to_this_page
               end

               after :all do
                  @page_container.close
               end

               it 'menu click success?' do
                  #given
                  expect_top_title = @pm_profiles['project_estimate']['estimate_expert_list']
                  #when
                  actual_top_title = @estimate_expert_list_page.top_title
                  #then
                  actual_top_title.should == expect_top_title
               end
               
               it 'new add estimate expert success?' do
                   #given
                   new_estimate_expert = @pm_profiles['project_estimate']['new_estimate_expert']
                   professor_name = @pm_data['project_estimate']['professor_name']
                   position = @pm_data['project_estimate']['position']
                   field = @pm_data['project_estimate']['field']
                   company = @pm_data['project_estimate']['company']
                   email = @pm_data['project_estimate']['email']
                   @estimate_expert_list_page.new_add_estimate_expert(professor_name,position,field,company,email)
                   #when
                   actual = @estimate_expert_list_page.find_expert_by_name professor_name
                   #then
                   actual.should_not == 0
               end
               
               it 'disable expert success?' do
                   #given
                   professor_name = @pm_data['project_estimate']['professor_name']
                   @estimate_expert_list_page.disable_expert_button_test(professor_name)
                   #when
                   actual = @estimate_expert_list_page.find_expert_by_name professor_name
                   #then
                   actual.should == 0
               end 
               
               it 'enable expert success?' do
                   #given
                   professor_name = @pm_data['project_estimate']['professor_name']
                   @estimate_expert_list_page.enable_expert_button_test(professor_name)
                   #when
                   actual = @estimate_expert_list_page.find_expert_by_name professor_name
                   #then
                   actual.should_not == 0  
               end
              
               it 'look expert information success?' do
                   #given
                   look_estimate_expert = @pm_profiles['project_estimate']['look_estimate_expert']
                   look_professor_name = @pm_data['project_estimate']['professor_name']
                   #when
                   actual_title = @estimate_expert_list_page.look_expert_information_test(look_professor_name)
                   #then
                   actual_title.should == look_estimate_expert
               end
               
               it 'modify expert name success?' do
                   #given 
                   professor_name = @pm_data['project_estimate']['professor_name']
                   professor_name_for_modify = @pm_data['project_estimate']['modify_professor_name']
                   actual_top_title=@estimate_expert_list_page.modify_expert_information(professor_name,professor_name_for_modify)
                   #when
                   actual = @estimate_expert_list_page.find_expert_by_name(professor_name_for_modify)
                   #then
                   actual.should_not == 0
               end
               
               it 'from organization introduction add expert success?' do
                   #given
                   from_organization_import_expert_name = @pm_data['project_estimate']['from_organization_import_expert_name']
                   @estimate_expert_list_page.from_organization_import
                   #when
                   actual = @estimate_expert_list_page.find_expert_by_name from_organization_import_expert_name
                   #then
                   actual.should_not == 0
               end
                
          
          end  # describe   
     end   #  ProjectReport
   end   # Pm
end # WebTest