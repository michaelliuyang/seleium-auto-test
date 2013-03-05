require_relative '../../load_helper'

module WebTest
  module Prom
    module TempletSettings

      describe 'repository structure template pag' do
        before :all do
          @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
          @data_prom = Helper::ReadProfiles.data :prom
          @epg_login_name = @data_prom['epg_login_name']
          @epg_password = @data_prom['password']
          @driver = Support::Login.login(:name=>@epg_login_name, :pwd=>@epg_password)
          @page_container = WebDriver.create_page_container :prom, @driver
          @evaluation_table = @page_container.evaluation_table_page
          @evaluation_table.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu click success ?' do
        #given
          expect_top_title = @prom_profiles['process_evaluation_evidence_table']['evaluation_table_top_title']
          #when
          actual_top_title = @evaluation_table.top_title
          #then
          actual_top_title.should == expect_top_title
        end

        it 'new evaluation success ?' do
        #given
          name = @data_prom['evaluation_evidence_table']['name_for_add']
          level = @data_prom['evaluation_evidence_table']['evaluation_level']
          @evaluation_table.new_piids(name,level)
          #when
          flag = @evaluation_table.find_piids_name_exist? name
          #then
          flag.should == true
        end

        it 'modify evaluation success ?' do
        #given
          name = @data_prom['evaluation_evidence_table']['name_for_modify']
          @evaluation_table.modify_piids name
          #when
          flag = @evaluation_table.find_piids_name_exist? name
          #then
          flag.should == true
        end

        it 'view evaluation success ?' do
        #given
          expect_top_title = @prom_profiles['process_evaluation_evidence_table']['process_evaluation_evidence_table']
          #when
          actual_top_title = @evaluation_table.view_piids_title
          #then
          actual_top_title.should == expect_top_title
        end
        #error
        it 'delete evaluation success ?' do
        #given
          name = @data_prom['evaluation_evidence_table']['name_for_delete']
          @evaluation_table.delete_piids
          #when
          flag = @evaluation_table.find_piids_name_exist? name
          #then
          flag.should == false
        end

        it 'click piids name link success' do
        #given
          expect_top_title = @prom_profiles['process_evaluation_evidence_table']['process_evaluation_evidence_table']
          #when
          actual_top_title = @evaluation_table.piids_name_link_title
          #then
          actual_top_title.should == expect_top_title
        end

      end #describe
    end#FormCustom
  end#Prom
end#WebTest