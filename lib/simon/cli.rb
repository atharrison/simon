require 'thor'

# Command-Line Interface, using Thor
module Simon
  class Cli < Thor
    namespace :simon

    GLOBAL_OPTIONS = { #Hack to use a constant here.
                       :simon_user => ''
    }

    CONFIG_FILE = File.join(ENV['HOME'], '.simon.rc.yaml')
    if File.exists? CONFIG_FILE
      config_options = YAML.load_file(CONFIG_FILE).inject({}){|symhash,(k,v)| symhash[k.to_sym] = v; symhash}
      GLOBAL_OPTIONS.merge!(config_options)
    else
      unless ARGV.any?{|val| val == 'configure'}
        STDERR.puts "You haven't configured simon yet."
        STDERR.puts "Run 'simon configure' first."
        exit(0)
      end
    end

    desc "configure", "Configure simon"
    def configure
      setup = Simon::CliHelper.new
      user_options = setup.first_run
      all_options = GLOBAL_OPTIONS.merge(user_options)

      File.open(CONFIG_FILE, 'w') {|file| YAML::dump(all_options, file)}
      say "Initialized configuration file in #{CONFIG_FILE}", :green
    end

    desc "start", "Start Simon"
    def start
      puts "Hello #{GLOBAL_OPTIONS[:simon_user]}. What can I do for you?"
    end


  end
end
