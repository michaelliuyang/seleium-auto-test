require_relative '../../load_helper'

module WebTest
  module Prom
    module TempletSettings

      describe 'progress report template pag' do
        before :all do
          @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
          @data_prom = Helper::ReadProfiles.data :prom
          @epg_login_name = @data_prom['epg_login_name']
          @epg_password = @data_prom['password']
          @driver = Support::Login.login(:name=>@epg_login_name, :pwd=>@epg_password)
          @page_container = WebDriver.create_page_container :prom, @driver
          @progress_report_template = @page_container.progress_report_page
          @progress_report_template.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu click success ?' do
          #given
          progress_report_template_top_title = @prom_profiles['templet_Settings']['progress_report_template']
          #when
          actual_top_title = @progress_report_template.top_title
          #then
          actual_top_title.should == progress_report_template_top_title
        end

        it 'new progress report success ?' do
          #given
          name = @data_prom['progress_report']['name_for_add']
          describe = @data_prom['progress_report']['template_describe']
          template = @data_prom['progress_report']['form_template']
          @progress_report_template.new_progress_report(name,describe,template)
          #when          
          flag = @progress_report_template.find_template_name_exist? name
          #then
          flag.should == true
        end
        
        it 'modify progress report success ?' do
          #given
          name = @data_prom['progress_report']['name_for_modify']
          @progress_report_template.modify_progress_report name
          #when
          flag = @progress_report_template.find_template_name_exist? name
          #then
          flag.should == true
        end
        
        it 'view progress report success ?' do
          #given
          expect_top_title = @prom_profiles['templet_Settings']['modify_page_top_title']
          #when
          actual_top_title = @progress_report_template.view_progress_report_title
          #then
          actual_top_title.should == expect_top_title
        end
        #error
        it 'delete progress report success ?' do
          #given
          name = @data_prom['progress_report']['name_for_modify']
          @progress_report_template.delete_progress_report
          #when
          # flag = @progress_report_template.find_template_name_exist? name
          #then
          # flag.should == false
        end
        
        it 'click use times link ?' do
          #given
          expect_top_title = @prom_profiles['templet_Settings']['use_times_top_title']
          #when
          actual_top_title = @progress_report_template.use_times_link_top_title[0..9]
          #then
          actual_top_title.should == expect_top_title
        end

      end #describe
    end#FormCustom
  end#Prom
end#WebTest