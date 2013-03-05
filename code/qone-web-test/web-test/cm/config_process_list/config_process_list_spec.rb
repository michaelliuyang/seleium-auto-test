require_relative '../../load_helper'
module WebTest
  module Cm
    module ConfigProcessList
        describe 'config item browse page' do
        before :all do
          @cm_profiles = Helper::ReadProfiles.apps_res_zh :cm
          @cm_data = Helper::ReadProfiles.data :cm
          @pcm_login_name = @cm_data['login']['pcm_login_name']
          @login_password = @cm_data['login']['login_password']
          @driver = Support::Login.login(:name => @pcm_login_name, :pwd => @login_password)
          @page_container = WebDriver.create_page_container :cm, @driver
          @config_process_list_page = @page_container.config_process_list_page
          @config_process_list_page.to_this_page
        end

        after :all do
          @page_container.close
        end
        
        it 'config item browse menu click success?' do
          #given
          config_process_list_title = @cm_profiles['config_process_list']['config_process_list_title']
          #when
          actual = @config_process_list_page.top_title
          #then
          actual.should == config_process_list_title
        end
        
        it 'processing click success?'do
          #given
          processing = @cm_profiles['config_process_list']['processing']
          #when
          actual = @config_process_list_page.processing_page
          #then
          actual.should == processing
        end
        
        it 'processed click success?'do
          #given
          processed = @cm_profiles['config_process_list']['processed']
          #when
          actual = @config_process_list_page.processed_page
          #then
          actual.should == processed
        end

        # it 'click  check the application form  button success?' do
          # #given
          # item_identification=@cm_data['config_process_list']['check_the_application_form']
          # #exception_title = @cm_profiles['config_item_browse']['controlled_library_storage_application']
          # #when
          # #actual_title = @config_process_list_page.check_the_application_form item_identification
          # @config_process_list_page.check_the_application_form item_identification
          # #then
          # #actual_title.should == exception_title
        # end
       end
     end # ConfigProcessList
  end # Cm
end #WebTest

