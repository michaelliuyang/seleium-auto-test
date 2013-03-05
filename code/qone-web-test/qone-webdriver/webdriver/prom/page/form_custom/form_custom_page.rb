require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require 'webdriver/support/component'

module WebDriver
  module Prom
    module Page
      module FormCustom
        class FormCustomPage < Common::BasePage

          include Support::MenuAction
          include Support::SwitchAction      
          include Support::Component
          def to_this_page
            @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
            @data_prom = Helper::ReadProfiles.data :prom
            process_manage = @prom_profiles['process_manage']
            form_custom = @prom_profiles['form_process_custom']['form_custom']
            menu_click process_manage
            show_menu_by_js("spa_cf")
            menu_click form_custom
          end

          def top_title
            @driver[:css=> 'h2'].text
          end

          def new_form name
            new_form_button.click
            new_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, new_handle)
            define_form name
            publish_Button.click
            switch_window new_handle
          end

          def modify_form name
            click_modify_img
            modify_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, modify_handle)
            form_name.clear
            form_name.send_keys name
            publish_Button.click
            switch_window modify_handle
          end

          def delete_form
            click_delete_img
            alert_ok
          end

          def view_form_title
            click_view_img
            view_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, view_handle)
            view_title = top_title
            switch_window view_handle
            view_title
          end

          def viewProcess_form_text
            click_viewProcess_img
            viewProcess_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, viewProcess_handle)
            text = viewProcess_text
            text_close_button.click
            switch_window viewProcess_handle
            text
          end

          def find_form_name_exist? form_name
            data_list = qone_data_list(form_list_table)
            data_list.data_exist?(form_name,0)
          end

          def add_form_type type_name
            maintenance_form_type_button.click
            add_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, add_handle)
            add_form_type_button.click
            form_type_text_box.send_keys type_name
            form_type_submit_button.click
            form_type_close_button.click
            switch_window add_handle
          end

          def delete_form_type
            maintenance_form_type_button.click
            delete_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, delete_handle)
            click_delete_type_img
            alert_ok
            sleep 6
            switch_window delete_handle
          end

          private

          def click_delete_type_img
            type_name = @data_prom['form_custom']['name_for_add']
            type_table = table form_type_table
            col = 1
            row = find_type_name_row type_table,type_name,col
            puts row
            if row
              delete_img = find_delete_type_img(row)
              delete_img.click
            else
              raise "can not find target row"
            end
          end
          
          def find_type_name_row table,name,col
          num = table.row_count
          row = 1
          (1..num-1).each do |y|
            if table[y][col].text == name
              row =y
            end
          end
          row
      end
          
          def find_delete_type_img(row)
            type_table = table form_type_table
            type_table[row][3].find_element(:css => "tbody tr td a img[src='/pm/skins/default/images/delete.gif']")
          end

          def form_type_table
            @driver[:css => '#formTypeTable']
          end

          def viewProcess_text
            switch_to_frame iframe
            text = @driver[:css => '#panelDraghandle'].text
            switch_out_frame
            text
          end

          def click_modify_img
            name = @data_prom['form_custom']['name_for_add']
            data_list = qone_data_list(form_list_table)
            data_list.operate(name,0,:edit,7)
          end

          def click_delete_img
            name = @data_prom['form_custom']['name_for_delete']
            data_list = qone_data_list(form_list_table)
            data_list.operate(name,0,:delete,7)
          end

          def click_view_img
            name = @data_prom['form_custom']['name_for_view']
            data_list = qone_data_list(form_list_table)
            data_list.operate(name,0,:view,7)
          end

          def click_viewProcess_img
            name = @data_prom['form_custom']['name_for_modify']
            data_list = qone_data_list(form_list_table)
            data_list.operate(name,0,:viewProcess,7)
          end

          def define_form name
            form_name.send_keys name
            sleep 2
            select_start_form_person
            sleep 2
            nodes_exist_set
            sleep 2
            nodes_power_set
            sleep 2
          end

          def select_start_form_person
            start_form_person_img.click
            start_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, start_handle)
            start_person.click
            sleep 2
            confirm_button_start_person.click
            switch_window start_handle
          end

          def nodes_exist_set
            set_nodes_exit_button.click
            nodes_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, nodes_handle)
            pass_node.click
            sleep 2
            fail_node.click
            sleep 2
            confirm_button_exist_set.click
            switch_window nodes_handle
          end

          def nodes_power_set
            set_nodes_power_button.click
            power_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, power_handle)
            read.click
            sleep 2
            input_new_content.click
            sleep 2
            write_again.click
            sleep 2
            power_confirm_button.click
            switch_window power_handle
          end

          def form_type_submit_button
            @driver[:css => "form div input[type='submit']"]
          end

          def form_type_close_button
            @driver[:css => "form div input[type='close']"]
          end

          def form_type_text_box
            @driver[:css => "table[id='formTypeTable'] tbody tr td[id='table_new2_9'] input[name='descriptions']"]
          end

          def text_close_button
            @driver[:css => 'div.nfs-transition-buttonDiv input']
          end

          def iframe
            @driver[:css => "iframe[src='../cusvisual/main/autoPose.htm']"]
          end

          def form_list_table
            @driver[:css => '#dataListTable_NFSDataList']
          end

          def new_form_button
            @driver[:css=> '#createFormButton']
          end

          def form_name
            @driver[:css => '#pname-inp']
          end

          def start_form_person_img
            @driver[:css => '#weight_start_btn']
          end

          def start_person
            @driver[:css => '#NFS_tree_node_1_cb']
          end

          def confirm_button_start_person
            @driver[:css => 'div div div.nfs-weight-buttonDiv'].find_elements(:tag_name => 'input')[0]
          end

          def add_nodes_button
            @driver[:css => "div.whiteBack div form span.button a.whitelink"]
          end

          def set_nodes_exit_button
            @driver[:css => "td.nfs-auditProcSetup-textR"].find_elements(:tag_name => 'input')[0]
          end

          def set_nodes_power_button
            @driver[:css => "td.nfs-auditProcSetup-textR"].find_elements(:tag_name => 'input')[1]
          end

          def confirm_button_exist_set
            @driver[:css => 'div div div.nfs-transition-buttonDiv'].find_elements(:tag_name => 'input')[0]
          end

          def pass_node
            @driver[:css => '#start_PASS']
          end

          def fail_node
            @driver[:css => '#start_FAIL']
          end

          def read
            @driver[:css => '#all_read_start']
          end

          def input_new_content
            @driver[:css => '#all_add_start']
          end

          def write_again
            @driver[:css => '#all_change_start']
          end

          def power_confirm_button
            @driver[:css => '#okButton']
          end

          def publish_Button
            @driver[:css => '#publishiButton']
          end

          def maintenance_form_type_button
            @driver[:css => '#apptypeButton']
          end

          def add_form_type_button
            @driver[:css => '#yellowButton']
          end

        end #FormCustomPage
      end #FormCustom
    end # Page
  end #Prom
end # WebDriver