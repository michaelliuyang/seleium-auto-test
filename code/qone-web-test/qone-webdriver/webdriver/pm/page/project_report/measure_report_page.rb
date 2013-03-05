require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/component.rb'
require 'webdriver/support/driver_extension_action'

module WebDriver
  module Pm
    module Page
      module ProjectReport
          class MeasureReportPage < Common::BasePage
          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component
          include Support::DriverExtensionAction

          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            project_report = @pm_profiles['project_report']['project_report']
            measure_report = @pm_profiles['project_report']['measure_report']
            show_menu_by_js "pm_pr"
            menu_click measure_report
            #menu_click_for_hide project_report,measure_report
            sleep 2
          end

          def top_title
            @driver[:css=>'#content h2'].text
          end

          def measurement_of_target_tab
            measurement_of_target.click
            measurement_of_target.text
          end

          def measurement_of_activity_tab
            measurement_of_activity.click
            measurement_of_activity.text
          end

          def plan_summary_tab
            plan_summary.click
            plan_summary.text
          end
               
          private

          def measurement_of_target
            @driver.find_element(:class =>'dh_menu').find_elements(:tag_name => 'a')[0]
          end

          def measurement_of_activity
            @driver.find_element(:class =>'dh_menu').find_elements(:tag_name => 'a')[1]
          end

          def plan_summary
            @driver.find_element(:class =>'dh_menu').find_elements(:tag_name => 'a')[2]
          end
               

        end #MeasureReportPage
      end #ProjectReport
    end #  Page
  end # Pm
end  # WebDriver