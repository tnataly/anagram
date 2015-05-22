def three_letter?(input)
	if input.length == 3 
		return true
	else
		return false
	end
end

def distinct_letters?(input)
	letter_array = input.chars
	unique_letters = input.split("").uniq.join
	if unique_letters.length < letter_array.length
		false
	else
		true
	end
end

def valid_input?(input)
	if three_letter?(input) && distinct_letters?(input)
		true
	else
		false
	end
end

get '/anagrams/:word' do
	@word = params[:word]
	@anagrams = Word.find_anagrams(@word)
	erb :show
end

get '/' do
	erb :index
end

post '/' do
	@word = params[:word]
	if valid_input?(@word)
		redirect "/anagrams/#{@word}"	
	else
		@error = "Your word is not valid<br>"
		erb :index
	end
end
