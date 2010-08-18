# Some default enhancements/settings for IRB, based on
# http://wiki.rubygarden.org/Ruby/page/show/Irb/TipsAndTricks
if ENV['RAILS_ENV']
 # Called after the irb session is initialized and Rails has been loaded
 IRB.conf[:IRB_RC] = Proc.new do
   logger = Logger.new(STDOUT)
   ActiveRecord::Base.logger = logger
   ActiveResource::Base.logger = logger
   require 'sqlconsole'
 end
end

unless defined? ETC_IRBRC_LOADED

 # Require RubyGems by default.
 require 'rubygems'

 begin
   require "ap"
   IRB::Irb.class_eval do
     def output_value
       ap @context.last_value
     end
   end
 rescue LoadError => e
   puts "ap gem not found.  Try typing 'gem install awesome_print' to get super-fancy output."
 end

 # Activate auto-completion.
 require 'irb/completion'

 # Use the simple prompt if possible.
 IRB.conf[:PROMPT_MODE] = :SIMPLE if IRB.conf[:PROMPT_MODE] == :DEFAULT

 # Setup permanent history.
 HISTFILE = "~/.irb_history"
 MAXHISTSIZE = 100
 begin
   histfile = File::expand_path(HISTFILE)
   if File::exists?(histfile)
     lines = IO::readlines(histfile).collect { |line| line.chomp }
     puts "Read #{lines.nitems} saved history commands from '#{histfile}'." if $VERBOSE
     Readline::HISTORY.push(* lines)
   else
     puts "History file '#{histfile}' was empty or non-existant." if $VERBOSE
   end
   Kernel::at_exit do
     lines = Readline::HISTORY.to_a.reverse.uniq.reverse
     lines = lines[-MAXHISTSIZE, MAXHISTSIZE] if lines.nitems > MAXHISTSIZE
     puts "Saving #{lines.length} history lines to '#{histfile}'." if $VERBOSE
     File::open(histfile, File::WRONLY|File::CREAT|File::TRUNC) {|io| io.puts lines.join("\n") }
   end
 rescue => e
   puts "Error when configuring permanent history: #{e}" if $VERBOSE
 end

 ETC_IRBRC_LOADED=true
end

script_console_running = ENV.include?('RAILS_ENV') && IRB.conf[:LOAD_MODULES] && IRB.conf[:LOAD_MODULES].include?('console_with_helpers')
rails_running = ENV.include?('RAILS_ENV') && !(IRB.conf[:LOAD_MODULES] && IRB.conf[:LOAD_MODULES].include?('console_with_helpers'))
irb_standalone_running = !script_console_running && !rails_running

if script_console_running
 require 'logger'
 Object.const_set(:RAILS_DEFAULT_LOGGER, Logger.new(STDOUT))
end