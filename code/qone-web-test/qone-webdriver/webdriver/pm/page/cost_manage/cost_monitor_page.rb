 require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/component.rb'

module WebDriver
  module Pm
    module Page
      module CostManage
        class CostMonitorPage < Common::BasePage
           include Support::MenuAction
           include Support::SwitchAction
           include Support::Component

          def top_title
           text =  @driver[:css => '#content h2'].text
         end

          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
           cost_manage = @pm_profiles['cost_manage']['cost_manage']
           cost_monitor = @pm_profiles['cost_manage']['cost_monitor']
            menu_click_for_hide cost_manage,cost_monitor
          end

           def print_page_test
             print_button.click
             handle = @driver.window_handle
             all_handle  = @driver.window_handles
             switch_alert_window(all_handle,handle)
             return_title =  @driver.title
             switch_window handle
             return_title
           end

          private

          def print_button
            @driver[:name=>'sub']
          end




        end #CostMonitorPage
      end #CostMonitor
    end #page
  end  #Pm

end #webdriver

