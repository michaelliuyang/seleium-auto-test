require_relative '../../load_helper'

module WebTest
  module Prom
    module ProcessAssets

      describe 'project assets' do
        before :all do
          @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
          @data_prom = Helper::ReadProfiles.data :prom
          @epg_login_name = @data_prom['epg_login_name']
          @epg_password = @data_prom['password']
          @driver = Support::Login.login(:name=>@epg_login_name, :pwd=>@epg_password)
          @page_container = WebDriver.create_page_container :prom, @driver
          @project_assets = @page_container.project_assets_page
          @project_assets.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu click success' do
          #given
          project_assets_top_title = @prom_profiles['process_assets']['project_assets_top_title']
          #when
          actual_top_title = @project_assets.top_title
          #then
          actual_top_title.should == project_assets_top_title
        end

        it 'add button click success ? ' do
          #given
          add_assets_page_top_title = @prom_profiles['process_assets']['add_assets_button']
          #when
          actual_top_title = @project_assets.add_assets_top_title
          #then
          actual_top_title.should == add_assets_page_top_title
        end
        
        it 'modify success ?' do
          asset_number = @data_prom['project_assert']['num_for_modify']
          name = @data_prom['project_assert']['assert_name']
          @project_assets.modify_assets asset_number
          sleep 5
          flag = @project_assets.find_asset_number? asset_number
          flag.should == 1
        end
        
        it 'delete success ?' do
          @project_assets.delete_assets
        end

      end
    end
  end
end