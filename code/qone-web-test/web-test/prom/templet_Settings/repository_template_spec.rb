require_relative '../../load_helper'

module WebTest
  module Prom
    module TempletSettings

      describe 'repository structure template pag' do
        before :all do
          @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
          @data_prom = Helper::ReadProfiles.data :prom
          @epg_login_name = @data_prom['epg_login_name']
          @epg_password = @data_prom['password']
          @driver = Support::Login.login(:name=>@epg_login_name, :pwd=>@epg_password)
          @page_container = WebDriver.create_page_container :prom, @driver
          @repository_structure = @page_container.repository_template_page
          @repository_structure.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu click success ?' do
        #given
          repository_structure_template_top_title = @prom_profiles['templet_Settings']['repository_structure_template']
          #when
          actual_top_title = @repository_structure.top_title
          #then
          actual_top_title.should == repository_structure_template_top_title
        end

        it 'new department report success ?' do
        #given
          name = @data_prom['repository_template']['name_for_add']
          @repository_structure.new_repository_structure name
          #when
          flag = @repository_structure.find_template_name_exist? name
          #then
          flag.should == true
        end

        it 'modify department report success ?' do
        #given
          name = @data_prom['repository_template']['name_for_modify']
          @repository_structure.modify_repository_structure name
          #when
          flag = @repository_structure.find_template_name_exist? name
          #then
          flag.should == true
        end

        it 'view department report success ?' do
        #given
          expect_top_title = @prom_profiles['templet_Settings']['view_top_title']
          #when
          actual_top_title = @repository_structure.view_repository_structure_title
          #then
          actual_top_title.should == expect_top_title
        end
        #error
        it 'delete department report success ?' do
        #given
          name = @data_prom['repository_template']['name_for_delete']
          @repository_structure.delete_repository_structure
          #when
          flag = @repository_structure.find_template_name_exist? name
          #then
          flag.should == false
        end

      end #describe
    end #TempletSettings
  end #Prom
end #WebTest