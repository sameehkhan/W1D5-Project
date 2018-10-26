require 'byebug'

class PolyTreeNode
  

    def initialize(value)
      @value = value 
      @children = []
      @parent = nil
    end
    
    def parent=(val)
      @parent.children.delete(self) if @parent

      @parent = val
      if val && @parent.children.none? { |el| el == self}
          @parent.children << self
      end 
    end
    
    def parent 
      parent
    end
    
    def children 
      children
    end
    
    def value
      value
    end
    
    def add_child(child_node)
      children << child_node
      
      child_node.parent = self 
    end 
    
    def remove_child(child_node)
      if children.include?(child_node)
        children.delete(child_node)
        child_node.parent = nil
      else
        raise error 
      end 
    end
    
    attr_reader :parent, :children, :value
    
end