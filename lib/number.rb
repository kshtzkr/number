class Number
    def easy_number(phone_number)

    arr  = [{key: 2, value: ['a','b','c']},{key: 3, value: ['d','e','f']},{key: 4, value: ['g','h','i']},{key: 5, value: ['j','k','l']},{key: 6, value: ['m','n','o']},{key: 7, value: ['p','q','r','s']},{key: 8, value: ['t','u','v']},{key: 9, value: ['w','x','y','z']}]

    itr = phone_number.to_s.split("").map { |e| e.to_i }
    file = File.read("../dictionary.txt")
    if !itr.nil?
      if itr.count < 10 || itr.count > 10
        puts "please enter 10 digit number"
        exit
      elsif itr.include?(0) || itr.include?(1)
        puts "Please remove 0 and 1 from the input"
        exit
      else
        possible_outcome = combos(itr.length,1) + combos(itr.length,2) + combos(itr.length,3)
        @cypher = []
        @word_list = []
        @read_file = []
        @new_word = []

        file.each_line do |x|
          @read_file << x.downcase
        end

        possible_outcome.each do |set|
          if set.count == 1
            first_word = itr
          elsif set.count == 2
            first_word = itr.first(set.first)
            last_word = itr.last(set.last)
          else
            first_word = itr.first(set.first)
            center_word = itr[set[0],set[1]]
            last_word = itr.last(set.last)
          end
          @cypher << first_word << center_word << last_word           
        end

        @cypher.compact.each do |word|
          @word_list << word.map { |e| arr.map { |h| h[:value] if h[:key] == e }.compact.flatten }
        end

        @word_list.each_with_index do |exp,i|
          # puts i
          all_word = exp.map { |e| e }#.flatten#.uniq#.map { |e| e.repeated_permutation(e.length).to_a }
          @new_word << all_word# => .count #all_word.map { |e| e.map { |e| e.join  } }
        end

        @data = []

        @new_word.each do |arr|
            search_list = @read_file.map { |e| e if e.length == arr.count  }.compact
            @data << search_list.map { |e| e.to_s.split("").map { |e| e } }
        end

        # ap @re
        return @new_word#,@word_list
      end   
    else
      puts "No Phone number found."
    end
  end

  private

  def combos(n,x)
    [*(1..10)].repeated_permutation(x).select { |a| a.reduce(:+) == n }.select { |e| e if !e.include?(1)  }.select { |e| e if !e.include?(2)  }
  end
end


number = Number.new()
p easy_number = number.easy_number(6686787825)

