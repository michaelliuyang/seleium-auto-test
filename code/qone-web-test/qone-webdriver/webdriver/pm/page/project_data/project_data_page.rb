require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'

module WebDriver
  module Pm
    module Page
      module ProjectData
        class ProjectDataPage < Common::BasePage
          include Support::MenuAction

          def top_title
            @driver[:css=>'#content h2'].text
          end

          def to_this_page
            @page_profile = Helper::ReadProfiles.apps_res_zh :pm
            project_data = @page_profile['project_data']['project_data']
            @driver.mouse.move_to @driver[:link=>project_data]
           project_data_child_menu = @driver[:id=>'pm_da'].find_elements(:tag_name=>'a')[0]
            project_data_child_menu.click
            sleep 2
          end


        end # ProjectDataPage
      end #ProjectData
    end # Page
  end #Pm
end # WebDriver
