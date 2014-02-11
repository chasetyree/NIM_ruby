require 'test/unit'
require_relative "nim"

class NimTest < Test::Unit::TestCase
	def test_smart_1
		@working_array = [0, 1, 0]
		valid_move = false
		while !valid_move
			final_stick = 0
			final_row = 0
			@working_array.each_index do |i|
				j = 0
				while j < @working_array[i] 
					j += 1
					temp_array = @working_array
					temp_array[i] -= j
					binary_array = []
					temp_array.each do |k|
						s = k.to_s(2)
						binary_array.push(s)
					end
					final_binary = 0000
					binary_array.each do |m|
						final_binary = final_binary^m.to_i
					end
					temp_array[i] += j
					if final_binary == 0
						valid_move = true
						final_stick = j
						final_row = i
						@working_array[final_row] -= final_stick
						break
					end
				end
				
				if valid_move
					break
				end
			if valid_move
				break
			end
			
			end
		end
		assert_equal(1, final_row)
		assert_equal(1, final_stick)
		assert_equal(0, @working_array[1])
	end
	
	def test_smart_two
		@working_array = [0, 1, 2]
		valid_move = false
		while !valid_move
			final_stick = 0
			final_row = 0
			@working_array.each_index do |i|
				j = 0
				while j < @working_array[i] 
					j += 1
					temp_array = @working_array
					temp_array[i] -= j
					binary_array = []
					temp_array.each do |k|
						s = k.to_s(2)
						binary_array.push(s)
					end
					final_binary = 0000
					binary_array.each do |m|
						final_binary = final_binary^m.to_i
					end
					temp_array[i] += j
					if final_binary == 0
						valid_move = true
						final_stick = j
						final_row = i
						@working_array[final_row] -= final_stick
						break
					end
				end
				
				if valid_move
					break
				end
			if valid_move
				break
			end
			
			end
		end
		assert_equal(2, final_row)
		assert_equal(1, final_stick)
		assert_equal(1, @working_array[2])
	end
	
	def test_smart_three
		@working_array = [2, 3, 7]
		valid_move = false
		while !valid_move
			final_stick = 0
			final_row = 0
			@working_array.each_index do |i|
				j = 0
				while j < @working_array[i] 
					j += 1
					temp_array = @working_array
					temp_array[i] -= j
					binary_array = []
					temp_array.each do |k|
						s = k.to_s(2)
						binary_array.push(s)
					end
					final_binary = 0000
					binary_array.each do |m|
						final_binary = final_binary^m.to_i
					end
					temp_array[i] += j
					if final_binary == 0
						valid_move = true
						final_stick = j
						final_row = i
						@working_array[final_row] -= final_stick
						break
					end
				end
				
				if valid_move
					break
				end
			if valid_move
				break
			end
			
			end
		end
		assert_equal(2, final_row)
		assert_equal(6, final_stick)
		assert_equal(1, @working_array[2])
	end
	
end