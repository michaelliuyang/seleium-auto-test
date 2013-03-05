require_relative '../../load_helper'

module WebTest
  module Rm
    module ProductList
      describe 'product list page' do
        before :all do
          @page_profiles = Helper::ReadProfiles.apps_res_zh :rm
          @data_profiles = Helper::ReadProfiles.data :rm
          @login_name =@data_profiles['login']['login_name']
          @login_passwd =@data_profiles['login']['login_passwd']
          @driver = Support::Login.login(:name => @login_name, :pwd => @login_passwd)
          @page_container = WebDriver.create_page_container :rm, @driver
          @product_list_page = @page_container.product_list_page
          @product_list_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'product list page accessed?'do
          expect = @page_profiles['product_list']['product_list']
          actual = @product_list_page.top_title
          actual.should == expect
        end

        it 'add new product page accessed?'do
          expect = @page_profiles['product_list']['add_product']
          actual = @product_list_page.add_product_title
          actual.should == expect
        end

        it 'authority setting page accessed?'do
          expect = @page_profiles['product_list']['authority_setting_title']
          actual = @product_list_page.authority_setting_title
          actual.should == expect
        end
        #下面两条用例还没有调试成功，采用正常的切换句柄方法无法返回到产品列表页面，而是返回到工作台页面，未找到原因。
        # it 'serial number manage page accessed?'do
          # expect = @page_profiles['product_list']['serial_number_manage']
          # actual = @product_list_page.serial_number_manage_title
          # actual.should == expect
        # end
        #
        #it 'product attribute page accessed?'do
        #  expect = @page_profiles['product_list']['product_attribute']
        #  actual = @product_list_page.product_attribute_title
        #  actual.should == expect
        #end
        
        it add 'product successed?'do
          #given
          name_for_add = @data_profiles['product']['name_for_add']
          @product_list_page.add_product name_for_add
          expect = 1
          #when
          actual = @product_list_page.product_name_exsit? name_for_add
          #then
          actual.should == expect
        end

       end #describe
    end#ProductList
  end #Rm
end #Webtest