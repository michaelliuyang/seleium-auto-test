require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require 'webdriver/support/component'

module WebDriver
  module Prom
    module Page
      module EvaluationTable
        class EvaluationTablePage < Common::BasePage

          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component
          def to_this_page
            @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
            @data_prom = Helper::ReadProfiles.data :prom
            process_manage = @prom_profiles['process_manage']
            evaluation_table = @prom_profiles['process_evaluation_evidence_table']['process_evaluation_evidence_table']
            menu_click process_manage
            menu_click evaluation_table
          end

          def top_title
            @driver[:css=> 'h2'].text
          end

          def new_piids(name,level)
            new_evaluation_button.click
            current_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, current_handle)
            piids_name.send_keys name
            select_evaluation_level level
            create_piids_button.click
            save_button.click
            close_button_modify
            switch_window current_handle
          end

          def modify_piids name
            modify_img_click
            modify_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, modify_handle)
            piids_name.clear
            piids_name.send_keys name
            save_button.click
            close_button_modify.click
            switch_window modify_handle
          end

          def view_piids_title
            view_img_click
            view_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, view_handle)
            view_top_title = top_title
            close_button_view.click
            switch_window view_handle
            view_top_title
          end

          def delete_piids
            delete_img_click
            alert_ok
          end

          def piids_name_link_title
            piids_name_link_click
            link_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, link_handle)
            link_top_title = top_title
            close_button_view.click
            switch_window link_handle
            link_top_title
          end

          def piids_name_link_click
            name = @data_prom['evaluation_evidence_table']['name_for_delete']
            title = @data_prom['evaluation_evidence_table']['name_for_delete']
            str = "tbody tr td[title='#{title}'] div div a"
            data_list = qone_data_list(piids_list_table,"style*='display:none'",:all)
            data_list.operate(name,1,str,1)
          end

          def find_piids_name_exist? name
            data_list = qone_data_list(piids_list_table,"style*='display:none'",:all)
            data_list.data_exist?(name,1)
          end

          private

          def delete_img_click
            name = @data_prom['evaluation_evidence_table']['name_for_delete']
            data_list = qone_data_list(piids_list_table,"style*='display:none'",:all)
            data_list.operate(name,1,:delete,6)
          end

          def view_img_click
            name = @data_prom['evaluation_evidence_table']['name_for_modify']
            data_list = qone_data_list(piids_list_table,"style*='display:none'",:all)
            data_list.operate(name,1,:view,6)
          end

          def modify_img_click
            name = @data_prom['evaluation_evidence_table']['name_for_add']
            data_list = qone_data_list(piids_list_table,"style*='display:none'",:all)
            data_list.operate(name,1,:edit,6)
          end

          def select_evaluation_level evaluation_level
            select_level = qone_select(@driver, evaluation_level_select)
            select_level.select_by_text evaluation_level
          end

          def piids_list_table
            @driver[:css => '#dataListTable_NFSDataList']
          end

          def piids_name
            @driver[:name => 'piidsName']
          end

          def evaluation_level_select
            @driver[:css => '#assessmentLevel_input']
          end

          def create_piids_button
            @driver[:css => '#submitBtn']
          end

          def save_button
            @driver[:css => '#saveSubmit']
          end

          def new_evaluation_button
            @driver[:css => "div[id='content'] div a"]
          end

          def new_evaluation_page_top_title
            @driver[:css=> 'h2'].text
          end

          def close_button
            @driver[:name=> 'close']
          end

          def close_button_view
            @driver.find_element(:css => "div[id='content'] div[align='center']").find_elements(:tag_name => 'input')[2]
          end

          def close_button_modify
            @driver.find_element(:css => "div[id='content'] div[align='center']").find_elements(:tag_name => 'input')[3]
          end

        end#EvaluationTablePage
      end#EvaluationTable
    end# Page
  end #Prom
end# WebDriver