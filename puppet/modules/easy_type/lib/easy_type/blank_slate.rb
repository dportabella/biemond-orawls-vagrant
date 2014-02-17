class BlankSlate
	# if RUBY_VERSION == "1.8.7"
	# 	REQUIRED_METHODS = ['instance_eval', 'object_id', '__send__', '__id__']
	# else
	# 	REQUIRED_METHODS = [:instance_eval, :object_id, :__send__, :__id__, :debugger, :puts, :extend]
	# end
	# instance_methods.each { |m| undef_method m unless REQUIRED_METHODS.include?(m) }

	attr_accessor :entries, :type, :results
	TYPES = [:main, :before, :after]

	def initialize
		@entries = {}
		@results = {}
		TYPES.each do | type|
			@results[type] = []
			@entries[type] ||= []
		end
	end

	def execute
		TYPES.each do | type|
			entries[type].each do | command_entry|
				results[type] << command_entry.execute
			end
		end
	end

	def eigenclass 
    class << self
      self
    end
  end 

end
