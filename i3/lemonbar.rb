#!/usr/bin/env ruby

require 'optparse'

class Bar
  def left
    ''
  end

  def center
    ''
  end

  def right
    ''
  end

  def to_s
    "%{l}#{left}%{c}#{center}%{r}#{right}"
  end
end

class TopBar < Bar
  def right
    Time.now.strftime('%Y-%m-%d %a. %H:%M:%S %p')
  end
end

@docked = false

OptionParser.new do |opts|
  opts.banner = "Usage: lemonbar.rb [options]"
  opts.on('-d', '--dock', 'Force docking without asking wm.') { @docked = true }
end.parse!

top_bar = TopBar.new

IO.popen("lemonbar -p #{'-d' if @docked} -f'Fira Mono-10'", 'w') do |top|
  loop do 
    top.puts(top_bar)
    sleep(0.5)
  end
end

