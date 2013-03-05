require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component.rb'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/driver_extension_action'

module WebDriver
  module Cm
    module Page
      module ConfigLibraryRelation
          class ConfigLibraryRelationPage < Common::BasePage
          include Support::Component
          include Support::MenuAction
          include Support::SwitchAction
          include Support::DriverExtensionAction

          def top_title
            @driver[:css => '#content h2'].text
          end

          def to_this_page
            @cm_profiles = Helper::ReadProfiles.apps_res_zh :cm
            @cm_data = Helper::ReadProfiles.data :cm
            configuration_management =  @cm_profiles['configuration_management']
            config_library_relation =  @cm_profiles['config_library_relation']['config_library_relation']
            menu_click configuration_management
            menu_click config_library_relation
          end

          def modify_config_library_relation name
            table = table config_library_relation_table
            if is_config_library name
              element = modify_config_relation_button table,1
            else
              element = modify_config_relation_button table,2
            end
            element.click
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, current_handle)
            modify_config_information = top_title
            close_button.click
            switch_window current_handle
            modify_config_information
          end

          def create_user_relation(name,cm_username,cm_password)
             data_list.operate(name,0,:viewlog,6)
             first_handle =@driver.window_handle
             handles = @driver.window_handles
             switch_alert_window handles,first_handle
             sleep 3
             page_title = top_title
             username_text.send_keys(cm_username)
             password_text.send_keys(cm_password)
             submit_button.click
             switch_window first_handle
             page_title
          end
          def look_user_config_state(name)
             data_list.operate(name,0,:view,6)
             first_handle =@driver.window_handle
             handles = @driver.window_handles
             switch_alert_window handles,first_handle
             sleep 3
             page_title = top_title
             puts page_title
             @driver.close
             switch_window first_handle
             page_title
          end

          private

          def config_library_relation_table
            @driver[:id => 'dataListTable_NFSDataList']
          end

          def modify_config_relation_button table,row
            modify_relation_name = @cm_profiles['config_library_relation']['modify_relation']
            col = 6
            table[row][col].find_element(:xpath=>"//img [@title = '#{modify_relation_name}']")
          end

          def create_user_relation_button table,row
            col = 6
            table[row][col].find_element(:xpath=>"//img [@src = '/pm/skins/default/images/viewlog.gif']")
          end

          def look_config_state_button table,row
            col = 6
            table[row][col].find_element(:xpath=>"//img [@src = '/pm/skins/default/images/view.gif']")
          end

          def is_config_library name
            config_library_name = @cm_profiles['config_library_relation']['control_library']
            if name.should == config_library_name
            return 1
            else
            return 2
            end
          end

          def close_button
            close_name = @cm_profiles['config_library_relation']['close']
            @driver[:css => "input[value = #{close_name}]"]
          end
          def submit_button
             submit_name = @cm_profiles['config_library_relation']['submit']
             @driver[:css => "input[value = #{submit_name}]"]
          end
          def username_text
            @driver[:css => "input[name='scmUsername']"]
          end
          def password_text
            @driver[:css => "input[name='scmPassword']"]
          end
          def data_list
            table_name = @driver.find_element(:id =>'dataListTable_NFSDataList')
            qone_data_list(table_name)
          end
        end #ConfigLibraryRelationPage
      end #ConfigLibraryRelation
    end #  Page
  end # Cm
end  # WebDriver