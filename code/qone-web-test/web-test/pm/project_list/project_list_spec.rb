require_relative '../../load_helper'

module WebTest
  module Pm
    module ProjectList
      describe 'project list page'do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :pm,driver
          @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
          @project_list_page = @page_container.project_list_page
          @project_list_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'project list menu click success?'do
          project_list_title = @pm_profiles['project_list']['project_list_title']
          actual_top_title = @project_list_page.top_title
          actual_top_title.should == project_list_title
        end

      end
    end #ProjectList
  end # Pm
end  # WebTest