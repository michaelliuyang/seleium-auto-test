require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component'
require 'webdriver/support/switch_action'
require 'selenium-webdriver'

module WebDriver
  module Pm
    module Page
      module ProjectEstimate
          class EstimateBasicDataPage < Common::BasePage
            
             include Support::MenuAction
             include Support::Component
             include Support::SwitchAction
             
              def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            project_management = @pm_profiles['project_management']
            project_estimate = @pm_profiles['project_estimate']['project_estimate']
            estimate_basic_data = @pm_profiles['project_estimate']['estimate_basic_data']
            menu_click project_management
            sleep 3
            show_menu_by_js "pm_es"
            menu_click estimate_basic_data
            #menu_click_for_hide project_estimate,estimate_basic_data
          end

          def top_title
            @driver[:css=>'#content h2'].text
          end

          def estimate_percent_tab_test
            estimate_percent_tab.click
            estimate_percent_tab.text
          end

          def standard_average_tab_test
            standard_average_tab.click
            standard_average_tab.text
          end

          def standard_day_costs_tab_test
            standard_day_costs_tab.click
            standard_day_costs_tab.text
          end

          def coefficient_difficult_tab_test
            coefficient_difficult_tab.click
            coefficient_difficult_tab.text
          end

          def modify_estimate_percent_test estimate_percent_for_modify
            table = table estimate_basic_data_table
            row_count = table.row_count
            for row in (1..row_count-1)
              estimate_percent_element = estimate_percent_text(row,2)
              estimate_percent_element.clear
              estimate_percent_element.send_keys(estimate_percent_for_modify)
            end
            #reset_button.click
            submit_button.click
            estimate_percent_tab.text
          end
          
          def add_standard_average_test(type_for_add,value_for_add)
            standard_average_tab.click
            table_average = table estimate_basic_data_table
            new_add_button.click
            row_count = table_average.row_count
            per_capita_productivity_type(row_count-1, 2).send_keys(type_for_add)
            per_capita_productivity_value(row_count-1, 3).send_keys(value_for_add)
            submit_button.click
            standard_average_tab.text
          end

          def delete_standard_average_test(delete_colmon_index)
            standard_average_tab.click
            data_list = qone_data_list(estimate_basic_data_table,"class='hidden_column '",:all)
            data_list.operate(delete_colmon_index,1,:delete,4)
            sleep 2
            alert_ok
          end

          def add_standard_one_day_costs_test(value_for_add)
            standard_day_costs_tab.click
            table = table estimate_basic_data_table
            new_add_button.click
            row_count = table.row_count
            standard_one_day_costs_name_test(row_count-1, 2).send_keys(value_for_add)
            submit_button.click
            standard_day_costs_tab.text
          end

          def add_coefficient_difficult_test(difficulty_name_for_add,difficulty_limit_for_add)
            coefficient_difficult_tab.click
            table = table estimate_basic_data_table
            new_add_button.click
            row_count = table.row_count
            add_difficulty_name_test(row_count-1, 2).send_keys(difficulty_name_for_add)
            add_difficulty_value_test(row_count-1, 3).send_keys(difficulty_limit_for_add)
            submit_button.click
            coefficient_difficult_tab.text
          end

          def all_delete_test
            all_delete.click
            delete_button.click
            alert_ok
          end

          def find_type_for_name name
            table_average = table estimate_basic_data_table
            find_target_row table_average,name,2
          end
          def find_type_for_index index_name
            table_average = table estimate_basic_data_table
            find_target_row table_average,index_name,1
          end




          private
          def estimate_percent_tab
            @driver.find_element(:class => 'dh_menu').find_elements(:tag_name => 'a')[0]
          end

          def standard_average_tab
            @driver.find_element(:class => 'dh_menu').find_elements(:tag_name => 'a')[1]
          end

          def standard_day_costs_tab
            @driver.find_element(:class => 'dh_menu').find_elements(:tag_name => 'a')[2]
          end

          def coefficient_difficult_tab
            @driver.find_element(:class => 'dh_menu').find_elements(:tag_name => 'a')[3]
          end

          def new_add_button
            new_add_name = @pm_profiles['project_estimate']['new_add']
            @driver.find_element(:css=> "input[value = '#{new_add_name}']")
          end

          def delete_button
            delete_name = @pm_profiles['project_estimate']['delete']
            @driver.find_element(:css => "input[value = '#{delete_name}']")
          end

          def delete_img (row)
            delete_name = @pm_profiles['project_estimate']['delete']
            table = table estimate_basic_data_table
            table[row].find_element(:css => "img[class='datalist-menu']")
          end

          def submit_button
            submit_name = @pm_profiles['project_estimate']['submit']
           # @driver[:xpath =>"//input[@value = '#{submit_name}']"]
            @driver.find_element(:css => "input[value = '#{submit_name}']")
          end

          def reset_button
            reset_name = @pm_profiles['project_estimate']['reset']
            #@driver[:xpath =>"//input[@value = '#{reset_name}']"]
            @driver.find_element(:css =>"input[value = '#{reset_name}']")
          end

          def estimate_basic_data_table
              @driver.find_element(:id => 'dataListTable_NFSDataList')
          end

          def estimate_percent_text(row,col)
            table = table estimate_basic_data_table
            table[row].find_element(:css => "input[name='percentValue']")
          end

          def per_capita_productivity_type(row,col)
            table = table estimate_basic_data_table
            table[row].find_element(:name=>'efficiencyType')
          end

          def per_capita_productivity_value(row,col)
            table = table estimate_basic_data_table
            table[row].find_element(:name=>'efficiencyValue')
          end

          def standard_one_day_costs_name_test(row,col)
            table = table estimate_basic_data_table
            table[row].find_element(:name=>'costValue')
          end

          def add_difficulty_name_test(row,col)
            table = table estimate_basic_data_table
            table[row].find_element(:name=>'difficultyName')
          end

          def add_difficulty_value_test(row,col)
            table = table estimate_basic_data_table
            table[row].find_element(:name=>'difficultyValue')
          end

          def all_delete
            @driver.find_element(:id=>'diff_id_checkColumn')
          end

          def find_target_row table,style_name,col
            num = table.row_count
            row = 0
            (1..num-2).each do |r|
              if table[r][col].text == style_name
              row =r
              end
            end
            row
          end

          def find_keyword_in_table table,key,col
            num = table.row_count
            result_flag = 0
            (1..num-2).each do |y|
              if table[y][col].text == key
              result_flag = 1
              end
            end
            result_flag
          end

          def find_position_name key
            table = table position_list_table
            find_keyword_in_table(table,key,1)
          end




            end #EstimateBasicDataPage
      end #ProjectEstimate
    end #  Page
  end # Pm
end  # WebDriver