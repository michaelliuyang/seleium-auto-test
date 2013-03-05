require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'

module WebDriver
  module Pm
    module Page
      module ProjectReport
          class ProjectFormPage < Common::BasePage
          include Support::MenuAction


          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            project_report = @pm_profiles['project_report']['project_report']
            project_form = @pm_profiles['project_report']['project_form']
            show_menu_by_js "pm_pr"
            menu_click project_form
            #menu_click_for_hide project_report,project_form
          end
          def top_title
            @driver[:css=>'#content h2'].text
          end

        end #ProjectFormPage
      end #ProjectReport
    end #  Page
  end # Pm
end  # WebDriver