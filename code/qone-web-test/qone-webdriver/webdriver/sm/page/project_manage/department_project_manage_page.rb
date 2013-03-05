require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require  'webdriver/support/driver_extension_action'
require  'webdriver/support/component'

module WebDriver
  module Sm
    module Page
      module ProjectManage
        class DepartmentProjectManagePage  < Common::BasePage
          include Support::MenuAction
          include Support::SwitchAction
          include Support::DriverExtensionAction
          include Support::Component
          
          def to_this_page
            @sm_profiles = Helper::ReadProfiles.apps_res_zh :sm
            sm_menu_name = @sm_profiles['system_manage']
            project_manage_menu_name = @sm_profiles['project_manage']['project_manage']
            this_menu_name = @sm_profiles['project_manage']['department_project_manage']
            menu_click sm_menu_name
            menu_click_for_hide project_manage_menu_name,this_menu_name
         end
          
          def top_title
            switch_to_left_frame
            top_title = title_h2.text
            switch_out_frame
            top_title
          end

          def add_project_funtion id,name,pm,sm,ql,pcm,ccb
            switch_to_left_frame
            department_1.click
            show_menu_by_js department_div
            add_project_menu.click
            switch_out_frame
            submit_add_project_page id,name,pm,sm,ql,pcm,ccb
          end

          def search_project keyword
            search_by_keyword keyword
            switch_to_right_frame
            @table = table table_element
            row = 1,col = 3
            actual = @table[1][3].text
            switch_out_frame
            actual
          end

          private

          def search_by_keyword  keyword
            switch_to_right_frame
            @driver[:id=>'keyWord_id'].send_keys keyword
            checked_element_by_id('keyWordChecked')
            search_button.click
            switch_out_frame
          end

          def submit_add_project_page id,name,pm,sm,ql,pcm,ccb
            switch_to_right_frame
            project_id_text.send_keys id
            project_name_text.send_keys name
            pm_text.send_keys pm
            sm_text.send_keys sm
            ql_text.send_keys ql
            pcm_text.send_keys pcm
            ccb_text.send_keys ccb
            submit_button.submit
            switch_out_frame
          end

          def title_h2
            @driver[:css=>'#content h2']
          end

          def switch_to_left_frame
            switch_to_frame iframe
            switch_to_frame left_treeview_frame
          end

          def switch_to_right_frame
            switch_to_frame iframe
            switch_to_frame right_main_frame
          end

          def iframe
            @driver[:xpath=>"//iframe[@src='/pm/sm/projmgr/projMgr_frame.jsp?type=department'] "]
          end

          def left_treeview_frame
            @driver[:name=>'department_left_treeview']
          end

          def right_main_frame
            @driver[:name=>'department_right_main']
          end

          def department_1
            @driver[:name=>'department1']
          end

          def department_div
            id = 'departmentMenu'
          end

          def add_project_menu
           @driver[:id=>'departmentMenu'].find_elements(:tag_name=>'div')[6]
          end

          def project_id_text
            @driver[:name=>'projectNo']
          end

          def project_name_text
            @driver[:name=>'projectName']
          end

          def pm_text
            @driver[:id=>'pmIdView']
          end

          def sm_text
            @driver[:id=>'projSMsView']
          end

          def ql_text
            @driver[:id=>'qaIdView']
          end

          def pcm_text
            @driver[:id=>'pcmIdView']
          end

          def ccb_text
            @driver[:id=>'projCCBsView']
          end

          def submit_button
            @driver[:xpath=>"//input[@type='submit']"]
          end

          def search_button
            @driver[:class=>'ie6-button']
          end

          def table_element
            @driver[:xpath=>"//table[@cellspacing='1']"]
          end

          
        end #DepartmentProjectManagePage
      end # StaffManage
    end # Page
  end # Sm
end # WebDriver
