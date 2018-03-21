module Vis
  class Graph3d
    include Native
    include Vis::Utilities

    aliases_native %i[
      animationStart
      animationStop
      redraw
      setSize
    ]

    def initialize(native_container, dataset, options = {})
      native_options = options_to_native(options)
      native_data = dataset.to_n
      @event_handlers = {}
      @native = `new vis.Graph3d(native_container, native_data, native_options)`
    end

    # global methods

    def set_data(dataset)
      native_data = dataset.to_n
      @native.JS.setData(native_data)
    end

    def set_options(options)
      native_options = options_to_native(options)
      @native.JS.setOptions(native_options)
    end

    # graph3d methods

    def get_camera_position(dis_hor_ver)
      res = @native.JS.getCameraPosition(dis_hor_ver.to_n)
      `Opal.Hasg.$new(res)`
    end

    def set_camera_position(dis_hor_ver)
      res = @native.JS.setCameraPosition(dis_hor_ver.to_n)
      `Opal.Hasg.$new(res)`
    end

    def options_to_native(options)
      return unless options
      # options must be duplicated, so callbacks dont get wrapped twice
      new_opts = {}.merge!(options)

      if new_opts.has_key?(:onclick)
        block = new_opts[:onclick]
        if `typeof block === "function"`
          unless new_opts[:onclick].JS[:hyper_wrapped]
            new_opts[:onclick] = %x{
              function(point) {
                return #{block.call(`Opal.Hash.$new(point)`)};
              }
            }
            new_opts[:onclick].JS[:hyper_wrapped] = true
          end
        end
      end

      if new_opts.has_key?(:tooltip)
        block = new_opts[:tooltip]
        if `typeof block === "function"`
          unless new_opts[:tooltip].JS[:hyper_wrapped]
            new_opts[:tooltip] = %x{
              function(item) {
                return #{block.call(`Opal.Hash.$new(item)`)};
              }
            }
            new_opts[:tooltip].JS[:hyper_wrapped] = true
          end
        end
      end

      if new_opts.has_key?(:x_value_label)
        block = new_opts[:x_value_label]
        if `typeof block === "function"`
          unless new_opts[:x_value_label].JS[:hyper_wrapped]
            new_opts[:x_value_label] = %x{
              function(value) {
                return #{block.call(value)};
              }
            }
            new_opts[:x_value_label].JS[:hyper_wrapped] = true
          end
        end
      end

      if new_opts.has_key?(:y_value_label)
        block = new_opts[:y_value_label]
        if `typeof block === "function"`
          unless new_opts[:y_value_label].JS[:hyper_wrapped]
            new_opts[:y_value_label] = %x{
              function(value) {
                return #{block.call(value)};
              }
            }
            new_opts[:y_value_label].JS[:hyper_wrapped] = true
          end
        end
      end

      if new_opts.has_key?(:z_value_label)
        block = new_opts[:z_value_label]
        if `typeof block === "function"`
          unless new_opts[:z_value_label].JS[:hyper_wrapped]
            new_opts[:z_value_label] = %x{
              function(value) {
                return #{block.call(value)};
              }
            }
            new_opts[:z_value_label].JS[:hyper_wrapped] = true
          end
        end
      end

      lower_camelize_hash(new_opts).to_n
    end
  end
end