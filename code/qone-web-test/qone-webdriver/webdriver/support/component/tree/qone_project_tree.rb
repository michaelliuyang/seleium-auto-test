require 'webdriver/support/component/tree/qone_base_tree'

module WebDriver
  module Support
    module Component
      module Tree
        class QoneProjectTree < QoneBaseTree
          
          def initialize(driver,search_type)
            super(driver)
            @search_type = search_type
            display
            set_nodes
            @del_list_name = 'projList'
          end
          
          def [](node_name)
            @nodes[node_name]
          end
          
          def select_node_by_name(*node_names)
            raise "node_names size is zero" if node_names.size == 0
            if @select_type == 'radio'
              @nodes[node_names[0]].click if @nodes[node_names[0]]
            else
              node_names.each do |name|
                if @nodes[name]
                  @nodes[name].click unless @nodes[name].attribute('checked')
                end
              end
            end
          end
          
          private
          
          def set_nodes
            leaf_nodes.each do |node|
              begin
                name = node.find_element(:css=>'a span').text
                input = node.find_element(:css=>"input[type='"+"#{@select_type}"+"']")
                @nodes.store(name,input) if name != nil && input != nil
              rescue
                next
              end
            end
          end
          
          def display
            @element.find_element(:css=>"div[id='card_status'] a").click if @search_type == 'projStatusTree'
            @element.find_element(:css=>"div[id='card_dept'] a").click if @search_type == 'projDeptTree'
            show_nodes
          end
          
          def leaf_nodes
            @element.all :css=>"div##{@search_type} div[class='x-tree-node-el x-unselectable x-tree-node-leaf']"
          end
          
          def show_nodes
            js = "el = document.getElementsByTagName('ul');
            for(i=0;i<el.length;i++){el[i].style.display='block'}"
            @driver.execute_script js
          end
          
        end # QoneProjectTree
      end # Tree
    end # Component
  end # Support
end # WebDriver