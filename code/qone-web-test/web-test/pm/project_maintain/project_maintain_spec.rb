require_relative '../../load_helper'
module WebTest
   module Pm
     module ProjectMaintain
          class ProjectMaintainSpec
             describe 'project maintain function test' do
                before :all do
                driver = Support::Login.login
                @page_container = WebDriver.create_page_container :pm,driver
                @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
                @project_maintain_page = @page_container.project_maintain_page
                @project_maintain_page.to_this_page
             end
             after :all do
                  @page_container.close
             end

             it 'project maintain menu page test' do
                    project_maintain = @pm_profiles['project_maintain']['project_maintain']
                    actual_top_title = @project_maintain_page.top_title
                    actual_top_title.should == project_maintain
             end
              it 'project approving button  function test'do
                    project_approving_name = @pm_profiles['project_maintain']['project_approving']
                    actual_top_title = @project_maintain_page.project_approving_test
                    actual_top_title.should == project_approving_name
              end
              it 'expend all button function test'do
                   @project_maintain_page.expend_all_test
              end
              it 'all away  button function test'do
                   @project_maintain_page.all_away_test
              end
              it 'click project name link test' do
                    view_project_information_name = @pm_profiles['project_maintain']['view_project_information']
                    actual_top_title = @project_maintain_page.project_name_link_test
                    actual_top_title.should == view_project_information_name
              end



             end  # describe
          end  # ProjectMaintainSpec
     end   #  ProjectMaintain
   end   # Pm
end # WebTest
