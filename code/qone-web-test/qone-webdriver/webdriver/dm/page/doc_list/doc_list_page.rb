require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/table_action'
require 'webdriver/support/component'
require 'webdriver/support/switch_action'
require 'webdriver/support/driver_extension_action'

module WebDriver
  module Dm
    module Page
      module DocList
        class DocListPage < Common::BasePage
          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component
          def to_this_page
            @page_profiles = Helper::ReadProfiles.apps_res_zh :dm
            doc_manage = @page_profiles['doc_manage']
            doc_list = @page_profiles['doc_list']['doc_list']
            menu_click doc_manage
            menu_click doc_list
          end

          def top_title
            top_title = @driver[:css=>'h2'].text
          end

          def add_doc_title
            sleep 2
            add_doc_button.click
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles,current_handle
            add_doc_title = top_title
            close_button.click
            switch_window current_handle
            add_doc_title
          end

          def add_doc title
            add_doc_button.click
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles,current_handle
            sleep 1
            doc_title_input title
            unclassified_class.click
            sleep 1
            submit_button.click
            switch_window current_handle
            sleep 4
          end

          def look_doc title
            operate_button(title,:view)
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles,current_handle)
            look_doc_title = top_title
            sleep 2
            @driver.close
            switch_window current_handle
            look_doc_title
          end

          def modify_doc title,new_title
            operate_button(title,:edit)
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, current_handle)
            doc_title_input new_title
            submit_button.click
            switch_window current_handle
          end

          def del_doc title
            operate_button(title,:delete)
            alert_ok
          end

          def doc_title_exist? title
            title_col = 1
            data_list = qone_data_list doc_list_table
            data_list.data_exist? title,title_col
          end

          private

          def operate_button title,operate_type
            title_col = 1
            operate_col = 5
            data_list = qone_data_list(doc_list_table,"style *= 'display:none'",:all)
            data_list.operate(title,title_col,operate_type,operate_col)
          end

          def add_doc_button
            @driver[:id => 'content'].find_elements(:tag_name => 'a')[0]
          end

          def close_button
            close_button_name = @page_profiles['doc_list']['close_button_name']
            @driver[:css => "input[value = '#{close_button_name}']"]
          end
          
          def look_close_button
            close_button_name = @page_profiles['doc_list']['close_button_name']
            @driver[:css => "#addContent div input[value = '#{close_button_name}']"]
          end
          
          def submit_button
            submit_button_name = @page_profiles['doc_list']['submit_button_name']
            @driver[:css => "input[value = '#{submit_button_name}']"]
          end

          def look_doc_button table,row
            button_col = 9
            table[row].find_elements(:tag_name => 'a')[1]
          end

          def modify_doc_button table,row
            col = 9
            table[row].find_elements(:tag_name => 'a')[2]
          end

          def del_doc_button table,row
            button_col = 9
            table[row].find_elements(:tag_name => 'a')[3]
          end

          def doc_list_table
            @driver[:id => 'dataListTable_NFSDataList']
          end

          def doc_title_input title
            @driver[:name => 'documentName'].clear
            @driver[:name => 'documentName'].send_keys title
          end

          def unclassified_class
            @driver[:id => 'NFS_tree_node_0_cb']
          end

        end#DocListPage
      end#DocList
    end#Dm
  end#Page
end#WebDriver