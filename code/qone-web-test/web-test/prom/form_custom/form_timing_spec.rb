require_relative '../../load_helper'

module WebTest
  module Prom
    module FormCustom

      describe 'form timing pag' do

        before :all do
          @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
          @data_prom = Helper::ReadProfiles.data :prom
          @epg_login_name = @data_prom['epg_login_name']
          @epg_password = @data_prom['password']
          @driver = Support::Login.login(:name=>@epg_login_name, :pwd=>@epg_password)
          @page_container = WebDriver.create_page_container :prom, @driver
          @form_timing = @page_container.form_timing_page
          @form_timing.to_this_page
        end

        after :all do
          @page_container.close
        end

        # it 'menu click success ?' do
        # #given
          # form_timing_task_top_title = @prom_profiles['form_process_custom']['form_timing_task_top_title']
          # #when
          # actual_top_title = @form_timing.top_title
          # #then
          # actual_top_title.should == form_timing_task_top_title
        # end

        # it ' add form timing success ?' do
        # #given
          # task_title = @data_prom['form_timing']['title_for_add']
          # task_name = @data_prom['form_timing']['name']
          # apart_days = @data_prom['form_timing']['apart_days']
          # #when
          # @form_timing.new_form_timing_task(task_title,task_name,apart_days)
        # #then
        # end
        
        # it 'modify form timing success ?' do
          # #given
          # task_title = @data_prom['form_timing']['title_for_modify']
          # @form_timing.modify_form_timing_task task_title
          # #when
          # flag = @form_timing.find_title_exist? task_title
          # #then
          # flag.should == true
        # end
        
        # it 'view form timing success ?' do
          # #given
          # expect_top_title = @prom_profiles['form_process_custom']['form_timing_task']
          # #when
          # actual_top_title = @form_timing.view_form_timing_task_title
          # #then
          # actual_top_title.should == expect_top_title
        # end
        
        #error
        # it 'stop form timing success ?' do
          # @form_timing.stop_form_timing_task
        # end
        
        it 'delete form timing success ?' do
          @form_timing.delete_form_timing
        end

      end#describe
    end#FormCustom
  end#Prom
end#WebTest