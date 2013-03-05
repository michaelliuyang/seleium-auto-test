require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'

module WebDriver
  module Sm
    module Page
      module SystemLogger
        class ConfigurationDatabaseLoggerPage  < Common::BasePage
          include Support::MenuAction
          
          def to_this_page
            sm_profiles = Helper::ReadProfiles.apps_res_zh :sm
            sm_menu_name = sm_profiles['system_manage']
            system_logger_menu_name = sm_profiles['system_logger']['system_logger']
            this_menu_name = sm_profiles['system_logger']['configuration_database_logger']
            menu_click sm_menu_name
            menu_click_for_hide system_logger_menu_name,this_menu_name
          end
          
          def top_title
            title_h2.text
          end
          
          private 
          
          def title_h2
            @driver[:css=>'h2']
          end

        end # ConfigurationDatabaseLoggerPage
      end # SystemLogger
    end # Page
  end # Sm
end # WebDriver

