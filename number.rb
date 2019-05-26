class Number
    def easy_number(phone_number)
    number2 = ['a','b','c',2]
    number3 = ['d','e','f',3]
    number4 = ['g','h','i',4]
    number5 = ['j','k','l',5]
    number6 = ['m','n','o',6]
    number7 = ['p','q','r','s',7]
    number8 = ['t','u','v',8]
    number9 = ['w','x','y','z',9]

    itr = phone_number.to_s.split("").map { |e| e.to_i }
    itr.delete(0)
    itr.delete(1)
    if !itr.nil?
      if itr.count < 10 || itr.count > 10
        puts "please enter 10 digit number"
      else
        @alpha2 = []
        @alpha3 = []
        @alpha4 = []
        @alpha5 = []
        @alpha6 = []
        @alpha7 = []
        @alpha8 = []
        @alpha9 = []
        itr.each do |num|
          if number2.include?(num.to_i)
            @alpha2 << ['a','b','c']
          elsif number3.include?(num.to_i)
            @alpha3 << ['d','e','f']
          elsif number4.include?(num.to_i)
            @alpha4 << ['g','h','i']
          elsif number5.include?(num.to_i)
            @alpha5 << ['j','k','l']
          elsif number6.include?(num.to_i)
            @alpha6 << ['m','n','o']
          elsif number7.include?(num.to_i)
            @alpha7 << ['p','q','r','s']
          elsif number8.include?(num.to_i)
            @alpha8 << ['t','u','v']
          elsif number9.include?(num.to_i)
            @alpha9 << ['w','x','y','z']
          end
        end
        common_alpha = @alpha2 + @alpha3 + @alpha4 + @alpha5 + @alpha6 + @alpha7 + @alpha8 + @alpha9
        uniq_keys = common_alpha.flatten.uniq
        needed_set = ['m','o','t','r','u','c','k','n','s','a','l','p']
        new_list = uniq_keys - needed_set
        required_keys = uniq_keys - new_list
        repeated_permutation = required_keys.repeated_permutation(10).to_a
        word_making = repeated_permutation.map { |e| e.join }
        words = word_making.map { |e| e if e.include?("motortruck") || e.include?("motor") || e.include?("truck") || e.include?("usual") || e.include?("noun") || e.include?("struck") || e.include?("not") || e.include?("opt") || e.include?("puck") || e.include?("catamounts") || e.include?("acta") || e.include?("mounts") || e.include?("act") || e.include?("amounts") || e.include?("contour") || e.include?("cat") || e.include?("boot") || e.include?("our") }
        puts words
      end 
    else
      puts "No Phone number found."
    end
  end
end


number = Number.new()
easy_number = number.easy_number(98163249272)
