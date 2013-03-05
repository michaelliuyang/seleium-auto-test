require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action.rb'
require 'selenium-webdriver'
require 'webdriver/support/component.rb'
require 'webdriver/support/driver_extension_action'


module WebDriver
  module Pm
    module Page
      module ConfigManage
        class ConfigLibraryInformationPage < Common::BasePage
               include Support::MenuAction
               include Support::SwitchAction
               include Support::Component
               include Support::DriverExtensionAction

         def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            config_manage = @pm_profiles['config_manage']['config_manage']
            config_library_information = @pm_profiles['config_manage']['config_library_information']
            show_menu_by_js  "pm_scmt"
            menu_click config_library_information
          end

          def top_title
            @driver[:css => '#content h2'].text
          end

          def look_config_library_information(library_name)
            data_list = qone_data_list(config_information_table)
            data_list.operate(library_name,0,:view,8)
            sleep 5
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, current_handle)
            look_config_struct_title = top_title
            close_button.click
            switch_window current_handle
            look_config_struct_title
          end

          def modify_config_library_through_name(library_name,scm_name)
            data_list = qone_data_list(config_information_table)
            data_list.operate(library_name,0,:edit,9)
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            second_handle = switch_alert_window handles, first_handle
            scm_select = qone_select(@driver,scm_select_list)
            scm_select.select_by_text scm_name
            submit_button.click
            look_config_struct_button.click
            handles = @driver.window_handles
            switch_three_window handles, first_handle, second_handle
            close_button.click
            switch_window second_handle
            close_button.click
            switch_window first_handle
          end
          
          def find_scm_by_name scm_name
            data_list = qone_data_list(config_information_table)
            data_list.data_exist?(scm_name,7)
          end
          
          def add_develop_library_test(config_library_name,server_address,port,warehouse_address)
            new_develop_db_button.click
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            add_config_library_name.send_keys(config_library_name)
            add_server_address.send_keys(server_address)
            add_port.send_keys(port)
            add_warehouse_address.send_keys(warehouse_address)
            submit_button.click
            close_button.click
            switch_window first_handle
          end
          
          def find_config_by_name config_name
            data_list = qone_data_list(develop_library_table)
            data_list.data_exist?(config_name,0)
          end
          
          def create_user_relation_test(library_name,username,password)
            data_list = qone_data_list(develop_library_table)
            data_list.operate(library_name,0,:viewlog,7)
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, current_handle)
            @driver.find_element(:name=>'userName').send_keys(username)
            @driver.find_element(:name=>'password').send_keys(password)
            create_user_page_title = top_title
            submit_button.click
            close_button.click
            switch_window current_handle
            create_user_page_title
          end

          def modify_develop_library(old_library_name,config_library_name,server_address,port,warehouse_address)
            data_list = qone_data_list(develop_library_table)
            data_list.operate(old_library_name,0,:edit,7)
            sleep 2
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, current_handle)
            add_config_library_name.clear
            add_config_library_name.send_keys(config_library_name)
            add_server_address.clear
            add_server_address.send_keys(server_address)
            add_port.clear
            add_port.send_keys(port)
            add_warehouse_address.clear
            add_warehouse_address.send_keys(warehouse_address)
            submit_button.click
            sleep 2
            close_button.click
            switch_window current_handle
          end

          def look_develop_library(library_name)
            data_list = qone_data_list(develop_library_table)
            data_list.operate(library_name,0,:view,7)
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, current_handle)
            look_page_title = top_title
            sleep 2
            @driver.close
            switch_window current_handle
            look_page_title
          end

          def delete_develop_library(library_name)
            data_list = qone_data_list(develop_library_table)
            data_list.operate(library_name,0,:delete,7)
            sleep 10
            alert_ok
          end

          private
          
          def scm_select_list 
              @driver.find_element(:id => 'dbAdmin_input')
          end
          
          def scm_element_text
            @driver.find_element(:class => 'select_input_div')
          end

          def config_information_table
            @driver[:id => 'dataListTable_cmCPDataList']
          end

          def develop_library_table
            @driver[:id => 'dataListTable_cmDDataList']
          end

          def new_develop_db_button
            @driver.find_element(:id=>'yellowButton')
          end

          def submit_button
            submit_name=@pm_profiles['config_manage']['submit']
            @driver.find_element(:xpath=>"//input[@value = '#{submit_name}']")
          end

          def close_button
            close_name=@pm_profiles['config_manage']['close']
            @driver.find_element(:xpath=>"//input[@value = '#{close_name}']")
          end

          def switch_three_window(handles, first_handle, second_handle)
            handles.each do |handle|
              unless handle == first_handle &&handle == second_handle
              @driver.switch_to.window(handle)
              end
            end
          end

          def add_config_library_name
            @driver.find_element(:name=>'dbName')
          end

          def add_repository_type
            @driver.find_element(:name => 'dbType')
          end

          def add_connect_protocol
            @driver.find_element(:name => 'dbProtocol')
          end

          def add_server_address
            @driver.find_element(:name=>'dbIp')
          end

          def add_port
            @driver.find_element(:name=>'dbPort')
          end

          def add_warehouse_address
            @driver.find_element(:name=>'dbAddr')
          end
              
         end #ConfigLibraryInformationPage
      end # ConfigManage
    end #Page
  end # Pm
end   # WebDriver