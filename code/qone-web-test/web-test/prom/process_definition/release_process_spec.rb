require_relative '../../load_helper'

module WebTest
  module Prom
    module ProcessDefinition

      describe 'release process' do

        before :all do
          @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
          @data_prom = Helper::ReadProfiles.data :prom
          @epg_login_name = @data_prom['epg_login_name']
          @epg_password = @data_prom['password']
          @driver = Support::Login.login(:name=>@epg_login_name, :pwd=>@epg_password)
          @page_container = WebDriver.create_page_container :prom, @driver
          @release_process_page = @page_container.release_process_page
          @release_process_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu click success ?' do
          #given
          release_process_top_title = @prom_profiles['process_definition']['release_process_top_title']
          #when
          actual_release_process = @release_process_page.top_title
          #then
          actual_release_process.should == release_process_top_title
        end

        it 'add success ?' do
          #given
          publish_content = @data_prom['process_release']['content']
          @release_process_page.add_release publish_content
          #when
          flag = @release_process_page.find_release_content? publish_content
          #then 
          flag == 1
        end
        
        it 'delete success ?' do
          #given
          release_content = @data_prom['process_release']['content']
          @release_process_page.delete_release
          sleep 7
          #when
          flag = @release_process_page.find_release_content? release_content
          #then
          flag.should == 0      
        end
        
      end
    end
  end
end