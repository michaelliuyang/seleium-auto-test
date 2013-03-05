require_relative '../../load_helper'

module WebTest
  module Prom
    module ProcessAssets

      describe ' survival cycle page' do
        before :all do
          @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
          @data_prom = Helper::ReadProfiles.data :prom
          @epg_login_name = @data_prom['epg_login_name']
          @epg_password = @data_prom['password']
          @driver = Support::Login.login(:name=>@epg_login_name, :pwd=>@epg_password)
          @page_container = WebDriver.create_page_container :prom, @driver
          @survival_cycle = @page_container.survival_cycle_page
          @survival_cycle.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu click success ?' do
        #given
          survival_cycle_model_top_title = @prom_profiles['process_assets']['survival_cycle_model']
          #when
          actual_top_title = @survival_cycle.top_title
          #then
          actual_top_title.should == survival_cycle_model_top_title
        end

        it 'new survival success ?' do
        #given
          names = @data_prom['survival_cycle']['name_for_add']
          @survival_cycle.new_survival_cycle_model names
          #when
          flag = @survival_cycle.find_name_exist? names
          #then
          flag.should == true
        end
        
        it 'modify survival success ?' do
          #given
          names = @data_prom['survival_cycle']['name_for_modify']
          @survival_cycle.modify_survival_cycle_model names
          #when
          flag = @survival_cycle.find_name_exist? names
          #then
          flag.should == true
        end
        #error
        it 'delete survival success ?' do
          #given
          names = @data_prom['survival_cycle']['name_for_delete']
          @survival_cycle.delete_survival_cycle_model
          #when
          flag = @survival_cycle.find_name_exist? names
          #then
          flag.should == false
        end
        
        it 'view survival success ?' do
          #given
          expect_top_title = @prom_profiles['process_assets']['survival_cycle_model']
          #when
          actual_top_title = @survival_cycle.view_survival_cycle_model_title
          #then
          actual_top_title.should == expect_top_title
        end
        
        it 'related project template success ?' do
          #given
          names = @data_prom['survival_cycle']['name_for_related']
          @survival_cycle.related_project_template
          #when
          flag = @survival_cycle.judge_use_times names
          #then
          flag.should == 1
        end

      end #describe

    end #WebTest
  end #Prom
end #WebTest