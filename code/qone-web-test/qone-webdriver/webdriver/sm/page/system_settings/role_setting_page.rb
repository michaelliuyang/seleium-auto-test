require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require 'webdriver/support/component'

module WebDriver
  module Sm
    module Page
      module SystemSettings
        class RoleSettingPage < Common::BasePage
          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component

          def to_this_page
            @page_profiles=Helper::ReadProfiles.apps_res_zh :sm
            system_manage = @page_profiles['system_manage']
            system_settings = @page_profiles['system_settings']['system_settings']
            role_setting = @page_profiles['system_settings']['role_setting']
            menu_click system_manage
            menu_click_for_hide(system_settings, role_setting)
          end

          def top_title
            @driver[:css=>'h2'].text
          end

          def add_system_role_function(name)
            add_role_button.click
            checked_element_by_id(project_type_radio_id)
            role_name_element.send_keys name
            submit_button.click
          end

          def notice_success_text
            notice_success.text
          end

          def notice_success_click
            notice_success.click
          end

          def find_row_by_role_name name
            sleep 3
            table_object
            name_col = 0
            result_row = -1
            rows = @table.row_count
            (1..rows-1).each do |x|
              if @table[x][name_col].text == name
                result_row = x
              end
            end
            result_row
          end

          def alter_role_name name, new_name
            row = find_row_by_role_name name
            col = 2
            alter= alter_img row
            alter.click
            role_name_element.clear
            role_name_element.send_keys new_name
            submit_button.click
          end

          def del_role_name name
            row = 0
            row = find_row_by_role_name name
            col = 2
            alter= del_img row
            alter.click
            alert_ok
          end

          def view_role_by_name name
           row = find_row_by_role_name name
           view_button = view_img row
            view_button.click
            role_name =  return_view_role_page_name
            return_button.click
            role_name
          end

          def return_view_role_page_name
             set_view_page_top_table
             name_text = @table[1][1].text
          end

         private

          def table_object
            @table = table table_element
          end

          def alter_img  row
            col = 2
            @table[row][col].find_elements(:tag_name=>'a')[1]
          end

          def view_img row
            col = 2
            @table[row][col].find_elements(:tag_name=>'a')[0]
          end

          def del_img row
             col = 2
            @table[row][col].find_elements(:tag_name=>'a')[2]
          end

          def table_element
            @driver[:xpath=>"//table[@cellspacing='1']"]
          end

          def set_view_page_top_table
            @table = table(@driver[:name=>'updateSGPermissionsActionForm'].find_elements(:tag_name=>'table')[0])
          end

          def add_role_button
            @driver[:class=>'button']
          end

          def system_type_radio_id
            'SYSTEM'
          end

          def project_type_radio_id
            'PROJECT'
          end

          def role_name_element
            @driver[:name=>'description']
          end

          def submit_button
            @driver[:xpath=>"//input[@type='submit']"]
          end

          def return_button
            @driver[:xpath=>"//input[@type='button']"]
          end

          def notice_success
            @notice_success = @page_profiles['system_settings']['add_role_notice_success']
            @driver[:link=>@notice_success]
          end


        end #RoleSettingPage

      end # SystemSettings
    end # Page
  end # Sm
end # WebDriver

