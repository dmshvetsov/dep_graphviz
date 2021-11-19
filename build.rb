# frozen_string_literal: true

require 'ruby-graphviz'
require 'yaml'

INPUT_FILE = 'deps.yml'
OUTPUT_FILE = 'graph.png'

mod_deps = Psych.load_file(INPUT_FILE)

nodes = mod_deps.each_with_object(Set.new) do |(mod, deps), acc|
  acc.add(mod)
  acc.merge(deps)
end

g = GraphViz.new('graph', type: :digraph)

nodes.each { |node| g.add_nodes(node.to_s) }

mod_deps.each do |(mod, deps)|
  deps.each do |dep|
    g.add_edges(mod.to_s, dep.to_s)
  end
end

g.output(png: OUTPUT_FILE)
system("open #{OUTPUT_FILE}")
