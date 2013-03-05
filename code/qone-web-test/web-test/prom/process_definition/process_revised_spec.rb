require_relative '../../load_helper'

module WebTest
  module Prom
    module ProcessDefinition

      describe 'process revised information page' do

        before :all do
          @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
          @data_prom = Helper::ReadProfiles.data :prom
          @epg_login_name = @data_prom['epg_login_name']
          @epg_password = @data_prom['password']
          @driver = Support::Login.login(:name=>@epg_login_name, :pwd=>@epg_password)
          @page_container = WebDriver.create_page_container :prom, @driver
          @process_revised_page = @page_container.process_revised_page
          @process_revised_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu click success?' do
        #given
          process_revised_top_title = @prom_profiles['process_definition']['process_revised_information_top_title']
          #when
          actual_top_title = @process_revised_page.top_title
          #then
          actual_top_title.should == process_revised_top_title
        end

        it 'add success ?' do
        #given
          revised_content = @data_prom['process_revised']['content_for_add']
          @process_revised_page.add_revised_information revised_content
          #when
          flag = @process_revised_page.find_revised_content? revised_content
          #then
          flag.should == true
        end

        it 'modify success ?' do
        #given
          content_for_modify = @data_prom['process_revised']['content_for_modify']
          @process_revised_page.modify_revised_information content_for_modify
          #when
          flag = @process_revised_page.find_revised_content? content_for_modify
          #then
          flag.should == true
        end

        it 'delete success ?' do
        #given
          content_for_modify = @data_prom['process_revised']['content_for_modify']
          @process_revised_page.delete_revised_information
          sleep 7
          #when
          flag = @process_revised_page.find_revised_content? content_for_modify         
          #then
          flag.should == false
        end

      end
    end #ProcessDefinition
  end #Prom
end #WebTest