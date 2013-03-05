require_relative '../../load_helper'

module WebTest
  module Prom
    module ProcessAssets

      describe ' working environment page' do
        before :all do
          @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
          @data_prom = Helper::ReadProfiles.data :prom
          @epg_login_name = @data_prom['epg_login_name']
          @epg_password = @data_prom['password']
          @driver = Support::Login.login(:name=>@epg_login_name, :pwd=>@epg_password)
          @page_container = WebDriver.create_page_container :prom, @driver
          @work_environment = @page_container.working_environment_page
          @work_environment.to_this_page
        end

        after :all do
          @page_container.close
        end

        # it 'menu click success?' do
        # #given
          # expect_top_title = @prom_profiles['process_assets']['standard_work_environment_top_title']
          # #when
          # actual_top_title = @work_environment.top_title
          # #then
          # actual_top_title.should == expect_top_title
        # end
#         
        # it 'input working environment success ?' do
            # #given
            # names = @data_prom['work_environment']['name']
            # @work_environment.input_environment names
            # #when
            # flag = @work_environment.find_name_exist? names
            # sleep 5
            # #then
            # flag.should == 1
          # end

        # describe 'maintenance species classification' do
#           
         # it 'add success ? ' do
           # #given
           # classifications = @data_prom['work_environment']['classification']
           # types = @data_prom['work_environment']['type_for_add']
           # @work_environment.add_species_classification(classifications,types)           
           # #when
           # sleep 5
           # flag = @work_environment.find_type_exist? type
           # #then
           # flag.should == 1
          # end
#           
         # it 'modify success ?' do 
           # #given
           # types = @data_prom['work_environment']['type_for_modify']
           # @work_environment.modify_species_classification types           
           # #when
           # sleep 5
           # flag = @work_environment.find_type_exist? types
           # #then
           # flag.should == 1
         # end
#          #alert_ok error
         # it 'delete success ?' do
           # #given
           # types = @data_prom['work_environment']['type_for_modify']
           # @work_environment.delete_species_classification           
           # #when
           # sleep 5
           # flag = @work_environment.find_type_exist? types
           # #then
           # flag.should == 0
         # end
#           
       # end
        
        describe 'standard working environment' do
  
          it 'unstandard working environment button click success ? ' do
            #given
            expect_top_title = @prom_profiles['process_assets']['unstandard_working_environment_button']
            #when
            actual_top_title = @work_environment.unstandard_working_environment_title
            #then
            actual_top_title.should == expect_top_title
          end 
                 
        end

      end
    end #ProcessAssets
  end #Prom
end #WebTest