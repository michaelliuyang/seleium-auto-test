require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component'

module WebDriver
  module Sm
    module Page
      module SystemLogger
        class LoginLoggerPage < Common::BasePage
          include Support::MenuAction
          include Support::Component

          def to_this_page
            @sm_profiles = Helper::ReadProfiles.apps_res_zh :sm
            sm_menu_name = @sm_profiles['system_manage']
            system_logger_menu_name = @sm_profiles['system_logger']['system_logger']
            this_menu_name = @sm_profiles['system_logger']['login_logger']
            menu_click sm_menu_name
            menu_click_for_hide system_logger_menu_name, this_menu_name
          end

          def top_title
            title_h2.text
          end

          def to_system_monitor_tab_page
            system_monitor_tab.click
          end

          def to_system_log_tab_page
            system_log_tab.click
          end

          def system_monitor_page_flag_text
            text = system_monitor_active_status.text
            text[0..5]
          end

          def system_log_flag_text
            set_system_table
            (@table[0][4].text).lstrip
          end

          private

          def title_h2
            @driver[:css=>'h2']
          end

          def system_monitor_active_status
            @driver[:id=>'activeStatus']
          end

          def system_monitor_tab
            @driver[:class=>'currentselect']
          end

          def system_log_tab
            @driver[:class=>'cardmenu1']
          end

          def set_system_table
            @table = table(@driver[:id=>'dataListTable_NFSDataList'])
          end

        end # LoginLoggerPage
      end # SystemLogger
    end # Page
  end # Sm
end # WebDriver


