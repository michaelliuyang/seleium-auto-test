require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component'
require 'webdriver/support/switch_action'
require 'webdriver/support/driver_extension_action'

module WebDriver
  module Sm
    module Page
      module StaffManage
        class DepartmentManagePage < Common::BasePage
          
          include Support::MenuAction
          include Support::Component
          include Support::SwitchAction
          include Support::DriverExtensionAction
          
          def to_this_page
            @sm_profiles = Helper::ReadProfiles.apps_res_zh :sm
            system_manage = @sm_profiles['system_manage']
            department_manage = @sm_profiles['staff_manage']['department_manage']
            menu_click system_manage
            show_menu_by_js('sm_org')
            menu_click department_manage
          end

          def top_title
            switch_to_left_frame
            top_title = @driver[:css=>'#content h2'].text
            switch_out_frame
            top_title
          end

          def add_department name
            switch_to_left_frame
            add_department_button.click
            switch_out_frame
            switch_to_right_frame
            department_name_input.send_keys name
            submit_button.click
            switch_out_frame
          end

          def modify_department name,new_name
            switch_to_left_frame
            department_tree(name).click
            modify_department_button.click
            switch_out_frame
            switch_to_right_frame
            department_name_input.clear
            department_name_input.send_keys new_name
            submit_button.click
            switch_out_frame
          end

          def delete_department name
            switch_to_left_frame
            department_tree(name).click
            del_department_button.click
            alert_ok
            switch_out_frame
          end

          def find_department_by_name name
            switch_to_left_frame
            department = department_tree name
            switch_out_frame
            department
          end

          def add_user department_name
            switch_to_left_frame
            department_tree(department_name).click
            add_user_button.click
            switch_out_frame
          end

          def submit_add_user loginname,passwd,username,email
            switch_to_right_frame
            login_name.send_keys loginname
            password.send_keys passwd
            password_again.send_keys passwd
            user_name.send_keys username
            user_email.send_keys email
            add_user_submit_button.submit
            switch_out_frame
          end

          def modify_userinfo_by_loginname loginname, username
            search_by_login_name loginname
            switch_to_right_frame
            modify_img.click
            user_name.clear
            user_name.send_keys username
            submit_button.submit
            switch_out_frame
          end

          def search_by_login_name login_name
            switch_to_left_frame
            switch_out_frame           # when bug is fixed in qone, before 3 line code can be cancel
            switch_to_right_frame
            keyword_search.clear
            keyword_search.send_keys login_name
            checked_element_by_id keyword_search_box
            search_button.click
            switch_out_frame
          end

          def table_first_username
            switch_to_right_frame
            element = table_element
            table = table element
            username_text = table[1][3].find_elements(:tag_name=>'div')[0].text
            switch_out_frame
            username_text
          end
          
          def add_sub_department parent_department_name,sub_department_name
            switch_to_left_frame
            ele = department_tree parent_department_name
            ele.click
            add_sub_department_button.click
            switch_out_frame
            switch_to_right_frame
            department_name_input.send_keys sub_department_name
            submit_button.click
            switch_out_frame
          end

          private

          def switch_to_left_frame
            switch_to_frame iframe
            switch_to_frame left_treeview_frame
          end

          def switch_to_right_frame
            switch_to_frame iframe
            switch_to_frame right_main_frame
          end

          def department_hide_div
            department_hide_div_id = 'rightMenu'
          end
          
          def iframe
            @driver[:css=>"div[id='content'] iframe"]
          end

          def left_treeview_frame
            @driver[:name=>'department_left_treeview']
          end

          def right_main_frame
            @driver[:name=>'department_right_main']
          end
          
          def modify_department_by_right_menu
            @driver[:id=>'modifyDepartmentDiv']
          end

          def department_tree name
            @driver[:link=>name]
          end

          def login_name
            @driver[:class=>'addTable'].find_element(:name=>'userLoginId')
          end

          def password
            @driver[:name=>'currentPassword']
          end

          def password_again
            @driver[:name=>'reCurrentPassword']
          end

          def user_name
            @driver[:name=>'empName']
          end

          def user_email
            @driver[:name=>'emailAddress']
          end

          def department_name_input
            @driver[:css=>"form[id='department'] input[id='name']"]
          end

          def submit_button
            @driver[:css=>"input[type='submit']"]
          end
          
          def add_user_submit_button
            @driver[:css => "input[type = 'submit']"]
          end

          def keyword_search_box
            checkbox ='keyWordChecked'
          end

          def keyword_search
            @driver[:id =>"keyWord_id"]
          end

          def search_button
            @driver[:class=>'ie6-button']
          end

          def modify_img
            @driver[:css=>"img[src='/pm/component/datalist/css/menu/edit.gif']"]
          end

          def table_element
            @driver[:css=>"table[cellspacing='1']"]
          end

          def modify_user_table
            @driver[:class=>'addTable']
          end

          def add_department_button
            @driver[:id=>'departmentToolbar'].find_elements(:tag_name=>'a')[0]
          end

          def add_sub_department_button
            @driver[:id=>'departmentToolbar'].find_elements(:tag_name=>'a')[1]
          end

          def modify_department_button
            @driver[:id=>'departmentToolbar'].find_elements(:tag_name=>'a')[2]
          end

          def del_department_button
            @driver[:id=>'departmentToolbar'].find_elements(:tag_name=>'a')[3]
          end

          def add_user_button
            @driver[:id=>'departmentToolbar'].find_elements(:tag_name=>'a')[4]
          end

          def import_user_button
            @driver[:id=>'departmentToolbar'].find_elements(:tag_name=>'a')[5]
          end

          def manage_user_button
            @driver[:id=>'departmentToolbar'].find_elements(:tag_name=>'a')[6]
          end
          
          def add_sub_department_in_right_menu
            @driver[:id => 'addSubDepartmentDiv']
          end

        end # DepartmentManagePage
      end # StaffManage
    end # Page
  end # Sm
end # WebDriver