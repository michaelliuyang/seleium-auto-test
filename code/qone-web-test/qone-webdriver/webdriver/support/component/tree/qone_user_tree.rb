require 'webdriver/support/component/tree/qone_base_tree'

module WebDriver
  module Support
    module Component
      module Tree
        class QoneUserTree < QoneBaseTree
          
          def initialize(driver)
            super(driver)
            @del_list_name = 'userList'
          end
          
          def select_node_by_name(*node_names)
            raise "node_names size is zero" if node_names.size == 0
            if @select_type == 'radio'
              search_by_name node_names[0]
              @nodes[node_names[0]].click if @nodes[node_names[0]]
            else
              node_names.each do |name|
                search_by_name name
                if @nodes[name]
                  @nodes[name].click unless @nodes[name].attribute('checked')
                end
              end
            end
          end
          
          private
          
          def search_input
            @element.find_element :css=>"div#selectTree input#searchT"
          end
          
          def search_by_name name
            search_input.clear
            send_key_and_press_enter(search_input, name)
            sleep 2 # Waiting for search results
            reset_nodes
          end
          
          def reset_nodes
            @nodes.clear
            leaf_nodes.each do |node|
              begin
                name = node.find_element(:css=>'a span').text
                input = node.find_element(:css=>"input[type='"+"#{@select_type}"+"']")
                @nodes.store(name, input) if name != nil && input != nil
              rescue
                next
              end
            end
          end
          
          def leaf_nodes
            @element.find_elements(:css => "div[class='x-tree-node-el x-unselectable x-tree-node-leaf']")
          end
          
        end # QoneUserTree
      end # Tree
    end # Component
  end # Support
end # WebDriver