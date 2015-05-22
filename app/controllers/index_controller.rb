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

def valid_input(input)
	raise Exception.new("Word must be less than or equal to 3 characters.") if !three_letter?(input)
	raise Exception.new("Word must include distinct characters.") if !distinct_letters?(input)
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
	begin
		valid_input(@word)
		redirect "/anagrams/#{@word}"	
	rescue Exception => error
		@error = error.message
		erb :index
	end
end
