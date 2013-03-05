require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require 'webdriver/support/component'

module WebDriver
  module Prom
    module Page
      module FormCustom
        class FormTimingPage < Common::BasePage

          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component
          def to_this_page
            @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
            @data_prom = Helper::ReadProfiles.data :prom
            process_manage = @prom_profiles['process_manage']
            form_timing = @prom_profiles['form_process_custom']['form_timing_task']
            menu_click process_manage
            show_menu_by_js("spa_cf")
            menu_click form_timing
          end

          def top_title
            @driver[:css=> 'h2'].text
          end

          def new_form_timing_task(title,name,days)
            new_form_timing_task_button.click
            current_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, current_handle)
            input_form_timing_tast_content(title,name,days)
            sleep 2
            submit_button.click
            switch_window current_handle
          end
          
          def modify_form_timing_task title
            click_modify_img
            modify_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, modify_handle)
            tast_title.clear
            tast_title.send_keys title
            sleep 5
            submit_button.click
            switch_window modify_handle
          end
          
          def view_form_timing_task_title
            click_view_img
            view_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, view_handle)           
            view_top_title = top_title
            close_button.click
            switch_window view_handle
            view_top_title
          end
          
          def delete_form_timing
            click_delete_img
            alert_ok
          end
          
          #error          
          def stop_form_timing_task
            click_stop_img
            alert_ok 
          end
          
          def find_title_exist? title
            data_list = qone_data_list(timing_task_table)
            data_list.data_exist?(title,2)
          end

          private
          
          def click_delete_img
            task_name = @data_prom['form_timing']['name']
            data_list = qone_data_list(timing_task_table)
            data_list.operate(task_name,1,:delete,5)
          end
          
          def click_stop_img
            task_name = @data_prom['form_timing']['name']
            data_list = qone_data_list(timing_task_table)
            data_list.operate(task_name,1,:stop,5)
          end
          
          def click_view_img
            task_name = @data_prom['form_timing']['name']
            data_list = qone_data_list(timing_task_table)
            data_list.operate(task_name,1,:view,5)
          end
          
          def click_modify_img
            task_name = @data_prom['form_timing']['name']
            data_list = qone_data_list(timing_task_table)
            data_list.operate(task_name,1,:edit,5)
          end
          
          def timing_task_table
            @driver[:css => '#dataListTable_NFSDataList']
          end

          def input_form_timing_tast_content(title,name,days)
            tast_title.send_keys title
            sleep 2
            #no use
            handler_persons = select_handler_persons
            multiple_select_handler(handler_persons)
            tast_name.send_keys name
            end_time.select_today
            apart_days.send_keys days
          end


          def select_handler_persons
            handler_table = table node_handle_person_table
            rows =handler_table.row_count
            i = 1
            j = 0
            element = []
            while i < rows
              element[j] = handler_table[i][1].find_elements(:tag_name => 'div')
              j = j+1
              i =i+2
            end
            element
          end

          def multiple_select_handler(handler_elements)
            number = handler_elements.length
            (0...number).each do |i|
              handler = qone_multiple_select(@driver, handler_elements[i])
              handler.uncheck
              handler.select_by_index 0
              sleep 2
            end
          end


          def end_time
            qone_date(@driver,"id='endDate_id'")
          end
          
          def apart_days
            @driver[:css => '#simpleDay']
          end

          def node_handle_person_table
            @driver[:css => '#role-tbl']
          end

          def tast_name
            @driver[:css => '#jobName']
          end

          def tast_title
            @driver[:css => '#title']
          end

          def new_form_timing_task_button
            @driver[:class=> 'yellowButton']
          end

          def submit_button
            @driver[:css => "div[id='content'] form p input[type='submit']"]
          end

          def close_button
            @driver[:css => "div div input[type='button']"]
          end

        end #FormTimingPage
      end #FormCustom
    end # Page
  end #Prom
end # WebDriver