module Hyperstack
  module Transport
    module ActionCable
      class ClientDriver
        def self.init
          @consumer_instance = `ActionCable.createConsumer.apply(ActionCable, [#{Hyperstack.action_cable_consumer_url}])`
          notification_channel = "#{Hyperstack.transport_notification_channel_prefix}#{Hyperstack.session_id}"
          %x{
          #{@consumer_instance}.subscriptions.create({ channel: 'Hyperstack::Transport::ActionCable::HyperstackChannel', session_id: #{notification_channel} }, {
                  received: function(data) {
                    return Opal.Hyperstack.$const_get('Transport').$const_get('NotificationProcessor').$process_notification(Opal.Hash.$new(data));
                  }
                })
              }
        end

        def self.consumer_instance
          @consumer_instance
        end
      end
    end
  end
end