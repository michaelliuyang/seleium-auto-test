require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require 'webdriver/support/component'
require 'webdriver/support/table_action'

module WebDriver
  module Prom
    module Page
      module ProcessAssets
        class ProjectAssetsPage < Common::BasePage
          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component
          include Support::TableAction

          def to_this_page
            @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
            @data_prom = Helper::ReadProfiles.data :prom
            process_manage = @prom_profiles['process_manage']
            project_assets = @prom_profiles['process_assets']['project_assets']
            menu_click process_manage
            show_menu_by_js("spa_pd")
            menu_click project_assets
          end

          def add_assets_top_title
            add_assets_button.click
            add_assets_page_top_title = top_title
            return_button.click
            add_assets_page_top_title
          end
          
          def modify_assets number
            modify_asset_button
            asset_number.clear
            asset_number.send_keys number
            submit_button.click
          end
          
          def delete_assets
            delete_asset_button_click
            alert_ok
          end
          
          def find_asset_number? number
            assets_table = table assets_list_table
            col = 0
            find_number_in_table assets_table,number,col
          end

          def top_title
            @driver[:css=> 'h2'].text.rstrip
          end

          private
          
          def find_number_in_table table,number,col
            num = table.row_count
            result_flag = 0
            (1..num-1).each do |y|
              if table[y][col].text == number
              result_flag = 1
              end
            end
            result_flag
          end
          
          def modify_asset_button 
            number = @data_prom['project_assert']['num_for_add']
            asset_table = table assets_list_table
            number_col = 0
            row = find_target_row asset_table,number,number_col
            if row
              modify_button(row).click
            else
              raise "can not find target row"
            end
          end
          
          def modify_button row
            asset_table = table assets_list_table
            asset_table[row].find_element(:xpath => "//img [@src = '/pm/skins/default/images//edit2.gif']")
          end
          
          def delete_asset_button_click
            number = @data_prom['project_assert']['num_for_modify']
            asset_table = table assets_list_table
            number_col = 0
            row = find_target_row asset_table,number,number_col
            if row
              delete_button(row).click
            else
              raise "can not find target row"
            end
          end
          
          def delete_button row
            asset_table = table assets_list_table
            asset_table[row].find_element(:xpath => "//img [@src = '/pm/skins/default/images//delete.gif']")
          end
          
          def asset_number
            @driver[:name => 'projectAssetNo']
          end
          
          def assets_list_table
            @driver[:css => 'table']
          end

          def add_assets_button
            @driver[:css => "div[id='content'] div span.button a"]
          end
          
          def submit_button
            @driver[:name => 'submit']
          end

          def return_button
            @driver[:name=> 'button']
          end

        end
      end#ProcessAssets
    end#Page
  end#Prom
end#WebDriver