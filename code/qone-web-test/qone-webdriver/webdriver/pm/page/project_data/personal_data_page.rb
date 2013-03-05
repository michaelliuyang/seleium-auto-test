require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/component.rb'

module WebDriver
  module Pm
    module Page
      module ProjectData
        class PersonalDataPage < Common::BasePage
           include Support::MenuAction
           include Support::SwitchAction
           include Support::Component

          def top_title
            @driver[:css => '#content h2'].text
          end

          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            project_data = @pm_profiles['project_data']['project_data']
            personal_data = @pm_profiles['project_data']['personal_data']
            menu_click_for_hide project_data,personal_data
          end

           def member_alteration_menu_test
             yellow_button.click
             handle = @driver.window_handle
             all_handles= @driver.window_handles
             switch_alert_window(all_handles,handle)
             return_text = top_title
             close_Button.click
             switch_window handle
             return_text
           end

          private

          def yellow_button
            @driver[:class=>'whitelink']
          end

          def close_Button
            @driver[:class=>'bottomButtons']
          end






        end#PersonalDataPage
      end#PojectData
    end #page
  end  #Pm

end #webdriver

