require_relative '../../load_helper'

module WebTest
  module Mea
    module MeasurementSet

      describe 'measure target page ' do

        before :all do
          @mea_profiles = Helper::ReadProfiles.apps_res_zh :mea
          @data_mea = Helper::ReadProfiles.data :mea
          @epg_login_name = @data_mea['epg_login_name']
          @epg_password = @data_mea['password']
          @driver = Support::Login.login(:name=>@epg_login_name, :pwd=>@epg_password)
          @page_container = WebDriver.create_page_container :mea, @driver
          @measure_target_page = @page_container.measure_target_page
          @measure_target_page.to_this_page
        end

        after :all do
           @page_container.close
        end

        # it 'menu click success ?' do
          # #given
          # measure_target_top_title = @mea_profiles['measure_setup']['measure_target_top_title']
          # #when
          # actual_top_title = @measure_target_page.top_title
          # #then
          # actual_top_title.should == measure_target_top_title
        # end
        
        # it 'add success ?' do
          # #given
          # target_name = @data_mea['measure_target']['name_for_add']
          # #when
          # @measure_target_page.add_measure_target target_name
          # actual = @measure_target_page.find_target_name_exist? target_name
          # #then
          # actual.should == true
        # end
#         
        # it 'view success ?' do
          # #given
          # expect_top_title = @mea_profiles['measure_setup']['view_measure_target_title']
          # #when
          # actual_top_title = @measure_target_page.view_measure_top_title
          # #then
          # actual_top_title.should == expect_top_title
        # end
        
        
        #error
        it 'modify success ?' do
          #given
          target_name = @data_mea['measure_target']['name_for_modify']
          @measure_target_page.modify_measure target_name
          #when
          actual = @measure_target_page.find_target_name_exist? target_name
          #then
          actual.should == true
        end
                
        # #error
        # it 'delete success ?' do
          # target_name = @data_mea['measure_target']['name_for_delete']
          # @measure_target_page.delete_measure
          # sleep 6
          # actual = @measure_target_page.find_target_name_exist? target_name
          # actual.should == false         
        # end
        
         # describe 'measure index list page ' do
#  
           # it 'add index success?'do
             # #given
             # index_name = @data_mea['add_index']['select_add_index_name']
             # #when
             # @measure_target_page.add_index
             # actual = @measure_target_page.find_index_name? index_name
             # #then
             # actual.should == true
           # end
#            
           # it 'delete index success?'do
             # #given
             # index_name = @data_mea['add_index']['select_add_index_name']
             # @measure_target_page.delete_index index_name
             # expect = false
             # #when
             # actual = @measure_target_page.find_index_name? index_name
             # #then
             # actual.should == expect
           # end            
# 
         # end

      end #describe
    end#MeasurementSet
  end#Mea
end#WebTest