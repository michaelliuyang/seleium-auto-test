require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require  'webdriver/support/driver_extension_action'

module WebDriver
  module Hl
    module Page
      module MemberMonitor
        class DataStatisticsPage < Common::BasePage
         include Support::MenuAction
         include Support::SwitchAction
         def to_this_page
           @page_profiles = Helper::ReadProfiles.apps_res_zh :hl
           high_level_view = @page_profiles['high_level_view']
           member_monitor = @page_profiles['member_monitor']['member_monitor']
           data_statistics = @page_profiles['member_monitor']['data_statistics']
           menu_click high_level_view
           menu_click_for_hide member_monitor,data_statistics
           sleep 2
         end

         def top_title
           top_title = @driver[:css=>'#content h2'].text
         end
        end#DataStatisticPage
      end#MemberMonitor
    end#Page
  end#Hl
end#WebDriver