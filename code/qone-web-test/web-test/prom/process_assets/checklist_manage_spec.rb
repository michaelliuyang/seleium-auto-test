require_relative '../../load_helper'

module WebTest
  module Prom
    module ProcessAssets

      describe 'checklist manage' do

        before :all do
          @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
          @data_prom = Helper::ReadProfiles.data :prom
          @epg_login_name = @data_prom['epg_login_name']
          @epg_password = @data_prom['password']
          @driver = Support::Login.login(:name=>@epg_login_name, :pwd=>@epg_password)
          @page_container = WebDriver.create_page_container :prom, @driver
          @checklist_manage_page = @page_container.checklist_manage_page
          @checklist_manage_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu click success ?' do
        #given
          checklists_manage_top_title = @prom_profiles['process_assets']['checklists_manage_top_title']
          #when
          actual_top_title = @checklist_manage_page.right_frame_title
          #then
          actual_top_title.should == checklists_manage_top_title
        end

        describe 'check item evaluation method page' do

          it 'add evaluation success ?' do
            #given
            evaluation_name = @data_prom['evaluation_method']['name_for_add']
            content = @data_prom['evaluation_method']['evaluation_content']
            @checklist_manage_page.add_evaluation_method(evaluation_name, content)
            #when            
            flag = @checklist_manage_page.find_evaluation_name_exist? evaluation_name             
            #then
            flag.should == 1
          end
          
          it 'modify evaluation success ?' do
            evaluation_name = @data_prom['evaluation_method']['name_for_modify']
            @checklist_manage_page.modify_evaluation_method evaluation_name
            #when            
            flag = @checklist_manage_page.find_evaluation_name_exist? evaluation_name           
            #then
            flag.should == 1
          end
          
          it 'delete evaluation success ?' do
            #given
            evaluation_name = @data_prom['evaluation_method']['name_for_modify']
            @checklist_manage_page.delete_evaluation_method
            #when            
            flag = @checklist_manage_page.find_evaluation_name_exist? evaluation_name           
            #then
            flag.should == 0
          end
          
        end

      end#describe checklist manage 
      
    end#ProcessAssets
  end#Prom
end#WebTest