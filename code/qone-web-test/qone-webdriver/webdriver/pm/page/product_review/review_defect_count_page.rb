require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component.rb'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/driver_extension_action'

module WebDriver
  module Pm
    module Page
      module ProductReview
          class ReviewDefectCountPage < Common::BasePage
          include Support::Component
          include Support::MenuAction
          include Support::SwitchAction
          include Support::DriverExtensionAction
               def to_this_page
                 @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
                 product_review = @pm_profiles['product_review']['product_review']
                 review_defect_count = @pm_profiles['product_review']['review_defect_count']
                 #menu_click_for_hide product_review,review_defect_count
                 show_menu_by_js "pm_judge"
                 menu_click review_defect_count
               end
               def top_title
                 @driver[:css=>'#content h2'].text
               end
               def according_to_type_of_defect_statistics
                 according_to_type_of_defect_statistics_supper_link.click
                 according_to_type_of_defect_statistics_supper_link.text
               end
               def accoding_to_introduction_of_defects_stage_statistics
                 accoding_to_introduction_of_defects_stage_statistics_supper_link.click
                 accoding_to_introduction_of_defects_stage_statistics_supper_link.text
               end
               def change_shape_size(width,height)
                 change_shape_size_button.click
                 show_menu_by_js "poplayer"
                 modify_fill_in_shape_size(width,height)
                 sleep 3
                 summit_button.click
                 set_the_width_and_height.text
               end
               private 
               
               def according_to_type_of_defect_statistics_supper_link
                 supper_link_name = @pm_profiles['product_review']['accoding_to_type_of_defect_statistics']
                 @driver.find_element(:link=> supper_link_name)
               end
               
               def accoding_to_introduction_of_defects_stage_statistics_supper_link
                 supper_link_name = @pm_profiles['product_review']['change_shape_size']
                 @driver.find_element(:link=> supper_link_name)
               end
               
               def change_shape_size_button
                 supper_link_name = @pm_profiles['product_review']['accoding_to_introduction_of_defects_stage_statistics']
                 @driver.find_element(:link=> supper_link_name)
               end
               def modify_fill_in_shape_size(width,height)
                 fill_in_width.clear
                 fill_in_width.send_keys(width)
                 fill_in_height.clear
                 fill_in_height.send_keys(height)
               end
               def fill_in_width
                 @driver.find_element(:css=>"input[name='width']")
               end
               
               def fill_in_height
                 @driver.find_element(:css=>"input[name='height']")
               end
               
               def summit_button
                 summit_name= @pm_profiles['product_review']['submit']
                 @driver.find_element(:css=>"input[value='#{summit_name}']")
               end
               def set_the_width_and_height
                 @driver.find_element(:id =>'poplayer_handle')
               end
        end #ReviewDefectCountPage
      end #ProductReview
    end #  Page
  end # Pm
end  # WebDriver