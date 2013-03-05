require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component'
require 'webdriver/support/switch_action'
require  'webdriver/support/driver_extension_action'

module WebDriver
  module Sm
    module Page
      module StaffManage
        class PositionManagePage < Common::BasePage
          include Support::MenuAction
          include Support::Component
          include Support::SwitchAction
          include Support::DriverExtensionAction
          def to_this_page
            @page_profiles = Helper::ReadProfiles.apps_res_zh :sm
            system_manage = @page_profiles['system_manage']
            department_manage = @page_profiles['staff_manage']['department_manage']
            position_manage = @page_profiles['staff_manage']['position_manage']
            menu_click system_manage
            show_menu_by_js('sm_org')
            menu_click position_manage
          end

          def add_position_page_check
            add_position_button.click
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles,current_handle)
            add_position_title = top_title
            close_button.click
            switch_window current_handle
            add_position_title
          end

          def top_title
            top_title = @driver[:css=>'#content h2'].text
          end

          def add_position name
            add_position_button.click
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles,current_handle)
            position_name_input name
            submit_button.click
            switch_window current_handle
          end

          def modify_position old_name,new_name
            operate_button old_name,:edit
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles,current_handle)
            position_name_input new_name
            submit_button.click
            switch_window current_handle
          end

          def del_position name
            operate_button name,:delete
            alert_ok
          end

          def look_position name
            operate_button name,:view
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles,current_handle)
            look_position_title = top_title
            close_button.click
            switch_window current_handle
            look_position_title
          end

          def position_name_exist? name
            name_col = 1
            data_list = qone_data_list position_list_table
            data_list.data_exist? name,name_col
          end

          private

          def add_position_button
            add_position_button = @page_profiles['staff_manage']['add_position_button_name']
            @driver[:link => add_position_button]
          end

          def close_button
            close_button_name = @page_profiles['staff_manage']['close_button_name']
            @driver[:css => "input[value = '#{close_button_name}']"]
          end

          def position_name_input name
            @driver[:id => 'name'].clear
            @driver[:id => 'name'].send_keys name
          end

          def submit_button
            @driver[:css => "input[type = 'submit']"]
          end

          def position_list_table
            @driver[:id => 'dataListTable_NFSDataList']
          end

          def operate_button name,operate_type
            name_col = 1
            operate_col = 3
            data_list = qone_data_list position_list_table
            data_list.operate(name,name_col,operate_type,operate_col)
          end

        end #PositionManagePage
      end # StaffManage
    end # Page
  end # Sm
end # WebDriver