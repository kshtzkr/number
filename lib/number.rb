class Number
    def easy_number(phone_number)
    # number2 = ['a','b','c',2]
    # number3 = ['d','e','f',3]
    # number4 = ['g','h','i',4]
    # number5 = ['j','k','l',5]
    # number6 = ['m','n','o',6]
    # number7 = ['p','q','r','s',7]
    # number8 = ['t','u','v',8]
    # number9 = ['w','x','y','z',9]

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
          all_word = exp.map { |e| e }.map { |e| e.repeated_permutation(e.length).to_a }
          @new_word << all_word.map { |e| e.map { |e| e.join  } }
        end

        # @alpha2 = []
        # @alpha3 = []
        # @alpha4 = []
        # @alpha5 = []
        # @alpha6 = []
        # @alpha7 = []
        # @alpha8 = []
        # @alpha9 = []
        # itr.each do |num|
        #   if number2.include?(num.to_i)
        #     @alpha2 << ['a','b','c']
        #   elsif number3.include?(num.to_i)
        #     @alpha3 << ['d','e','f']
        #   elsif number4.include?(num.to_i)
        #     @alpha4 << ['g','h','i']
        #   elsif number5.include?(num.to_i)
        #     @alpha5 << ['j','k','l']
        #   elsif number6.include?(num.to_i)
        #     @alpha6 << ['m','n','o']
        #   elsif number7.include?(num.to_i)
        #     @alpha7 << ['p','q','r','s']
        #   elsif number8.include?(num.to_i)
        #     @alpha8 << ['t','u','v']
        #   elsif number9.include?(num.to_i)
        #     @alpha9 << ['w','x','y','z']
        #   end
        # end
        # common_alpha = @alpha2 + @alpha3 + @alpha4 + @alpha5 + @alpha6 + @alpha7 + @alpha8 + @alpha9

        # uniq_keys = common_alpha.flatten.uniq
        # needed_set = ['m','o','t','r','u','c','k','n','s','a','l','p']
        # new_list = uniq_keys - needed_set
        # required_keys = uniq_keys - new_list
        # repeated_permutation = required_keys.repeated_permutation(10).to_a
        # word_making = repeated_permutation.map { |e| e.join }
        # words = word_making.map { |e| e if e.include?("motortruck") || e.include?("motor") || e.include?("truck") || e.include?("usual") || e.include?("noun") || e.include?("struck") || e.include?("not") || e.include?("opt") || e.include?("puck") || e.include?("catamounts") || e.include?("acta") || e.include?("mounts") || e.include?("act") || e.include?("amounts") || e.include?("contour") || e.include?("cat") || e.include?("boot") || e.include?("our") }
        # puts words
        return  @word_list
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

