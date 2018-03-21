# hyper-vis

A Opal Ruby wrapper for [Vis.js](http://visjs.org) with a Ruby-Hyperloop Component.
Implements the complete API for:
- [Vis Dataset](http://visjs.org/docs/data/dataset.html)
- [Vis Dataview](http://visjs.org/docs/data/dataview.html)
- [Vis Graph2d](http://visjs.org/docs/graph2d/)
- [Vis Graph3d](http://visjs.org/docs/graph3d/)
- [Vis Network](http://visjs.org/docs/network/)
- [Vis Timeline](http://visjs.org/docs/timeline/)

Includes vis.js version 4.21.0

### Demo

[![Reactivity Demo](http://img.youtube.com/vi/fPSpESBbeMQ/0.jpg)](http://www.youtube.com/watch?v=fPSpESBbeMQ "Reactivity Demo")

### Installation
for a Rails app:
```
gem 'hyper-vis'
```
and `bundle update`.

hyper-vis depends on `hyper-component` from [Ruby-Hyperloop](http://ruby-hyperloop.org) but can be used without it.

vis.js is automatically imported for Ruby-Hyperloop. If you use webpacker, you may need to cancel the import in your config/intializers/hyperloop.rb
```
  config.cancel_import 'vis/source/vis.js'
```
The wrapper expects a global `vis` (not `Vis`) to be availabe in javascript. 
stylesheets are includes in 'vis/source/vis.css', images are there too.

### Usage

#### The Vis part
```ruby
dataset = Vis::DataSet.new([{id: 1, name: 'foo'}, {id: 2, name: 'bar'}, {id: 3, name: 'pub'}])
edge_dataset = Vis::DataSet.new([{from: 1, to: 2}, {from: 2, to: 3}])
dom_node = Vis::Network.test_container
net = Vis::Network.new(dom_node, {nodes: dataset, edges: edge_dataset})
xy = net.canvas_to_dom({x: 10, y: 10})
```
#### The Component part
The Component takes care about all the things necessary to make Vis.js play nice with React.
The Component also provides a helper to access the document.
Vis::Network can be used within the render_with_dom_node.
```ruby
class MyVisNetworkComponent
  include Hyperloop::Vis::Network::Mixin

  automatic_refresh true # thats the default, may set to false

  render_with_dom_node do |dom_node, data, options|

    net = Vis::Network.new(dom_node, data, options)

    canvas = document.JS.querySelector('canvas')
  end
end

class AOuterComponent < Hyperloop::Component
  render do
    received_data = []

    options = { manipulation: {
        edit_node: proc { |node_data, callback| received_data << node_data }
      }}

    data = Vis::DataSet.new([{id: 1, name: 'foo'}, {id: 2, name: 'bar'}, {id: 3, name: 'pub'}])
    
    DIV { MyVisNetworkComponent(vis_data: data, otions: options)}
  end
end
```
