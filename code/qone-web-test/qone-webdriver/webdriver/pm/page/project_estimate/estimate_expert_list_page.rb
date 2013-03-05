require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component'
require 'webdriver/support/switch_action'
require 'selenium-webdriver'

module WebDriver
  module Pm
    module Page
      module ProjectEstimate
        
          class EstimateExpertListPage < Common::BasePage
            
              include Support::MenuAction
              include Support::Component
              include Support::SwitchAction
              
               def to_this_page
                 @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
                 project_management = @pm_profiles['project_management']
                 project_estimate = @pm_profiles['project_estimate']['project_estimate']
                 estimate_expert_list = @pm_profiles['project_estimate']['estimate_expert_list']
                 menu_click project_management
                 show_menu_by_js "pm_es"
                 menu_click estimate_expert_list
                 #menu_click_for_hide project_estimate,estimate_expert_list
               end
               def top_title
                 @driver[:css=>'#content h2'].text
               end

               def new_add_estimate_expert(professor_name,position,field,company,email)
                   new_estimate_expert_button.click
                   first_handle =@driver.window_handle
                   handles = @driver.window_handles
                   switch_alert_window handles, first_handle
                   add_professor_name.send_keys(professor_name)
                   add_position.send_keys(position)
                   add_field.send_keys(field)
                   add_company.send_keys(company)
                   add_email.send_keys(email)
                   title = top_title
                   submit_button.click
                   switch_window first_handle
                   title
               end
               def from_organization_import
                   from_organization_button.click
                   first_handle =@driver.window_handle
                   handles = @driver.window_handles
                   switch_alert_window handles,first_handle
                   select_sa_expect.click
                   determine_button.click
                   sleep 2
                   switch_window first_handle
              end
              def disable_expert_button_test(professor_name)
                   table = table expert_table
                   row = find_target_row table,professor_name,2
                   puts row
                   if row
                       select_one(table,row).click
                       disable_expert_button.click
                       sleep 2
                       alert_ok
                   else
                      puts "can not find expert name row"
                   end
              end
              def enable_expert_button_test(professor_name)
                   select_status_checkbox.click
                   select_button.click
                   sleep 2
                   table = table expert_table
                   row = find_target_row table,professor_name,2
                   puts row
                   if row
                       select_one(table,row).click
                       enable_expert_button.click
                       sleep 2
                       alert_ok
                   else
                      puts "can not find expert name row"
                   end
              end
              
              def look_expert_information_test(professor_name)
                   table = table expert_table
                   row = find_target_row(table,professor_name,2)
                   if row
                    look_button(table,row).click
                    current_handle = @driver.window_handle
                    handles = @driver.window_handles
                    switch_alert_window(handles, current_handle)
                    look_expert_title = top_title
                    sleep 3
                    close_button.click
                    switch_window current_handle
                   else
                    puts "can not find expert name row"
                   end
                    look_expert_title
              end
              def modify_expert_information(professor_name,professor_name_for_modify)
                   table = table expert_table
                   row = find_target_row table,professor_name,2
                   puts row
                   if row
                    modify_button(table,row).click
                    current_handle = @driver.window_handle
                    handles = @driver.window_handles
                    switch_alert_window(handles, current_handle)
                    add_professor_name.clear
                    add_professor_name.send_keys(professor_name_for_modify)
                    sleep 2
                    submit_button.click
                    switch_window current_handle
                   else
                    puts "can not find expert name row"
                   end 
              end
              def find_expert_by_name name
                  table = table expert_table
                  find_target_row table,name,2 
              end

              private
            
              def expert_table
                  @driver.find_element(:id=>'dataListTable_NFSDataList')
              end
            
              def new_estimate_expert_button
                  new_estimate_expert_name = @pm_profiles['project_estimate']['new_estimate_expert']
                  @driver[:link =>new_estimate_expert_name]
              end
            
              def from_organization_button
                  from_organization_introduction= @pm_profiles['project_estimate']['from_organization_introduction']
                  @driver[:link =>from_organization_introduction]
              end
              
              def determine_button
                  determine_name = @pm_profiles['project_estimate']['determine']
                  @driver[:css => "input[value = '#{determine_name}']"]
              end
            
              def submit_button
                  submit_name = @pm_profiles['project_estimate']['submit']
                  @driver[:xpath =>"//input[@value = '#{submit_name}']"]
              end
            
              def close_button
                  close_name = @pm_profiles['project_estimate']['close']
                  @driver[:xpath =>"//input[@value = '#{close_name}']"]
              end
            
              def select_all
                  @driver.find_element(:id=>'professorIds_checkColumn')
              end
            
              def select_one table,row
                  table[row].find_element(:id=>'professorIds')
              end
            
              def select_status_checkbox
                  @driver.find_element(:id=>'statusCheck')
              end
            
              def select_button
                  @driver.find_element(:class=>'ie6-button')
              end
              
              def select_sa_expect
                  @driver.find_element(:id => 'NFS_tree_node_0_cb')
              end
            
              def disable_expert_button
                  disable_expert_name = @pm_profiles['project_estimate']['disable_expert']
                  @driver[:css =>"input[ value = '#{disable_expert_name}']"]
              end
            
              def enable_expert_button
                  enable_expert_name = @pm_profiles['project_estimate']['enable_expert']
                  @driver[:css =>"input[ value = '#{enable_expert_name}']"]
              end
            
              def modify_button table,row
                  modify_name = @pm_profiles['project_estimate']['modify']
                  table[row].find_element(:css =>"img[title = '#{modify_name}']")
              end
            
              def look_button table,row
                  look_name = @pm_profiles['project_estimate']['look']
                  table[row].find_element(:css =>"img[title = '#{look_name}']")
              end
            
              def add_professor_name
                  @driver.find_element(:name=>'professorName')
              end
            
              def add_position
                  @driver.find_element(:name=>'position')
              end
            
              def add_field
                  @driver.find_element(:name=>'field')
              end
            
              def add_company
                  @driver.find_element(:name=>'company')
              end
            
              def add_email
                  @driver.find_element(:name=>'email')
              end
              
              def find_target_row table,expect_name,col
                  num = table.row_count
                  row = 0
                  (1..num-2).each do |r|
                    if table[r][col].text == expect_name
                        row = r
                    end
                   end
                   row
              end
            

          end #EstimateExpertListPage
      end #ProjectEstimate
    end #  Page
  end # Pm
end  # WebDriver