module Hyperstack
  module Policy
    module InstanceMethods
      attr_reader :current_user

      def initialize(current_user)
        @current_user = current_user
      end
    end
  end
end