require_relative '../../load_helper'

module WebTest
  module Prom
    module DataStatistics

      describe 'process use situation pag' do
        before :all do
          @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
          @data_prom = Helper::ReadProfiles.data :prom
          @epg_login_name = @data_prom['epg_login_name']
          @epg_password = @data_prom['password']
          @driver = Support::Login.login(:name=>@epg_login_name, :pwd=>@epg_password)
          @page_container = WebDriver.create_page_container :prom, @driver
          @process_use_situation = @page_container.process_use_page
          @process_use_situation.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'evaluation statistics tab click success' do
        #given
          evaluation_statistics_tab_text = @prom_profiles['process_data_statistics']['process_evaluation_statistics_tab_text']
          #when
          actual_text = @process_use_situation.evaluation_statistics_tab_click
          @process_use_situation.extend_all_click
          #then
          actual_text.should == evaluation_statistics_tab_text
        end

        it 'assess tab click success ?' do
        #given
          assess_tab_text = @prom_profiles['process_data_statistics']['process_assess_tab_text']
          #when
          sleep 2
          actual_text = @process_use_situation.assess_tab_click
          @process_use_situation.chang_graph_big_or_small_button_click
          #then
          actual_text.should == assess_tab_text
        end

      end #describe
    end#DataStatistics
  end#Prom
end#WebTest