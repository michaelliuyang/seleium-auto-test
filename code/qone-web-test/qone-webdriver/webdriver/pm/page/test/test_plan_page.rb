require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component.rb'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/driver_extension_action'

module WebDriver
  module Pm
    module Page
      module Test
          class TestPlanPage < Common::BasePage
          include Support::Component
          include Support::MenuAction
          include Support::SwitchAction
          include Support::DriverExtensionAction
          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            test = @pm_profiles['test']['test']
            test_plan = @pm_profiles['test']['test_plan']
            #menu_click_for_hide test,test_plan
            show_menu_by_js "pm_test"
            menu_click test_plan
          end
          
          def top_title
            @driver[:css=>'#content h2'].text
          end

            end #TestPlanPage
      end #Test
    end #  Page
  end # Pm
end  # WebDriver