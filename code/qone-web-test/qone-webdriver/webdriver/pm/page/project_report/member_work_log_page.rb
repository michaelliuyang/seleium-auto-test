require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component.rb'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/driver_extension_action'

module WebDriver
  module Pm
    module Page
      module ProjectReport
          class MemberWorkLogPage < Common::BasePage
          include Support::Component
          include Support::MenuAction
          include Support::SwitchAction
          include Support::DriverExtensionAction

          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            #project_report = @pm_profiles['project_report']['project_report']
            member_work_log = @pm_profiles['project_report']['member_work_log']
            show_menu_by_js "pm_pr"
            menu_click member_work_log
            #menu_click_for_hide project_report,member_work_log
          end

          def top_title
            @driver[:css=>'#content2 h2'].text
          end
          
          def log_query_type_tab(type_tab)
             log_query_type(type_tab).click
             log_query_type(type_tab).text
          end
          
          
          private
          def log_query_type(type_tab)
            @driver.find_element(:class => 'dh_menu').find_element(:link =>type_tab)
          end
         
          end #MemberWorkLogPage
      end #ProjectReport
    end #  Page
  end # Pm
end  # WebDriver




