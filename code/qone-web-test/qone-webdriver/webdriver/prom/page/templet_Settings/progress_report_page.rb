require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require 'webdriver/support/component'

module WebDriver
  module Prom
    module Page
      module TempletSettings
        class ProgressReportPage < Common::BasePage
          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component
          def to_this_page
            @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
            @data_prom = Helper::ReadProfiles.data :prom
            process_manage = @prom_profiles['process_manage']
            progress_report_template = @prom_profiles['templet_Settings']['progress_report_template']
            menu_click process_manage
            show_menu_by_js("spa_report")
            menu_click progress_report_template
          end

          def top_title
            @driver[:css=> 'h2'].text
          end

          def new_progress_report(name,describe,template)
            new_progress_report_button.click
            current_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, current_handle)
            template_name.send_keys name
            template_describe.send_keys describe
            select_form_template template
            submit_button.click
            switch_window current_handle
          end

          def modify_progress_report name
            modify_img_click
            modify_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, modify_handle)
            template_name.clear
            template_name.send_keys name
            submit_button.click
            switch_window modify_handle
          end

          def view_progress_report_title
            view_img_click
            view_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, view_handle)
            view_top_title = top_title
            close_button.click
            switch_window view_handle
            view_top_title
          end

          def delete_progress_report
            delete_img_click
            alert_ok
          end

          def find_template_name_exist? name
            data_list = qone_data_list(template_list_table)
            data_list.data_exist?(name,1)
          end

          def use_times_link_top_title
            click_use_times_link
            link_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, link_handle)
            link_top_title = top_title
            close_button_link.click
            switch_window link_handle
            link_top_title
          end

          private

          def click_use_times_link
            name = @data_prom['progress_report']['name_for_modify']
            title = @data_prom['progress_report']['title']
            str = "tbody tr td[title='#{title}'] div div nobr a"
            data_list = qone_data_list(template_list_table)
            data_list.operate(name,1,str,3)
          end

          def delete_img_click
            name = @data_prom['progress_report']['name_for_delete']
            data_list = qone_data_list(template_list_table)
            data_list.operate(name,1,:delete,4)
          end

          def view_img_click
            name = @data_prom['progress_report']['name_for_modify']
            data_list = qone_data_list(template_list_table)
            data_list.operate(name,1,:view,4)
          end

          def modify_img_click
            name = @data_prom['progress_report']['name_for_add']
            data_list = qone_data_list(template_list_table)
            data_list.operate(name,1,:edit,4)
          end

          def select_form_template form_template
            select_template = qone_select(@driver, select_template_element)
            select_template.select_by_text form_template
          end

          def close_button
            close_button = @prom_profiles['templet_Settings']['close_button']
            @driver.find_element(:xpath => "//input[@value='#{close_button}']")
          end

          def template_list_table
            @driver[:css => '#dataListTable_NFSDataList']
          end

          def select_template_element
            @driver[:css => '#cusTemplateId_input']
          end

          def template_name
            @driver[:name => 'tamplateName']
          end

          def template_describe
            @driver[:name => 'description']
          end

          def new_progress_report_button
            @driver[:css => "div[id='content'] span.button a.whitelink"]
          end

          def submit_button
            @driver[:css => "div[id='outer'] div form input[type='submit']"]
          end

          def close_button_link
            @driver[:name => 'return']
          end

        end #ProgressReportPage
      end #TempletSettings
    end # Page
  end #Prom
end # WebDriver