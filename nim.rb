#Authors: Chase Tyree and Sean Zeiler

class Nim
	#Sets up needed class variables.
	def initialize
		@array_hash = Hash.new
		@array_hash[1] = [1,3,5,7]
		@array_hash[2] = [4,3,7]
		@comp_choice = ""
		@working_array = []
	end

	#Code to prompt the user to select a board configuration.
	def Select_Config
		puts "Welcome to the GAME OF NIM!!!!"
		print "1: "
		puts @array_hash[1].to_s
		print "2: "
		puts @array_hash[2].to_s
		something = 0
		correct = false
		while correct != true do
			print "Please select configuration 1 or 2: "
			something = gets.chomp
			if (something == "1")
				@working_array = @array_hash[1]
				correct = true
			elsif (something == "2")
				@working_array = @array_hash[2]
				correct = true
			end
		end
	end

	#Code to prompt the human to select which computer.
	def Select_computer
		puts "1: Smart Computer"
		puts "2: Dumb Computer"
		print "Please select Computer smartness level (1-2): "
		something = 0
		correct = false
		while correct != true do
			something = gets.chomp
			if (something == "1")
				#@board_choice = 1
				@comp_choice = "smart"
				correct = true
			elsif (something == "2")
				#@board_choice = 2
				@comp_choice = "dumb_"
				correct = true
			end
		end
	end
	
	#Code to display the board in an easily readable format.
	def display_board
	puts""
		@working_array.each_index do |i|
			print "Row #{i+1}: "
			@working_array[i].times do |j|
				print "x"
			end
			puts ""
		end
		puts ""
	end

	#Loop to repeatedly have the players take turns.
	def play_game
		game_end = false
		while !game_end
			temp = 0
			human_player_turn
			@working_array.each do |i|
				temp += i
			end
			
			if temp == 0
				puts "Human Player wins!!!"
				break
			end
			
			if @comp_choice == "smart"
				self.methods.each do |method|
					if(method.to_s[0..4] == "smart")
						self.send method
					end
				end
			else
				self.methods.each do |method|
					if(method.to_s[0..4] == "dumb_")
						self.send method
					end
				end
			end
			temp = 0
			@working_array.each do |i|
				temp += i
			end
			if temp == 0
				if @comp_choice == "smart"
					puts "Smart computer player wins!!! ( You had no chance >:D )"
				else
					puts "You lost to the dumb computer! Who's the dumb one now!"
				end
				break
			end
		end
	end

	#Code to allow the human to pick a row and number of sticks.
	def human_player_turn
		display_board
		completed = false
		while completed == false
			print "Select a row to take sticks from (1 - #{@working_array.length}) "
			row_s = gets.chomp
			row = row_s.to_i
			if row > @working_array.length
				puts "That is not a valid row. Moron."
				puts ""
			else
				if @working_array[row-1] == 0
					puts "There are no sticks left in that row stupid."
					puts ""
				else
					print "Select how many sticks you want to take (1 - #{@working_array[row-1].to_i}) "
					num_s = gets.chomp
					num = num_s.to_i
					if num > @working_array[row-1].to_i
						puts "There aren't that many sticks you fool."
						puts ""
					else
						@working_array[row-1] -= num
						completed = true
					end
				end
			end
		end
		puts ""
	end
	
	#Code for the dumb computer to randomly select a number of rows and sticks from that row.
	def dumb_computer_turn
	valid_move = false
		while !valid_move
			row = rand(@working_array.length)
			if @working_array[row] != 0
				num = rand(@working_array[row]+1)
				if num != 0
					@working_array[row] -= num
					valid_move = true
				end
			end
		end
		puts ""
		puts "Computer player removed #{num} sticks from row #{row+1}"
		puts ""
	end
	
	def smart_computer_turn
		valid_move = false
		while !valid_move
			final_stick = 0
			final_row = 0
			@working_array.each_index do |i|
				j = 0
				while j < @working_array[i] 
					j += 1
					#puts "J is #{j} and Row is #{i+1}"
					temp_array = @working_array
					temp_array[i] -= j
					binary_array = []
					temp_array.each do |k|
						s = k.to_s(2)
						binary_array.push(s)
					end
					#puts binary_array
					final_binary = 0000
					binary_array.each do |m|
						final_binary = final_binary^m.to_i
					end
					#puts final_binary
					#puts ""
					temp_array[i] += j
					if final_binary == 0
						valid_move = true
						final_stick = j
						#puts "final_stick is #{final_stick}"
						final_row = i
						#puts "final_row is #{final_row+1}"
						#puts "@working_array[i] originally was #{@working_array[i]}"
						@working_array[final_row] -= final_stick
						#puts "@working_array[i] IS NOW #{@working_array[i]}"
						#puts ""
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
		puts "Computer took #{final_stick} sticks from Row #{final_row+1}"
		puts ""
	end
	
#class end
end

if (__FILE__ == $0)
	x = Nim.new
	x.Select_Config
	x.Select_computer
	x.play_game
end