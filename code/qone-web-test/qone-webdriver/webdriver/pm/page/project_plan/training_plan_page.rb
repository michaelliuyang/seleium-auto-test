require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/Switch_action'

module WebDriver
  module Pm
    module Page
      module ProjectPlan
        class TrainingPlanPage < Common::BasePage
           include Support::MenuAction
           include Support::SwitchAction

          def top_title
            @driver[:css => '#content h2'].text
          end

          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            project_plan = @pm_profiles['project_plan']['project_plan']
            training_plan = @pm_profiles['project_plan']['training_plan']
            menu_click_for_hide project_plan,training_plan
          end

           def maintenance_technology_page_check?
             maintenance_technology_button.click
             handle = @driver.window_handle
             handles = @driver.window_handles
             switch_alert_window(handles,handle)
             return_text = top_title
             close_button.click
             switch_window handle
             return_text
           end

           def maintenance_training_require_page_check?
             maintenance_training_require_button.click
             handle = @driver.window_handle
             handles = @driver.window_handles
             switch_alert_window(handles,handle)
             return_text = top_title
             close_button.click
             switch_window handle
             return_text
           end


          private

          def maintenance_technology_button
            maintenance_technology = @pm_profiles['project_plan']['maintenance_technology']
            @driver[:link=>maintenance_technology]
          end

          def close_button
            close = @pm_profiles['project_plan']['close']
            @driver[:xpath=>"//input[@value='#{close}']"]
          end

          def maintenance_training_require_button
            maintenance_training_require = @pm_profiles['project_plan']['maintenance_training_require']
            @driver[:link=>maintenance_training_require]
          end

        end#TrainingPlanPage
      end#PojectPlan
    end #page
  end  #Pm

end #webdriver