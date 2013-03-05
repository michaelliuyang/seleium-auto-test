require_relative '../../load_helper'

module WebTest
  module Prom
    module FormCustom

      describe 'form custom pag' do
        before :all do
          @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
          @data_prom = Helper::ReadProfiles.data :prom
          @epg_login_name = @data_prom['epg_login_name']
          @epg_password = @data_prom['password']
          @driver = Support::Login.login(:name=>@epg_login_name, :pwd=>@epg_password)
          @page_container = WebDriver.create_page_container :prom, @driver
          @form_custom = @page_container.form_custom_page
          @form_custom.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu click success ?' do
        #given
          expect_top_title = @prom_profiles['form_process_custom']['form_custom']
          #when
          actual_top_title = @form_custom.top_title
          #then
          actual_top_title.should == expect_top_title
        end

        # describe 'new form' do
        #
        # it 'new form success ?' do
        # #given
        # form_name = @data_prom['form_custom']['name_for_add']
        # # @form_custom.new_form form_name
        # #when
        # flag = @form_custom.find_form_name_exist? form_name
        # #then
        # flag.should == true
        # end
        #
        # it 'modify form success ?' do
        # #given
        # form_name = @data_prom['form_custom']['name_for_modify']
        # @form_custom.modify_form form_name
        # #when
        # flag = @form_custom.find_form_name_exist? form_name
        # #then
        # flag.should == true
        # end
        #
        # it 'delete form success ?' do
        # #given
        # form_name = @data_prom['form_custom']['name_for_delete']
        # @form_custom.delete_form
        # #when
        # flag = @form_custom.find_form_name_exist? form_name
        # #then
        # flag.should == false
        # end
        #
        # it 'viewProcess form success ?' do
        # #given
        # expect_text = @prom_profiles['form_process_custom']['viewProcess_text']
        # #when
        # actual_text = @form_custom.viewProcess_form_text
        # #then
        # actual_text.should == expect_text
        # end
        # #error,ope pag is error
        # it 'view form success ?' do
        # #given
        # expect_top_title = @prom_profiles['form_process_custom']['view_form_title']
        # #when
        # actual_top_title = @form_custom.view_form_title
        # #then
        # actual_top_title.should == expect_top_title
        # end
        #
        # end

        describe 'maintenance form type' do

          # it 'button click success ?' do
          # #given
            # type_name = @data_prom['form_custom']['name_for_add']
            # #when
            # @form_custom.add_form_type type_name
            # #then
#             
          # end
          
          it 'delete form type' do
            @form_custom.delete_form_type
          end

        end

      end #describe

    end#FormCustom
  end#Prom
end#WebTest