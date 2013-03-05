require_relative '../../load_helper'

module WebTest
  module Prom
    module ProcessAssets

      describe 'project template' do
        before :all do
          @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
          @data_prom = Helper::ReadProfiles.data :prom
          @epg_login_name = @data_prom['epg_login_name']
          @epg_password = @data_prom['password']
          @driver = Support::Login.login(:name=>@epg_login_name, :pwd=>@epg_password)
          @page_container = WebDriver.create_page_container :prom, @driver
          @project_template_page = @page_container.project_template_page
          @project_template_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu click success ?' do
          #given
          expect_top_title = @prom_profiles['process_assets']['project_template']
          #when
          actual_top_title = @project_template_page.top_title
          #then
          actual_top_title.should == expect_top_title
        end
        
        it 'click template name link success ?' do
          #given
          template_name = @data_prom['project_template']['template_name']
          name_titlte = @prom_profiles['process_assets']['template_name_title']
          #when
          actual_title = @project_template_page.template_name_title(template_name)
          #then
          actual_title.should == name_titlte          
        end
        
        #can't use error
        it 'set into template success ?' do
          numbers = @data_prom['project_template']['template_num']
          @project_template_page.set_into_template numbers
        end

      end  # describe

    end # ProcessAssets
  end   # Prom
end    # WebTest