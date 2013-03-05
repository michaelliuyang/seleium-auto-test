require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'

module WebDriver
  module Sm
    module Page
      module SystemLogger
        class PermissionChangeLoggerPage  < Common::BasePage
          include Support::MenuAction
          
          def to_this_page
            sm_profiles = Helper::ReadProfiles.apps_res_zh :sm
            sm_menu_name = sm_profiles['system_manage']
            system_logger_menu_name = sm_profiles['system_logger']['system_logger']
            this_menu_name = sm_profiles['system_logger']['permission_change_logger']
            menu_click sm_menu_name
            menu_click_for_hide system_logger_menu_name,this_menu_name
          end
          
          def top_title
            title_h2.text
          end

          def to_system_permission_change_tab_page
            system_permission_change_tab.click
          end

          def to_role_permission_change_tab_page
            role_permission_change_tab.click
          end

          def to_project_permission_change_tab_page
            project_permission_change_tab.click
          end

          def system_permission_change_page_flag
            flag = false
            unless position_attributes_change_type_checkbox==nil
              flag = true
            end
            flag
          end

          def role_permission_change_page_flag
            flag  = false
            unless user_role_change_type_checkbox == nil
             flag = true
            end
            flag
          end

          def project_permission_change_page_flag
            flag  = false
            unless project_name_checkbox == nil
             flag = true
            end
            flag
          end
          
          private
          
          def title_h2
            @driver[:css=>'h2']
          end

          def role_permission_change_tab
            @driver[:css=>"span[key = 'rolePermissionChange']"]
          end

          def system_permission_change_tab
            @driver[:css=>"span[key = 'systemPermissionChange']"]
          end

          def project_permission_change_tab
            @driver[:css=>"span[key = 'projectPermissionChange']"]
          end

          def position_attributes_change_type_checkbox
            @driver[:id=>'positionAttributesChangeType']
          end

          def user_role_change_type_checkbox
            @driver[:id=>'userRoleChangeType']
          end

          def project_name_checkbox
            @driver[:id=>'projectNameChecked']
          end

        end # PermissionChangeLoggerPage
      end # SystemLogger
    end # Page
  end # Sm
end # WebDriver

