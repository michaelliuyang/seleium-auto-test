require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require 'webdriver/support/component'

module WebDriver
  module Wkb
    module Page
      module CreateForm
        class CreateFormPage < Common::BasePage

          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component
          def to_this_page
            @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
            @data_wkb = Helper::ReadProfiles.data :wkb
            work_bench = @wkb_profiles['work_bench']
            create_order = @wkb_profiles['create_form']['create_form']
            menu_click work_bench
            menu_click create_order
          end

          def page_title
            @driver.title
          end

          def launch_form(form_name,title,project_name)
            launch_form_click form_name
            sleep 2
            input_form_context(title,project_name)
            sleep 2
            notice_text = notice_success_tip
          end

          def examine_and_approve_page
            examine_and_approve_click
            examine_and_approve_top_title
          end

          private

          def launch_form_click from_name
            data_list = qone_data_list(form_list_table)
            data_list.operate(from_name,0,:faqi,4)
          end

          def input_form_context(title,project_name)
            handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, handle)
            sleep 2
            form_title.clear
            form_title.send_keys title
            select_project project_name
            handler_persons = select_handler_persons
            multiple_select_handler(handler_persons)
            input_form_opinions
            sleep 2
            submit_button.click
            alert_ok
            switch_window handle
          end

          def select_project project_name
            select_project = qone_select(@driver, select_project_element)
            select_project.select_by_text project_name
          end

          def select_handler_persons
            handler_table = table handler_table_element
            rows =handler_table.row_count
            i = 1
            j = 0
            element = []
            while i < rows
              element[j] = handler_table[i][1].find_elements(:tag_name => 'div')[0]
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

          def input_form_opinions
            opinion_iframes = @driver.all(:css => 'iframe.ke-iframe')
            opinion_iframes.each do |opinion_iframe|
              switch_to_frame opinion_iframe
              input_form_opinion
              switch_out_frame
            end
          end

          def input_form_opinion
            opinion = @data_wkb['create_form']['opinion_for_form']
            opinion_elements = @driver[:class => 'ke-content']
            opinion_elements.send_keys opinion
          end
          
          def examine_and_approve_click
            title = @data_wkb['create_form']['template_name']
            form_name = @data_wkb['create_form']['name_for_form']
            str = "table[id='dataListTable_NFSDataList'] tr td[title='#{title}'] div div a"
            data_list = qone_data_list(form_table)
            data_list.operate(form_name,0,str,2)
          end
          
          def examine_and_approve_top_title
            handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, handle)
            title = top_title
            @driver[:css => "div[id='content'] p input[type='button']"].click
            switch_window handle
            title
          end

          def form_title
            @driver[:css => '#requestName']
          end

          def select_project_element
            @driver[:css => '#projectId_input']
          end

          def form_list_table
            @driver[:css => '#dataListTable_NFSDataList']
          end

          def handler_table_element
            @driver[:css => '#auditorChonseTable']
          end

          def submit_button
            submit_button = @wkb_profiles['create_form']['submit_button']
            @driver[:css => "form input[value='#{submit_button}']"]
          end

          def notice_success_tip
            @driver[:css => '#notice'].text
          end

          def form_table
            @driver[:css => '#dataListTable_NFSDataList']
          end
          
          def top_title
            @driver[:css => 'h2'].text[0..6]
          end

        end # CreateFormPage
      end #CreateForm
    end #  Page
  end # Wkb
end #WebDriver