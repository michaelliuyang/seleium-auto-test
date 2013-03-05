require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require 'webdriver/support/table_action'
require 'webdriver/support/component'
require 'selenium-webdriver'

module WebDriver
  module Mea
    module Page
      module OrganizationMeasurement
        class BaselinesReportPage < Common::BasePage

          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component
          include Support::TableAction
          
          def to_this_page
            @mea_profiles = Helper::ReadProfiles.apps_res_zh :mea
            @mea_data = Helper::ReadProfiles.data :mea
            measure_analysis = @mea_profiles['measure_analysis']
            baselines_report = @mea_profiles['organization_measure']['process_baselines_report']
            menu_click measure_analysis
            sleep 1
            show_menu_by_js 'mt_pcb'
            sleep 1
            menu_click baselines_report
          end

          def top_title
            @driver[:css => 'h2'].text
          end

          def add_process_baselines_report(report_name,create_date,date_begin,date_end)
            add_process_baselines_report_button.click
            sleep 1
            handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles,handle)
            add_measure_index
            input_baselines_report_contexts(report_name,create_date,date_begin,date_end)
            sleep 1
            submit_button.click
            switch_window handle
          end
          
          def report_name_link_top_title
            report_name_link_click
            handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles,handle)
            name_link_top_title = top_title
            close_button.click
            switch_window handle
            name_link_top_title
          end
          
          def modify_process_baselines_report report_name
            modify_img_click
            sleep 1
            handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles,handle)
            baselines_report_name.clear
            baselines_report_name.send_keys report_name
            sleep 1
            submit_button.click
            switch_window handle
          end
          
          def delete_process_baselines_report
            delete_img_click
            sleep 5
            alert_ok
          end

          def baselines_name_exist? report_name
            data_list = qone_data_list(baselines_report_list_table)
            data_list.data_exist?(report_name,1)
          end

          def for_add_index_success_judge? index_name
            report_name_link_click
            sleep 1
            handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles,handle)
            sleep 2
            success = find_index_name? index_name
            close_button.click
            switch_window handle
            success
          end

          private
          
          def modify_img_click
            report_name = @mea_data['process_baselines_report']['report_name_for_add']
            data_list = qone_data_list(baselines_report_list_table)
            data_list.operate(report_name,1,:edit,6)
          end
          
          def delete_img_click
            report_name = @mea_data['process_baselines_report']['report_name_for_delete']
            data_list = qone_data_list(baselines_report_list_table)
            data_list.operate(report_name,1,:delete,6)
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
          
          def report_name_link_click
            name = @mea_data['process_baselines_report']['report_name_for_add']
            title = @mea_data['process_baselines_report']['report_name_for_add']            
            data_list = qone_data_list(baselines_report_list_table)
            str = "table tbody tr td[title='#{title}'] div div nobr a"            
            data_list.operate(name,1,str,1)
          end

          def input_baselines_report_contexts(report_name,create_date,date_begin,date_end)
            baselines_report_name.send_keys report_name
            use_create_date.input_date(create_date)
            sleep 2
            use_date_begin.input_date(date_begin)
            sleep 1
            use_date_end.input_date(date_end)
          end

          def add_measure_index
            add_index_button.click
            current_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, current_handle)
            selected_measure_index_name.click
            sleep 2
            submit_button.click
            sleep 2
            switch_window current_handle
          end
          
          def report_name_link
            @driver[:css => '']
          end

          def index_list_table
            @driver.all(:css=>'table')[1]
          end

          def baselines_report_list_table
            @driver[:id => 'dataListTable_NFSDataList']
          end

          def add_process_baselines_report_button
            @driver[:class => 'whitelink']
          end

          def baselines_report_name
            @driver.find_element(:name => 'name')
          end

          def selected_measure_index_name
            @driver[:id => 'typeall_type1']
          end

          def submit_button
            @driver[:name => 'submit']
          end

          def close_button
            @driver[:name => 'return']
          end

          def add_index_button
            @driver[:css => "div[id='content'] form span.button a"]
          end

          def use_date_begin
            qone_date(@driver,"id='expectedUseFrom_id'")
          end

          def use_date_end
            qone_date(@driver,"id='expectedUseTo_id'")
          end

          def use_create_date
            qone_date(@driver,"id='createOn_id'")
          end

        end
      end
    end
  end#
end#WebDriver