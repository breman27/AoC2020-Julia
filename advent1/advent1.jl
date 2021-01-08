input_file = open("input.txt")
lines = readlines(input_file)

for i = lines, j = lines
    if parse(Int64, i) + parse(Int64, j) == 2020
        println(parse(Int64, i) * parse(Int64, j))
        break
    end
end
