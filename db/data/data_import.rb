class DataImport

  attr_reader :file, :fields, :row_map, :default_e

  #Create DSL methods for subclasses
  class << self
    def default_environment(env)
      self.send(:define_method, :default_environment) do
        env
      end
    end
    def default_file(file_name)
      self.send(:define_method, :default_file) do
        file_name
      end
    end
  end

  def initialize(env, file)
    load_rails(env || respond_to?(:default_environment) ? 
      default_environment : "development")
    @file = file || default_file
    raise "You must specify a file" unless @file
  end

  def self.run(env, file)
    new(file, env).run
  end

  def run
    open(file).each_with_index do |line, i|
      initialize_row!(line, i)
    end
  end

  def initialize_row!(line, i)
    @row_map = JSON.parse(line)
    process_row
  end

  def process_row
    puts row_map.inspect
  end

  private
    def load_rails(env)
      ENV['RAILS_ENV'] = env
      require File.join(File.dirname(__FILE__), "..", "..", "config", "boot")
      require File.join(File.dirname(__FILE__), "..", "..", "config", "environment")        
    end

end
