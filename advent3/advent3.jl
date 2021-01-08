input_file = open("C:\\Julia workspace\\advent3\\input.txt")
lines = readlines(input_file)

function countTrees(down, right, lines)::Int64
    position = 1
    trees = 0

    for line in lines[1:down:end]
        if(position > length(line))
            line ^= ceil(Int, position / length(line))
        end
        if(line[position] == '#')
            trees += 1
        end
        position = position + right
    end
    trees
end

println(countTrees(1, 1, lines) * countTrees(1, 3, lines) * countTrees(1, 5, lines) * countTrees(1, 7, lines) * countTrees(2, 1, lines))
