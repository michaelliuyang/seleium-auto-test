require 'webdriver/support/component/table/table'
require 'webdriver/support/component/qone_select'
require 'webdriver/support/component/qone_multiple_select'
require 'webdriver/support/component/qone_date'
require 'webdriver/support/component/tree/qone_project_tree'
require 'webdriver/support/component/tree/qone_user_tree'
require 'webdriver/support/component/qone_data_list'

module WebDriver
  module Support
    module Component
      class ComponentError < StandardError;end
      class NotValidElementError < ComponentError;end
      class IncorrectdIndexError < ComponentError;end
      class CanNotFindOptionError < ComponentError; end
      
      def table(element)
        Table::Table.new element
      end
      
      def select(element)
        Selenium::WebDriver::Support::Select.new element
      end

      def qone_select(driver, element)
        QoneSelect.new(driver, element)
      end

      def qone_multiple_select(driver, element)
        QoneMultipleSelect.new(driver, element)
      end

      def qone_date(driver, element)
        QoneDate.new(driver, element)
      end

      def qone_user_tree driver
        Tree::QoneUserTree.new driver
      end
      
      # search_type is the tab page select's key
      # may be projStatusTree or projDeptTree
      # default is projStatusTree
      def qone_project_tree(driver,search_type = 'projStatusTree')
        Tree::QoneProjectTree.new driver,search_type
      end
      
      def qone_data_list(element,hide_css = nil,hide_type = nil)
        QoneDataList.new element,hide_css,hide_type
      end
      
    end # Component
  end # Support
end # WebDriver