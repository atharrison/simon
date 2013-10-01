module Simon
  class CliHelper < Thor::Shell::Basic

    def first_run
      say "Configuring simon. I'm going to ask you a few questions."
      result = {}
      loop do
        simon_user = ask "What is your name?"

        result = {:simon_user => simon_user}
        say "You enterered:"
        say "  Name: #{simon_user}"
        if yes? "Is this correct?"
          break
        end
      end

      result
    end
  end
end

