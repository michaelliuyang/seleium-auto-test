require_relative '../../load_helper'

module WebTest
   module Pm
     module ProjectEstimate
        describe 'estimate basic data page' do
               
        before :all do
          @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
          @pm_data = Helper::ReadProfiles.data :pm
          @pm_login_name = @pm_profiles['pcm_login_name']
          @pm_password = @pm_profiles['password']
          @driver = Support::Login.login(:name => @pm_login_name, :pwd => @pm_password)
          @page_container = WebDriver.create_page_container :pm, @driver
          @estimate_basic_data_page = @page_container.estimate_basic_data_page
          @estimate_basic_data_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu page test' do
          #given
          estimate_basic_data_title = @pm_profiles['project_estimate']['estimate_basic_data_title']
          #when
          actual_top_title = @estimate_basic_data_page.top_title
          #then
          actual_top_title.should == estimate_basic_data_title
        end
        
        it 'click estimate percent tab  success?' do
          #given
          estimate_percent = @pm_profiles['project_estimate']['estimate_percent']
          #when
          actual_top_title = @estimate_basic_data_page.estimate_percent_tab_test
          #then
          actual_top_title.should == estimate_percent
        end
        
        it 'modify estimate percent key success?' do
          #given
          estimate_percent = @pm_profiles['project_estimate']['estimate_percent']
          estimate_percent_for_modify = @pm_data['project_estimate']['estimate_percent_for_modify']
          #when
          actual_top_title = @estimate_basic_data_page.modify_estimate_percent_test(estimate_percent_for_modify)
          #then
          actual_top_title.should == estimate_percent
        end
        
        it 'click standard average efficiency tab success?' do
          #given
          standard_average_efficiency = @pm_profiles['project_estimate']['standard_average_efficiency']
          #when
          actual_top_title = @estimate_basic_data_page.standard_average_tab_test
          #then
          actual_top_title.should == standard_average_efficiency
        end
        
        it 'add standard average efficiency style success?' do
          #given
          standard_average_efficiency = @pm_profiles['project_estimate']['standard_average_efficiency']
          type_for_add = @pm_data['project_estimate']['per_capita_productivity_type_for_add']
          value_for_add = @pm_data['project_estimate']['per_capita_productivity_value_for_add']
          #when
          actual_top_title = @estimate_basic_data_page.add_standard_average_test(type_for_add,value_for_add)
          #then
          actual_top_title.should == standard_average_efficiency
        end
        
        it 'delete standard average efficiency style  test' do
          #given
          @estimate_basic_data_page.standard_average_tab_test
          standard_average_efficiency = @pm_profiles['project_estimate']['standard_average_efficiency']
          delete_colmon_index = @pm_data['project_estimate']['per_capita_productivity_type_for_delete_index']
          @estimate_basic_data_page.delete_standard_average_test(delete_colmon_index)
          #when
          actual = @estimate_basic_data_page.find_type_for_index delete_colmon_index
          #then
          actual.should == 0
        end
        
        it 'click standard day costs tab success' do
          #given
          standard_one_day_costs = @pm_profiles['project_estimate']['standard_one_day_costs']
          #when
          actual_top_title = @estimate_basic_data_page.standard_day_costs_tab_test
          #then
          actual_top_title.should == standard_one_day_costs
        end
        
        it 'add standard day costs success' do
          #given
          standard_one_day_costs = @pm_profiles['project_estimate']['standard_one_day_costs']
          value_for_add = @pm_data['project_estimate']['one_day_a_cost_value_for_add']
          #when
          actual_top_title = @estimate_basic_data_page.add_standard_one_day_costs_test(value_for_add)
          #then
          actual_top_title.should == standard_one_day_costs
        end
        
        it 'click coefficient difficult tab success' do
          #given
          coefficient_difficult = @pm_profiles['project_estimate']['coefficient_difficult']
          #when
          actual_top_title = @estimate_basic_data_page.coefficient_difficult_tab_test
          #then
          actual_top_title.should == coefficient_difficult
        end
        
        it 'add coefficient difficult information success' do
          #given
          coefficient_difficult = @pm_profiles['project_estimate']['coefficient_difficult']
          difficulty_name_for_add = @pm_data['project_estimate']['difficulty_coefficient_name_for_add']
          difficulty_limit_for_add = @pm_data['project_estimate']['difficulty_coefficient_limit_for_add']
          #when
          actual_top_title = @estimate_basic_data_page.add_coefficient_difficult_test(difficulty_name_for_add,difficulty_limit_for_add)
          #then
          actual_top_title.should == coefficient_difficult
        end
        
        it 'all delete coefficient difficult  information success' do
          @estimate_basic_data_page.all_delete_test
        end

        end  # describe
     end   #  ProjectReport
   end   # Pm
end # WebTest