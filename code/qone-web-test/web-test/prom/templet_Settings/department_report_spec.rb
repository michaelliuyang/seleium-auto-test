require_relative '../../load_helper'

module WebTest
  module Prom
    module TempletSettings

      describe 'department report pag' do
        before :all do
          @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
          @data_prom = Helper::ReadProfiles.data :prom
          @epg_login_name = @data_prom['epg_login_name']
          @epg_password = @data_prom['password']
          @driver = Support::Login.login(:name=>@epg_login_name, :pwd=>@epg_password)
          @page_container = WebDriver.create_page_container :prom, @driver
          @department_report_menu = @page_container.department_report_page
          @department_report_menu.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu click success ?' do
          #given
          expect_top_title = @prom_profiles['templet_Settings']['department_report_template']
          #when
          actual_top_title = @department_report_menu.top_title
          #then
          actual_top_title.should == expect_top_title
        end

        it 'new department report success?' do
          #given
          name = @data_prom['department_report']['name_for_add']
          description = @data_prom['department_report']['template_describe']
          form_template = @data_prom['department_report']['form_template']
          @department_report_menu.new_department_report(name,description,form_template)
          #when
          sleep 3
          flag = @department_report_menu.find_template_name_exist? name
          #then
          flag.should == true
        end
        
        it 'modify department report success?' do
          #given
          name = @data_prom['department_report']['name_for_modify']
          @department_report_menu.modify_department_report name
          #when
          flag = @department_report_menu.find_template_name_exist? name
          #then
          flag.should == true
        end
        
        it 'view department report success?' do
          #given
          expect_top_title = @prom_profiles['templet_Settings']['department_report_template']
          #when
          actual_top_title = @department_report_menu.view_department_report_title
          #then
          actual_top_title.should == actual_top_title
        end
        #error
        it 'delete department report success?' do
          #given
          name = @data_prom['department_report']['name_for_delete']
          @department_report_menu.delete_department_report
          #when
          flag = @department_report_menu.find_template_name_exist? name
          #then
          flag.should == false
        end
        
        it 'click use times link ?' do
          #given
          expect_top_title = @prom_profiles['templet_Settings']['use_times_top_title_department']
          #when
          actual_top_title = @department_report_menu.use_times_link_top_title[0..9]
          #then
          actual_top_title.should == expect_top_title
        end

      end #describe
    end #TempletSettings
  end #Prom
end #WebTest