function readFile()
    input_file = open("input.txt")
    lines = readlines(input_file)
    lines
end

function calculateSeatId(pass::String)
    back = 0
    front = 127
    for c in pass[1:end-3]
        if c == 'F'
            front = back + floor((front - back)/2)
        elseif c == 'B'
            back = back + ceil((front - back)/2)
        end
    end

    left = 0
    right = 7
    for c in pass[end-3:end]
        if c == 'L'
            right = left + floor((right - left)/2)
        elseif c == 'R'
            left = left + ceil((right - left)/2)
        end
    end
    back * 8 + right
end

seats = sort(map(x -> calculateSeatId(x), readFile()))
println(sum([min(seats...):max(seats...);]) - sum(seats))
