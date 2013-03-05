require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require 'webdriver/support/table_action'
require 'webdriver/support/component'

module WebDriver
  module Mea
    module Page
      module MeasurementSet
        class MeasureTargetPage < Common::BasePage

          include Support::MenuAction
          include Support::SwitchAction
          include Support::TableAction
          include Support::Component
          def to_this_page
            @mea_profiles = Helper::ReadProfiles.apps_res_zh :mea
            @data_mea = Helper::ReadProfiles.data :mea
            measure_analysis = @mea_profiles['measure_analysis']
            measure_target = @mea_profiles['measure_setup']['measure_target']
            menu_click measure_analysis
            show_menu_by_js 'mt_em'
            menu_click measure_target
          end

          def top_title
            @driver[:css => 'h2'].text
          end

          def add_measure_target target_name
            add_button.click
            add_measure_target_name.send_key target_name
            add_measure_target_submit_button.click
          end

          def view_measure_top_title
            view_img_click
            view_top_title = top_title
            return_button.click
            view_top_title
          end

          def modify_measure name
            modify_measure_img_click
            sleep 2
            add_measure_target_name.clear
            add_measure_target_name.send_keys name
            sleep 2
            add_measure_target_submit_button.click
          end

          def add_index
            add_button.click
            sleep 2
            add_button.click
            index_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles,index_handle)
            member_workload_deviation_index.click
            task_complete_situation.click
            measure_index_system_submit_button.click
            sleep 2
            switch_window index_handle
          end

          def delete_measure
            delete_img_click
            sleep 10
            alert_ok
          end

          #delete only one data's code
          # def delete_index
          # delete_button.click
          # alert_ok
          # end

          def delete_index index_name
            table = table index_list_table
            name_col = 0
            row = find_target_row table,index_name,name_col
            if row
              delete_button(table,row).click
              alert_ok
            else
              raise "can not find target row"
            end
          end

          def find_target_name_exist? target_name
            data_list = qone_data_list(measure_target_list_table,"style*='display:none'",:all)
            data_list.data_exist?(target_name,0)
          end

          def find_index_name? index_name
            table_index = table index_list_table
            flag = false
            cells = table_index.all(:css=>"tbody tr td")
            cells.each do |cell|
              if cell.text == index_name
              flag = true
              break
              end
            end
            flag
          end

          private

          #delete only one data's code
          # def delete_button
          # table = table index_list_table
          # table[1].find_element(:css => 'a img')
          # end

          def modify_measure_img_click
            target_name = @data_mea['measure_target']['name_for_add']
            data_list = qone_data_list(measure_target_list_table,"style*='display:none'",:all)
            data_list.operate(target_name,0,:edit,2)
          end

          def view_img_click
            target_name = @data_mea['measure_target']['name_for_add']
            data_list = qone_data_list(measure_target_list_table,"style*='display:none'",:all)
            data_list.operate(target_name,0,:view,2)
          end

          def delete_img_click
            target_name = @data_mea['measure_target']['name_for_delete']
            data_list = qone_data_list(measure_target_list_table,"style*='display:none'",:all)
            data_list.operate(target_name,0,:delete,2)
          end

          def delete_button table,row
            table = table index_list_table
            table[row].find_element(:css => 'a img')
          end

          def measure_target_list_table
            @driver[:css => '#dataListTable_NFSDataList']
          end

          def add_button
            @driver[:class => 'whitelink']
          end

          def measure_index_system_list_table
            @driver[id=> 'metricsIndexTable']
          end

          def add_measure_target_name
            @driver[:name => 'metricsTargetName']
          end

          def add_measure_target_submit_button
            @driver[:css => 'form input[type=submit]']
          end

          def member_workload_deviation_index
            @driver[:id => 'type0_level1_EM_Workload_TaskInfoWorkloadWindge']
          end

          def task_complete_situation
            @driver[:id => 'type2_level1_EM_EV_TaskInfo']
          end

          def measure_index_system_submit_button
            submit_button = @mea_profiles['measure_setup']['submit_button']
            @driver[:css => "#content input[value='#{submit_button}']"]
          end

          def return_button
            @driver[:css => "input[type='button']"]
          end

          def index_list_table
            @driver.all(:css=>'table')[1]
          end

        end #MeasureTargetPage
      end #MeasurementSet
    end #Page
  end #Ma
end #WebDriver