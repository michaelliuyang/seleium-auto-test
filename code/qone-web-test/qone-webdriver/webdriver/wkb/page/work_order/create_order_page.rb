require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require 'webdriver/support/component'

module WebDriver
  module Wkb
    module Page
      module WorkOrder
        class CreateOrderPage < Common::BasePage
          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component

          def top_title
            @driver[:css => '#content h2'].text
          end

          def to_this_page
            @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
            @data_wkb = Helper::ReadProfiles.data :wkb
            work_bench = @wkb_profiles['work_bench']
            # work_order = @wkb_profiles['create_order']['create_order']
            create_order = @wkb_profiles['create_order']['create_order']
            menu_click work_bench
            menu_click create_order
          end

          def table_a
            table_element = @driver.find_element(:id => 'dataListTable_NFSDataList')
            table = table table_element
          end

          def select_handler_elements
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

          def select_project(project_name)
            select_project = qone_select(@driver, select_project_element)
            select_project.select_by_text project_name
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

          def click_start_order(order_name,order_type)
            rows = table_a.row_count
            (1...rows-1).each do |row|
              if table_order_name(row).text == order_name && table_order_type(row).text == order_type
                table_start_order_button(row).click
              end
            end
          end

          def find_and_input_opeion_context
            opinion_iframes = @driver.all(:css => 'iframe.ke-iframe')
            opinion_iframes.each do |opinion_iframe|
              switch_to_frame opinion_iframe
              input_order_opinion
              switch_out_frame
            end
           end
           
          def input_order_opinion 
            opinion = @data_wkb['create_order']['opinion']
            opinion_elements = @driver[:class => 'ke-content']
            opinion_elements.send_keys opinion
          end

          def order_title
            order_title_element.attribute('value')
          end

          def click_my_order_link
            my_order_link_element.click
          end

          def start_order(order_name,order_type,project_name)
            click_start_order(order_name,order_type)
            sleep 2
            handles = @driver.window_handles
            current_handle = @driver.window_handle
            switch_alert_window(handles, current_handle)
            sleep 2
            order_title_name = order_title
            select_project project_name
            handler_elements = select_handler_elements
            multiple_select_handler(handler_elements)
            find_and_input_opeion_context
            submit_button.click            
            alert_ok
            sleep 5
            switch_window current_handle
            order_title_name
          end

          def notice_success
            @driver.find_element(:class => 'noticeSuccess')
          end

          def my_order_link_element
            @driver.find_element(:css => 'div.noticeSuccess a')
          end

          def order_title_element
            @driver.find_element(:id => 'requestName')
          end

          def select_project_element
            @driver.find_element(:id => 'projectId_input')
          end

          def form_write_elements
            @driver.find_element(:class => 'cusTable').find_elements(:tag_name => 'textarea')
          end

          def table_order_name(row)
            table_a[row][0].find_element(:tag_name => 'div')
          end

          def table_order_type(row)
            table_a[row][3].find_element(:tag_name => 'div')
          end

          def table_start_order_button(row)
            table_a[row][4].find_element(:tag_name => 'img')
          end

          def submit_button
            submit = @wkb_profiles['my_meeting']['submit_button']
            # @driver.find_element(:xpath =>"//input[@value='"+"#{submit}"+"']")
            @driver[:css => "form[name='cusRequestForm' input[value='#{submit}']]"]
          end

          def handler_table_element
            @driver.find_element(:id =>'auditorChonseTable')
          end

        end #CreateOrderPage
      end # WorkOrde
    end #Page
  end # Wkb
end #WebDriver