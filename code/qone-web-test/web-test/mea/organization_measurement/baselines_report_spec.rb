require_relative '../../load_helper'

module WebTest
  module Mea
    module OrganizationMeasurement
      describe 'baselines report page' do
        before :all do
          @mea_profiles = Helper::ReadProfiles.apps_res_zh :mea
          @mea_data = Helper::ReadProfiles.data :mea
          @epg_login_name = @mea_data['epg_login_name']
          @epg_password = @mea_data['password']
          @driver = Support::Login.login(:name=>@epg_login_name, :pwd=>@epg_password)
          @page_container = WebDriver.create_page_container :mea, @driver
          @baselines_report_page = @page_container.baselines_report_page
          @baselines_report_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu click success ?' do
        #given
          baselines_report_top_title = @mea_profiles['organization_measure']['baselines_report_top_title']
          #when
          actual_top_title = @baselines_report_page.top_title
          #then
          actual_top_title.should == baselines_report_top_title
        end

        it 'add baselines report success?' do
        #given
          report_name = @mea_data['process_baselines_report']['report_name_for_add']
          create_date = @mea_data['process_baselines_report']['create_date']
          date_begin = @mea_data['process_baselines_report']['date_begin']
          date_end = @mea_data['process_baselines_report']['date_end']
          #when
          @baselines_report_page.add_process_baselines_report(report_name,create_date,date_begin,date_end)
          actual = @baselines_report_page.baselines_name_exist? report_name
          #then
          actual.should == true
        end

        it 'baselines report name link click success ?' do
        #given
          expect_top_title = @mea_profiles['organization_measure']['report_name_link_top_title']
          #when
          actual_top_title = @baselines_report_page.report_name_link_top_title
          #then
          actual_top_title.should == expect_top_title
        end

        it 'modify baselines report success?' do
        #given
          report_name = @mea_data['process_baselines_report']['report_name_for_modify']
          @baselines_report_page.modify_process_baselines_report report_name
          #when
          actual = @baselines_report_page.baselines_name_exist? report_name
          #then
          actual.should == true
        end

        it 'delete baselines report success?' do
        #given
          report_name = @mea_data['process_baselines_report']['report_name_for_delete']
          @baselines_report_page.delete_process_baselines_report
          #when
          actual = @baselines_report_page.baselines_name_exist? report_name
          #then
          actual.should ==false
        end

        describe ' index ' do
          it 'add index success ?' do
          #given
            index_name = @mea_data['add_index']['select_add_index_name']
            #when
            flag = @baselines_report_page.for_add_index_success_judge? index_name
            #then
            flag.should == true
          end
        end

      end#describe 'baselines report page'

    end#BaselinesReport
  end#Mea
end#WebTest