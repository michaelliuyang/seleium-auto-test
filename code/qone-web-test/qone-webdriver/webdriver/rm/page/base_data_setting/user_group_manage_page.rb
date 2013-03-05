require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require 'webdriver/support/table_action'
require  'webdriver/support/driver_extension_action'

module WebDriver
  module Rm
    module Page
      module BaseDataSetting
        class UserGroupManagePage < Common::BasePage
         include Support::MenuAction
         include Support::SwitchAction
         include Support::TableAction
         def to_this_page
           @page_profiles = Helper::ReadProfiles.apps_res_zh :rm
           requirements_manage = @page_profiles['requirements_manage']
           user_group_manage = @page_profiles['base_data_setting']['user_group_manage']
           menu_click requirements_manage
           show_menu_by_js('rm_bd')
           menu_click user_group_manage
         end

         def top_title
           top_title = @driver[:css=>'#content h2'].text
         end
         
         def add_user_group name
           add_button.click
           user_group_name_input name
           select_user_group_member
           submit_button.click
         end
         
         def look_user_group name
           table = table user_group_list_table
           name_col = 0
           row = find_target_row table,name,name_col
           if row
             look_button(table,row).click
             head_name = look_user_group_table_head_name
             return_button.click
           else
             raise "can't find target row" 
           end
           head_name
         end
         
         def modify_user_group old_name,new_name
           table = table user_group_list_table
           name_col = 0
           row = find_target_row table,old_name,name_col
           if row
             modify_button(table,row).click
             user_group_name_input new_name
             submit_button.click
           else 
             raise "can't find taget row"
           end
         end
         
         def del_user_group name
           table = table user_group_list_table
           name_col = 0
           row = find_target_row table,name,name_col
           if row
             delete_button(table,row).click
             alert_ok
           else 
             raise "can't find taget row"
           end
         end
         
         def user_group_name_exist? name
           name_col = 0
           table = table user_group_list_table
           find_keyword_in_table table,name,name_col
         end
         
         def look_user_group_table_head_name
           @driver[:css => "tr[id = 'dropHead'] td"].text
         end
         
         private
         
         def modify_button table,row
           table = table user_group_list_table
           button_col = 2
           table[row].find_elements(:tag_name => 'a')[1]
         end
         
         def delete_button table,row
           table = table user_group_list_table
           button_col = 2
           table[row].find_elements(:tag_name => 'a')[2]
         end 
         
         def look_button table,row
           table = table user_group_list_table
           button_col = 2
           table[row].find_elements(:tag_name => 'a')[0]
         end

         def add_button
          @driver[:id => 'new']
         end
         
         def return_button
           return_button_name = @page_profiles['base_data_setting']['return_button_name']
           @driver[:css => "input[value = '#{return_button_name}']"]
         end
         
         def look_user_group_table
           @driver[:id => 'dropDown']
         end
         
         
         def user_group_name_input name
          @driver[:id => 'name'].clear
          @driver[:id => 'name'].send_keys name
         end

         def user_group_description
           @driver[:name => 'description']
         end

         def user_group_member
           @driver[:xpath => "//img [@src = '/pm/skins/common/image/edit.gif']"]
         end

         def select_user_group_member
           user_group_member.click
           current_handle = @driver.window_handle
           handles = @driver.window_handles
           switch_alert_window(handles, current_handle)
           #select sa as a member,click the checkbox before sa
           select_sa_as_member.click
           sure_button.click
           switch_window current_handle
         end

          def select_sa_as_member
            @driver[:id => 'NFS_tree_node_0_cb']
          end

          def submit_button
            submit_button_name = @page_profiles['base_data_setting']['submit_button_name']
            @driver[:xpath => "//input [@value = '#{submit_button_name}']"]
          end
          
          def sure_button
            sure_button_name = @page_profiles['base_data_setting']['sure_button_name']
            @driver[:css => "input[value = '#{sure_button_name}']"]
          end

          
          def user_group_list_table
            @driver[:id => 'rmgrid']
          end
          
         
        end#HistoryBaselineListPage
      end#BaselineManage
    end#Page
  end#Rm
end#WebDriver