require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'

module WebDriver
  module Sm
    module Page
      module StaffManage
        class WorkGroupManagePage < Common::BasePage
          include Support::MenuAction
          include Support::SwitchAction

          def to_this_page
            @page_profiles=Helper::ReadProfiles.apps_res_zh :sm
            system_manage = @page_profiles['system_manage']
            staff_manage = @page_profiles['staff_manage']['staff_manage']
            work_group_manage = @page_profiles['staff_manage']['work_group_manage']
            menu_click system_manage
            menu_click_for_hide(staff_manage, work_group_manage)
          end

          def top_title
            switch_to_left
            top_title = @driver[:css=>'#content h2'].text
            switch_out_frame
            top_title
          end

          def add_work_group  name
            switch_to_left
            sleep 3
            add_work_group_img.click
            switch_out_frame
            switch_to_right
            add_work_group_name_element.send_keys name
            submit_button.click
            switch_out_frame
          end

          def find_work_group_under_organization work_group_name
            switch_to_left
            flag = false
            sleep 2
            @driver[:class=>'webfx-tree-children'].all(:tag_name=>'a').each do |x|
              if x.text == work_group_name
                flag = true
                break
              end
            end
            flag
          end


          private

          def add_work_group_img
            @driver[:id=>'changeOrganizationToolbar'].find_elements(:tag_name=>'a')[1]
          end

          def switch_to_left
            switch_to_frame iframe
            switch_to_frame left_frame
          end

          def switch_to_right
            switch_to_frame iframe
            switch_to_frame right_frame
          end

          def iframe
            @driver[:xpath=>"//iframe[@src='/pm/sm/orgmgr/organizationDepartment_frame.jsp?type=workgroup']"]
          end

          def left_frame
            @driver[:name=>'department_left_treeview']
          end

          def right_frame
            @driver[:name=>'department_right_main']
          end

          def add_work_group_name_element
            @driver[:name=>'name']
          end

          def submit_button
            @driver[:css=>"div input[type='submit']"]
          end

        end # WorkGroupManagePage
      end # StaffManage
    end # Page
  end # Sm
end # WebDriver