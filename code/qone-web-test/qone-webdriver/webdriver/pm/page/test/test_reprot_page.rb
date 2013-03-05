require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component.rb'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/driver_extension_action'

module WebDriver
  module Pm
    module Page
      module Test
          class TestReportPage < Common::BasePage
          include Support::Component
          include Support::MenuAction
          include Support::SwitchAction
          include Support::DriverExtensionAction
          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            test = @pm_profiles['test']['test']
            test_report = @pm_profiles['test']['test_report']
            #menu_click_for_hide test,test_report
            show_menu_by_js "pm_test"
            menu_click test_report
          end

          def top_title
            @driver[:css=>'#content h2'].text
          end

            end #TestReportPage
      end #Test
    end #  Page
  end # Pm
end  # WebDriver