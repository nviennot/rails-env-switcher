module RailsEnvSwitcher::Pry
  def self.setup
    ::Pry::CommandSet.new do
      create_command "env", "Switch environment. ctrl+d to leave" do
        group "Environment"
        def process(env)
          unless env
            puts "Usage: 'env test' for example"
          end

          RailsEnvSwitcher.with_env(env) do
            # irb-config compatibility
            if defined?(::IRB::Pry::TopLevel)
              TopLevel.new.pry
            else
              env.pry
            end
          end
        end
      end
    end.tap { |cmd| ::Pry::Commands.import cmd }
  end
end
