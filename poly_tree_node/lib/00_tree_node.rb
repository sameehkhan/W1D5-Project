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
    
    def dfs(target_value)
      
      return self if self.value == target_value
      # return nil if self.children.empty?
      
    
      
      self.children.each do |el|
        result = el.dfs(target_value)
        
        return result if result 
        
      end 
      nil
    end 
    
    def bfs(target_value)
      arr = [self]
      # debugger
      until arr.empty?
        if arr.first == target_value
          return arr.first
        else 
          node = arr.shift
          arr = arr + node.children if node.children.empty?
        end
      end
      nil
    end
      

    
    
    
    
    
    
    
    
    attr_reader :parent, :children, :value
    
end

