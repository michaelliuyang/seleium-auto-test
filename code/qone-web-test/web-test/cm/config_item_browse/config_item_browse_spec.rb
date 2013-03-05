require_relative '../../load_helper'
module WebTest
  module Cm
    module ConfigItemBrowse

        describe 'config item browse page' do
        before :all do
          @cm_profiles = Helper::ReadProfiles.apps_res_zh :cm
          @cm_data = Helper::ReadProfiles.data :cm
          @pcm_login_name = @cm_data['login']['pcm_login_name']
          @login_password = @cm_data['login']['login_password']
          @driver = Support::Login.login(:name => @pcm_login_name, :pwd => @login_password)
          @page_container = WebDriver.create_page_container :cm, @driver
          @config_item_browse_page = @page_container.config_item_browse_page
          @config_item_browse_page.to_this_page
        end

        after :all do
          @page_container.close
        end
        
        it 'config item browse menu click success?' do
          #given
          config_item_browse_view=@cm_profiles['config_item_browse']['config_item_browse_view']
          #when
          actual = @config_item_browse_page.top_title
          #then
          actual.should == config_item_browse_view
        end
        
        
        
        it 'software control library tab click success?' do
          #given
          software_control_library=@cm_profiles['config_item_browse']['software_control_library']
          #when
          actual = @config_item_browse_page.software_control_library_tab_check
          #then
          actual.should == software_control_library
        end
        
        it 'table view change view view click success?' do
          #given
          table_view=@cm_profiles['config_item_browse']['table_view']
          #when
          @config_item_browse_page.click_change_view table_view
          #then
        end
        it 'click  configuration item name super link  success?' do
          #given
          item_identification=@cm_data['config_item_browse']['configuration_item_identification']
          exception_title = @cm_profiles['config_item_browse']['control_library_config_items_of_basic_information']
          #when
          actual_title = @config_item_browse_page.configuration_item_name item_identification
          #then
          actual_title.should == exception_title
        end
        
        it 'click  control library stroage application button success?' do
          #given
          item_identification=@cm_data['config_item_browse']['configuration_item_identification']
          exception_title = @cm_profiles['config_item_browse']['controlled_library_storage_application']
          #when
          actual_title = @config_item_browse_page.control_library_storage_application item_identification
          #then
          actual_title.should == exception_title
        end
        
        it 'click  change request button success?' do
          #given
          item_identification=@cm_data['config_item_browse']['change_request_item_identification']
          exception_title = @cm_profiles['config_item_browse']['change_request']
          #when
          actual_title = @config_item_browse_page.change_request_operate item_identification
          #then
          actual_title.should == exception_title
        end
        
        it 'click  control library database application button success?' do
          #given
          item_identification=@cm_data['config_item_browse']['change_request_item_identification']
          exception_title = @cm_profiles['config_item_browse']['controlled_library_database_application']
          #when
          actual_title = @config_item_browse_page.control_library_database_application item_identification
          #then
          actual_title.should == exception_title
        end
        
        it 'click  change report button success?' do
          #given
          item_identification=@cm_data['config_item_browse']['change_report_item_identification']
          exception_title = @cm_profiles['config_item_browse']['change_report']
          #when
          actual_title = @config_item_browse_page.change_report_operate item_identification
          #then
          actual_title.should == exception_title
        end
        
        it 'software product library tab click success' do
          #given
          software_product_library=@cm_profiles['config_item_browse']['software_product_library']
          #when
          actual = @config_item_browse_page.software_product_library_tab_check
          #then
          actual.should == software_product_library
        end
        
        it 'click  product item name super link  success?' do
          #given
          item_identification=@cm_data['config_item_browse']['product_item_identification']
          exception_title = @cm_profiles['config_item_browse']['product_library_config_items_of_basic_information']
          #when
          actual_title = @config_item_browse_page.product_item_name item_identification
          #then
          actual_title.should == exception_title
        end
        
        it 'click  product library stroage application button success?' do
          #given
          item_identification=@cm_data['config_item_browse']['product_item_identification']
          exception_title = @cm_profiles['config_item_browse']['product_library_storage_application']
          #when
          actual_title = @config_item_browse_page.product_library_storage_application item_identification
          #then
          actual_title.should == exception_title
        end
        
        it 'click  product library database application button success?' do
          #given
          item_identification=@cm_data['config_item_browse']['product_item_identification']
          exception_title = @cm_profiles['config_item_browse']['product_library_database_application']
          #when
          actual_title = @config_item_browse_page.product_library_database_application item_identification
          #then
          actual_title.should == exception_title
        end
        
        it 'click  product database for publication button success?' do
          #given
          item_identification=@cm_data['config_item_browse']['product_item_identification']
          exception_title = @cm_profiles['config_item_browse']['product_database_for_publication']
          #when
          actual_title = @config_item_browse_page.product_database_for_publication item_identification
          #then
          actual_title.should == exception_title
        end
        it 'tree view change table view click success?' do
          #given
          tree_view=@cm_profiles['config_item_browse']['tree_view']
          #when
          @config_item_browse_page.click_change_view tree_view
          #then
        end
       end
     end # ConfigItemBrowse
  end # Cm
end #WebTest
