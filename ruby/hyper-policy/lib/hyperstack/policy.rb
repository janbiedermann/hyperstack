module Hyperstack
  module Policy
    def authorize(user, class_name, action, *policy_context)
      begin
        policy_class = "::#{class_name}Policy".constantize
        if policy_class
          allow_action= "allow_#{action}?"
          policy = policy_class.new(user)
          if policy.respond_to?(allow_action)
            return policy.send(allow_action, *policy_context)
          end
        end
        { denied: "No policy for #{class_name} #{action}!"}
      rescue NameError
        { denied: "No policy for #{class_name} #{action}!"}
      end
    end

    def authorized?(user, class_name, action, *policy_context)
      result = authorize(user, class_name, action, *policy_context)
      if result.has_key?(:denied)
        false
      elsif result.has_key?(:allowed)
        if block_given?
          yield
        else
          true
        end
      end
    end

    def authorize!(user, class_name, action, *policy_context)
      result = authorize(user, class_name, action, *policy_context)
      if result.has_key?(:denied)
        raise [result[:denied], "#{result[:expected_values]}", "#{result[:qualified_values]}"].join("\n")
      end
    end


    def promise_authorize(user, class_name, action, *policy_context)
      if RUBY_ENGINE == 'opal'
        agent = Hyperstack::Transport::RequestAgent.new
        Hyperstack.client_transport_driver.promise_send(Hyperstack.api_path, { policy: { agent.object_id => { user_id: user.id, class_name: class_name, action: action, policy_context: JSON.generate(*policy_context) }}}).then do
          raise if agent.result.has_key?(:denied)
          agent.result
        end.fail do
          agent.result
        end
      else
        p = Promise.new(success: proc { authorize(user, class_name, action, *policy_context)})
        p.resolve
        p
      end
    end
  end
end