require_relative '../../load_helper'

module WebTest
  module Prom
    module FormCustom

      describe 'forms template pag' do
        before :all do
          @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
          @data_prom = Helper::ReadProfiles.data :prom
          @epg_login_name = @data_prom['epg_login_name']
          @epg_password = @data_prom['password']
          @driver = Support::Login.login(:name=>@epg_login_name, :pwd=>@epg_password)
          @page_container = WebDriver.create_page_container :prom, @driver
          @forms_template = @page_container.forms_template_page
          @forms_template.to_this_page
        end

        after :all do
          @page_container.close
        end

        # it 'menu click success ?' do
          # #given
          # forms_template_top_title = @prom_profiles['form_process_custom']['forms_template_top_title']
          # #when
          # actual_top_title = @forms_template.top_title
          # #then
          # actual_top_title.should == forms_template_top_title
        # end
        
      end #describe
    end#FormCustom
  end#Prom
end#WebTest