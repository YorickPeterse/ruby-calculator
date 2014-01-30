module Calculator
	class SyntaxError < StandardError

		def invalid_command
			abort("Invalid command please enter a valid value e.g '1 + 2'")
		end

	end
end