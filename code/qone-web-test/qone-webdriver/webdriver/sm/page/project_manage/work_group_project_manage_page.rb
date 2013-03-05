require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require 'webdriver/support/component'

module WebDriver
  module Sm
    module Page
      module ProjectManage
        class WorkGroupProjectManagePage < Common::BasePage
          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component

          def to_this_page
            @sm_profiles = Helper::ReadProfiles.apps_res_zh :sm
            sm_menu_name = @sm_profiles['system_manage']
            project_manage_menu_name = @sm_profiles['project_manage']['project_manage']
            this_menu_name = @sm_profiles['project_manage']['work_group_project_manage']
            menu_click sm_menu_name
            menu_click_for_hide project_manage_menu_name, this_menu_name
          end

          def top_title
            switch_to_left_frame
            top_title = title_h2.text
            switch_out_frame
            top_title
          end

          def add_project_under_work_group id, name, pm, sm, ql, pcm, ccb
            switch_to_left_frame
            first_work_group_element.click
            show_menu_by_js work_group_hide_div_id
            add_project_button.click
            switch_out_frame
            switch_to_right_frame
            submit_add_project_page id, name, pm, sm, ql, pcm, ccb
            switch_out_frame
          end

          def submit_add_project_page id, name, pm, sm, ql, pcm, ccb
            @driver[:name=>'projectNo'].send_keys id
            @driver[:name=>'projectName'].send_keys name
            @driver[:css=>"input#pmIdView"].send_keys pm
            @driver[:id=>"projSMsView"].send_keys sm
            @driver[:id=>"qaIdView"].send_keys ql
            @driver[:id=>"pcmIdView"].send_keys pcm
            @driver[:id=>"projCCBsView"].send_keys ccb
            @driver[:xpath=>"//input[@type='submit']"].click
          end

          #def submit_add_proj id, name, pm, sm, ql, pcm, ccb
          #  @driver[:name=>'projectNo'].send_keys id
          #  @driver[:name=>'projectName'].send_keys name
          #  @driver[:css=>"input[id='pmIdView'] +img"].click
          #  handle = @driver.window_handle
          #  all_handles= @driver.window_handles
          #  switch_alert_window(all_handles,handle)
          #  user_tree = qone_user_tree @driver
          #  user_tree.select_node_by_name "h1"
          #  @driver[:xpath=>"//input[@type='button']"].click
          #end


          def find_project_by_name pro_name
            switch_to_right_frame
            table = table table_element
            flag = false
            rows = table.row_count
            (1...rows).each do |x|
              if table[x][3].text == pro_name
                flag = true
                break
              end
            end
            flag
          end

          private
          def table_element
            @driver[:xpath=>"//table[@cellspacing='1']"]
          end

          def switch_to_left_frame
            switch_to_frame iframe
            switch_to_frame left_frame
          end

          def switch_to_right_frame
            switch_to_frame iframe
            switch_to_frame right_frame
          end

          def iframe
            @driver[:xpath=>"//iframe[@src='/pm/sm/projmgr/projMgr_frame.jsp?type=workgroup']"]
          end

          def left_frame
            @driver[:name=>'department_left_treeview']
          end

          def right_frame
            @driver[:name=>'department_right_main']
          end

          def title_h2
            @driver[:css=>'#content h2']
          end

          def first_work_group_element
            @driver[:class=>'webfx-tree-children'].find_elements(:tag_name=>'a')[0]
          end

          def work_group_hide_div_id
            'workgroupMenu'
          end

          def add_project_button
            @driver[:id=>'workgroupMenu'].find_elements(:tag_name=>'div')[6]
          end


        end #WorkGroupProjectManagePage
      end # StaffManage
    end # Page
  end # Sm
end # WebDriver
