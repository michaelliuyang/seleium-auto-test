require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component.rb'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/driver_extension_action'

module WebDriver
  module Pm
    module Page
      module Test
          class BugCountPage < Common::BasePage
          include Support::Component
          include Support::MenuAction
          include Support::SwitchAction
          include Support::DriverExtensionAction
          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            test = @pm_profiles['test']['test']
            bug_count = @pm_profiles['test']['bug_count']
            #menu_click_for_hide test,bug_count
            show_menu_by_js "pm_test"
            menu_click bug_count
          end

          def top_title
            @driver[:css=>'#content h2'].text
          end

            end #BugCountPage
      end #Test
    end #  Page
  end # Pm
end  # WebDriver