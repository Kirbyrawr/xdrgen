module Xdrgen::AST
  module Concerns
    module Contained      
      extend Memoist

      protected
      memoize def ancestors
        current = self.parent
        result = []

        while current.present?
          result.unshift(current)
          current = current.parent
        end
        
        result
      end

      def find_ancestors(type)
        ancestors.select{|a| a.is_a?(type)}
      end
    end
  end
end