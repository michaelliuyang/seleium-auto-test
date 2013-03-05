require_relative '../../load_helper'

module WebTest
  module Prom
    module ProcessAssets

      describe 'process document page' do

        before :all do
          @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
          @data_prom = Helper::ReadProfiles.data :prom
          @epg_login_name = @data_prom['epg_login_name']
          @epg_password = @data_prom['password']
          @driver = Support::Login.login(:name=>@epg_login_name, :pwd=>@epg_password)
          @page_container = WebDriver.create_page_container :prom, @driver
          @process_document = @page_container.process_document_page
          @process_document.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu click success ?' do
          #given
          process_document_top_title = @prom_profiles['process_assets']['process_document_top_title']
          #when
          actual_top_title = @process_document.top_title
          #then
          actual_top_title.should == process_document_top_title
        end

        it 'upload documents button click success ?' do
          #given
          upload_document_top_title = @prom_profiles['process_assets']['upload_document_top_title']
          #when
          actual_top_title = @process_document.upload_documents_top_title
          #then
          actual_top_title.should == upload_document_top_title
        end
        
        it 'modify success ?' do
          #given
          document_number = @data_prom['process_document']['num_for_modify']
          @process_document.modify_document document_number
          #when
          flag = @process_document.find_document_number_exist? document_number
          #then
          flag.should == true
        end
        
        it 'delete success ?' do
          #given
          document_number = @data_prom['process_document']['num_for_modify']
          @process_document.delete_document
          sleep 5
          #when
          flag = @process_document.find_document_number_exist? document_number
          #then
          flag.should == false
        end        
        
      end#describe process document page
      
    end#ProcessAssets
  end#Prom
end#WebTest