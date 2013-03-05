require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require  'webdriver/support/driver_extension_action'

module WebDriver
  module Hl
    module Page
      module MemberMonitor
        class MemberTaskSituationPage < Common::BasePage
         include Support::MenuAction
         include Support::SwitchAction
         def to_this_page
           @page_profiles = Helper::ReadProfiles.apps_res_zh :hl
           high_level_view = @page_profiles['high_level_view']
           member_monitor = @page_profiles['member_monitor']['member_monitor']
           member_task_situation = @page_profiles['member_monitor']['member_task_situation']
           menu_click high_level_view
           menu_click_for_hide member_monitor,member_task_situation
           sleep 2
         end

         def top_title
           top_title = @driver[:css=>'#content h2'].text
         end
        end#MemberTaskSituationPage
      end#MemberMonitor
    end#Page
  end#Hl
end#WebDriver