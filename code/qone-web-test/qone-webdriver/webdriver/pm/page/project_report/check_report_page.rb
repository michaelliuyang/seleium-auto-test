require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component.rb'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/driver_extension_action'

module WebDriver
  module Pm
    module Page
      module ProjectReport
         class CheckReportPage < Common::BasePage
          include Support::Component
          include Support::MenuAction
          include Support::SwitchAction
          include Support::DriverExtensionAction

          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            project_report = @pm_profiles['project_report']['project_report']
            check_report = @pm_profiles['project_report']['check_report']
            show_menu_by_js "pm_pr"
            menu_click check_report
            #menu_click_for_hide(project_report,check_report)
          end

          def top_title
            @driver[:css=>'#content h2'].text
          end
          def write_inspection_report(project_overview,software_actual_size,software_reusability,productivity_evaluation,acceptance_advice)
              fill_in_the_inspection_report(project_overview,software_actual_size,software_reusability,productivity_evaluation,acceptance_advice) 
              sleep 5  
              perservation_button.click
          end
          
          private
          
          def submit_button
            submit_name = @pm_profiles['project_report']['submit']
            @driver.find_element(:css =>"input[value='#{submit_name}']")
          end
          def perservation_button
            perservation_name = @pm_profiles['project_report']['perservation']
            @driver.find_element(:css =>"input[value='#{perservation_name}']")
          end
          
          def fill_in_the_inspection_report(project_overview,software_actual_size,software_reusability,productivity_evaluation,acceptance_advice)
            fill_project_overview.send_keys(project_overview)
            fill_software_actual_size.send_keys(software_actual_size)
            fill_software_reusability.send_keys(software_reusability)
            fill_productivity_evaluation.send_keys(productivity_evaluation)
            fill_acceptance_advice.send_keys(acceptance_advice)
          end

          def fill_project_overview
            @driver.find_element(:name=>'projectSummary')
          end

          def fill_software_actual_size
            @driver.find_element(:id =>'actualSize')
          end

          def fill_software_reusability
            @driver.find_element(:id =>'actualReusability')
          end

          def fill_productivity_evaluation
            @driver.find_element(:name=>'productivityComment')
          end

          def fill_acceptance_advice
            @driver.find_element(:name=>'checkComment')
          end
         end # CheckReportPage
      end #ProjectReport
    end #  Page
  end # Pm
end  # WebDriver