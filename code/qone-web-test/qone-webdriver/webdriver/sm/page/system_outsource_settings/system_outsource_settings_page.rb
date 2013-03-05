require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require 'webdriver/support/component'

module WebDriver
  module Sm
    module Page
      module SystemOutsourceSettings
        class SystemOutsourceSettingsPage  < Common::BasePage
          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component

          def to_this_page
            @page_profiles=Helper::ReadProfiles.apps_res_zh :sm
            system_manage =  @page_profiles['system_manage']
            system_outsource_settings =  @page_profiles['system_outsource_settings']['system_outsource_settings']
            menu_click system_manage
            menu_click system_outsource_settings
          end

          def top_title
            @driver[:css=>'h2'].text
          end

          def add_outsource_function  name
            add_outsource_button.click
            submit_add_outsource_page name
          end

          def modify_outsource_function  old_name,new_name
             operate_button old_name,:edit
             submit_add_outsource_page new_name
          end

          def del_outsource_function name
             operate_button name,:delete
             sleep 4
             alert_ok
          end

          def outsource_name_exist? name
            name_col = 0
            data_list = qone_data_list outsource_list_table,"style = 'display:none'",:all
            data_list.data_exist? name,name_col
          end


          private
          
          def submit_add_outsource_page name
            current_handle = @driver.window_handle
            handles= @driver.window_handles
            switch_alert_window(handles,current_handle)
            add_name name
            submit_button.click
            switch_window current_handle
          end
          
          def operate_button name,operate_type
            name_col = 0
            operate_col = 8
            data_list = qone_data_list outsource_list_table,"style *= 'display:none'",:all
            data_list.operate(name,name_col,operate_type,operate_col) 
          end
          
          def add_outsource_button
             name = @page_profiles['system_outsource_settings']['add_outsource_button_name']
             @driver[:link => name]
          end

          def add_name name
            @driver[:id=>'name'].clear
            @driver[:id=>'name'].send_keys name
          end

          def submit_button
            @driver[:id=>'submit']
          end
          
          def sure_button
            sure_button_name = @page_profiles['base_data_setting']['sure_button_name']
            @driver[:css => "input[value = '#{sure_button_name}']"]
          end

          def outsource_list_table
            @driver[:id=>'dataListTable_NFSDataList']
          end

        end # SystemOutsourceSettingsPage
      end # SystemOutsourceSettings
    end # Page
  end # Sm
end # WebDriver

