#!/usr/bin/env ruby

require 'json'
require 'optparse'

@step = 1
@on_output = false

OptionParser.new do |opts|
  opts.banner = "Usage: numeric_workspace.rb [flags]"
  opts.on('-n', '--next', 'Focus on next numeric workspace (default)') { @step = 1 }
  opts.on('-p', '--prev', 'Focus on previous numeric workspace') { @step = -1 }
  opts.on('-o', '--on-output', 'Restrict numeric workspaces to those on current output') { @on_output = true }
end.parse!

workspaces = JSON.parse(`i3-msg -t get_workspaces`)

current_ws = workspaces.detect { |w| w['focused'] }

numeric_wss = workspaces.select do |w|
  w['num'] != -1 && (!@on_output || w['output'] == current_ws['output'])
end

next_index = (numeric_wss.index(current_ws) + @step) % numeric_wss.size rescue 1

`i3-msg workspace #{numeric_wss[next_index]['num']}`
