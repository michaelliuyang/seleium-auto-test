require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require 'webdriver/support/component'

module WebDriver
  module Prom
    module Page
      module DataStatistics
        class ProcessPerformancePage < Common::BasePage

          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component
          def to_this_page
            @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
            @data_prom = Helper::ReadProfiles.data :prom
            process_manage = @prom_profiles['process_manage']
            process_performance = @prom_profiles['process_data_statistics']['process_performance']
            menu_click process_manage
            show_menu_by_js("spa_ud")
            menu_click process_performance
          end

          def top_title
            @driver[:css=> 'h2'].text
          end

          def add_process_performance(name,create_date,start_date,end_date)
            add_process_performance_button.click
            current_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, current_handle)
            name_text.send_keys name
            create_time.input_date(create_date)
            expect_time_start.input_date(start_date)
            expect_time_end.input_date(end_date)
            add_index
            submit_button.click
            switch_window current_handle
          end
          
          def modify_process_performance name
            modify_img_click
            modify_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, modify_handle)
            name_text.clear
            name_text.send_keys name
            submit_button.click
            switch_window modify_handle
          end
          
          def delete_process_performance
            delete_img_click
            alert_ok
          end
          
          def publish_process_report
            publish_img_click
            alert_ok
          end

          def find_baseline_report_name? name
            data_list = qone_data_list(baseline_list_table)
            data_list.data_exist?(name,1)
          end

          private
          
          def publish_img_click
            name = @data_prom['process_performance']['name_for_modify']
            data_list = qone_data_list(baseline_list_table)
            data_list.operate(name,1,:active1,5)
          end
          
          def delete_img_click
            name = @data_prom['process_performance']['name_for_modify']
            data_list = qone_data_list(baseline_list_table)
            data_list.operate(name,1,:delete,6)
          end
          
          def modify_img_click
            name = @data_prom['process_performance']['name_for_add']
            data_list = qone_data_list(baseline_list_table)
            data_list.operate(name,1,:edit,6)
          end

          def baseline_list_table
            @driver[:css => '#dataListTable_NFSDataList']
          end

          def add_index
            add_index_button.click
            index_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, index_handle)
            judge_fault_select_box.click
            submit_button.click
            switch_window index_handle
          end

          def name_text
            @driver[:name => 'name']
          end

          def create_time
            qone_date(@driver,"id='createOn_id'")
          end

          def expect_time_start
            qone_date(@driver,"id='expectedUseFrom_id'")
          end

          def expect_time_end
            qone_date(@driver,"id='expectedUseTo_id'")
          end

          def judge_fault_select_box
            @driver[:css => '#typeall_type5']
          end

          def add_process_performance_button
            @driver[:css => "div[id='content'] span a.whitelink"]
          end

          def close_button
            @driver[:name=> 'return']
          end

          def submit_button
            @driver[:name => 'submit']
          end

          def add_index_button
            @driver[:css => "div form span.button a"]
          end

        end#ProcessUsePage
      end#DataStatistics
    end# Page
  end #Prom
end# WebDriver