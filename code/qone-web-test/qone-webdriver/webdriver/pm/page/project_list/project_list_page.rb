require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
module WebDriver
  module Pm
    module Page
      module ProjectList
        class ProjectListPage < Common::BasePage
          include Support::MenuAction
          def top_title
            @driver[:css => '#content h2'].text
          end

          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            project_management = @pm_profiles['project_management']
            project_list = @pm_profiles['project_list']['project_list']
            menu_click project_management
            menu_click project_list
          end

          def enter_project(project_name)
            @driver.find_element(:link =>project_name).click
          end


        end #ProjectListPage
      end #ProjectList
    end #Page
  end # Pm
end #WebDriver