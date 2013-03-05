require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component'
require 'webdriver/support/switch_action'
require 'webdriver/support/driver_extension_action'

module WebDriver
  module Dm
    module Page
      module DocTypeManage
        class DocTypeManagePage < Common::BasePage
          include Support::MenuAction
          include Support::SwitchAction
          include Support::DriverExtensionAction
          include Support::Component
          def to_this_page
            @page_profiles = Helper::ReadProfiles.apps_res_zh :dm
            doc_manage = @page_profiles['doc_manage']
            doc_type_manage = @page_profiles['doc_type_manage']['doc_type_manage']
            menu_click doc_manage
            menu_click doc_type_manage
          end

          def top_title
            top_title = @driver[:css=>'h2'].text
          end

          def add_doc_type_title
            add_doc_type_button.click
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, current_handle)
            add_doc_type_title = top_title
            close_button.click
            switch_window current_handle
            add_doc_type_title
          end

          def add_doc_type name
            add_doc_type_button.click
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, current_handle)
            add_doc_type_name name
            submit_button.click
            switch_window current_handle
          end

          def modify_doc_type name,new_name
            operate_button(name,:edit)
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, current_handle)
            add_doc_type_name new_name
            submit_button.click
            switch_window current_handle
          end

          def del_doc_type name
            operate_button(name,:delete)
            alert_ok
          end

          def type_name_exist? name
            name_col = 0
            data_list = qone_data_list doc_type_list_table
            data_list.data_exist? name,name_col
          end

          private

          def add_doc_type_button
            add_doc_type_button_name = @page_profiles['doc_type_manage']['add_doc_type']
            @driver[:link => "#{add_doc_type_button_name}"]
          end

          def add_doc_type_name name
            @driver[:id => 'typeName'].clear
            @driver[:id => 'typeName'].send_keys name
          end

          def parent_node
            @driver[:name => 'parentId_input']
          end

          def submit_button
            submit_button_name = @page_profiles['doc_type_manage']['submit_button_name']
            @driver[:xpath => "//input [@value = '#{submit_button_name}']"]
          end

          def close_button
            close_button_name = @page_profiles['doc_type_manage']['close_button_name']
            @driver[:xpath => "//input [@value = '#{close_button_name}']"]
          end

          def operate_button name,operate_type
            name_col = 0
            operate_col = 2
            data_list = qone_data_list doc_type_list_table
            data_list.operate(name,name_col,operate_type,operate_col)
          end

          def doc_type_list_table
            @driver[:id => 'dataListTable_NFSDataList']
          end

          def search_keyword_input key
            @driver[:id => 'keyword_id'].clear
            @driver[:id => 'keyword_id'].send_keys key
          end

        end#DocTypeManagePage
      end#DocTypManage
    end#Dm
  end#Page
end#WebDriver