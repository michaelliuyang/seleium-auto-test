require_relative '../../load_helper'

module WebTest
  module Pm
    module ProjectData
      class ProjectDataSpec
         describe 'project data page' do

           before :all do
              driver = Support::Login.login
             @page_container = WebDriver.create_page_container :pm,driver
              @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
             @project_list_page = @page_container.project_list_page
              @project_data_page = @page_container.project_data_page

              @project_list_page.to_this_page
              project_name = @pm_profiles['project_list']['project_name']
              @project_list_page.enter_project project_name
              @project_data_page.to_this_page
           end

           after :all do
              @page_container.close
           end

           it 'page and link test' do
             project_data=@pm_profiles['project_data']['project_data_count_analysis']
             actual = @project_data_page.top_title
             actual.should == project_data
           end

         end

      end #ProjectDataSpec
    end #ProjectData
  end # Pm
end # WebTest