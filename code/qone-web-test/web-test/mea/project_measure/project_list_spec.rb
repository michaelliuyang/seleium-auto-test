require_relative '../../load_helper'

module WebTest
  module Mea
    module ProjectMeasure
      describe 'project list page' do
         before :all do
          @mea_profiles = Helper::ReadProfiles.apps_res_zh :mea
          @data_mea = Helper::ReadProfiles.data :mea
          @epg_login_name = @data_mea['epg_login_name']
          @epg_password = @data_mea['password']
          @driver = Support::Login.login(:name=>@epg_login_name, :pwd=>@epg_password)
          @page_container = WebDriver.create_page_container :mea, @driver
          @project_list_page = @page_container.project_list_page
          @project_list_page.to_this_page
        end
        
        after :all do
          @page_container.close
        end
        
        # it 'menu click success ?' do
        
          # expect_top_title = @mea_profiles['project_measure']['project_list']
          # actual_top_title = @project_list_page.top_title
          # actual_top_title.should == expect_top_title
        # end
        
        #error return title value is 2
        it 'project name link click success ?' do
          #given
          expect_top_title = @mea_profiles['project_measure']['project_name_link_title']
          #when
          actual_top_title = @project_list_page.project_name_link_title
          #then
          actual_top_title.should == expect_top_title
        end
        
        describe 'project measure page' do
          it 'measure activity tab click success ? ' do
            expect_top_title = @mea_profiles['project_measure']['measure_activity_tab_title']
            actual_top_title = @project_list_page.measure_activity_tab_click
            actual_top_title.should == expect_top_title
          end
        end
        
      end
      
    end
  end
end