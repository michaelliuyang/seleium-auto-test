require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
module WebDriver
  module Pm
    module Page
      module ProjectEstimate
          class ProjectEstimateListPage < Common::BasePage
             include Support::MenuAction
             include Support::SwitchAction
               def to_this_page
                 @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
                 project_management = @pm_profiles['project_management']
                 project_estimate = @pm_profiles['project_estimate']['project_estimate']
                 project_estimate_list = @pm_profiles['project_estimate']['project_estimate_list']
                 menu_click project_management
                 show_menu_by_js "pm_es"
                 menu_click project_estimate_list
                 #menu_click_for_hide project_estimate,project_estimate_list
               end
               def top_title
                 @driver[:css=>'#content h2'].text
               end
               
              def start_project_estimate_test
                  start_project_estimate_button.click
                  first_handle =@driver.window_handle
                  handles = @driver.window_handles
                  switch_alert_window handles, first_handle
                  title = top_title
                  close_button.click
                  switch_window first_handle
                  title
              end
              
              def input_offline_estimate_test
                  input_offline_estimate_button.click
                  first_handle =@driver.window_handle
                  handles = @driver.window_handles
                  switch_alert_window handles, first_handle
                  title = top_title
                  close_button.click
                  switch_window first_handle
                  title
              end



            private
            
              def start_project_estimate_button
                   start_project_estimate_name = @pm_profiles['project_estimate']['start_project_estimate']
                   @driver[:link =>start_project_estimate_name]
              end
              def input_offline_estimate_button
                  input_offline_estimate_name = @pm_profiles['project_estimate']['input_offline_estimate']
                  @driver[:link =>input_offline_estimate_name]
              end
              def close_button
                  close_name = @pm_profiles['project_estimate']['close']
                  @driver[:xpath =>"//input[@value = '#{close_name}']"]
              end


            end #ProjectEstimateListPage
      end #ProjectEstimate
    end #  Page
  end # Pm
end  # WebDriver