def my_string_index(haystack, needle)
    index = -1
    haystack.chars.each_with_index do |char, i|
        if char == needle
            index = i
            break
        end
    end
    return index
end
