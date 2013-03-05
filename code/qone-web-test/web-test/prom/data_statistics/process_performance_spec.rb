require_relative '../../load_helper'

module WebTest
  module Prom
    module DataStatistics

      describe 'process performance pag' do
        before :all do
          @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
          @data_prom = Helper::ReadProfiles.data :prom
          @epg_login_name = @data_prom['epg_login_name']
          @epg_password = @data_prom['password']
          @driver = Support::Login.login(:name=>@epg_login_name, :pwd=>@epg_password)
          @page_container = WebDriver.create_page_container :prom, @driver
          @process_performance = @page_container.process_performance_page
          @process_performance.to_this_page
        end

        after :all do
          @page_container.close
        end

        # it 'menu click success ?' do
        # #given
          # process_performance_top_title = @prom_profiles['process_data_statistics']['process_performance_top_title']
          # #when
          # actual_top_title = @process_performance.top_title
          # #then
          # actual_top_title.should == process_performance_top_title
        # end

        # it 'add process performance success ?' do
        # #given
          # name = @data_prom['process_performance']['name_for_add']
          # create_date = @data_prom['process_performance']['creat_time']
          # start_date = @data_prom['process_performance']['expect_time_start']
          # end_date = @data_prom['process_performance']['expect_time_end']
          # @process_performance.add_process_performance(name,create_date,start_date,end_date)
          # #when
          # flag = @process_performance.find_baseline_report_name? name
          # #then
          # flag.should == true
        # end
        
        # it 'modify process performance success ?' do
          # #given
          # name = @data_prom['process_performance']['name_for_modify']
          # @process_performance.modify_process_performance name
          # #when
          # flag = @process_performance.find_baseline_report_name? name
          # #then
          # flag.should == true
        # end
        
        # it 'delete process performance success ?' do
          # #given
          # name = @data_prom['process_performance']['name_for_modify']
          # @process_performance.delete_process_performance
          # #when
          # flag = @process_performance.find_baseline_report_name? name
          # #then
          # flag.should == false
        # end
        
        it 'publish process performance success ?' do
          @process_performance.publish_process_report
        end

      end #describe
    end #DataStatistics
  end #Prom
end #WebTest