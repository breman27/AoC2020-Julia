input_file = open("C:\\Julia workspace\\input.txt")
lines = readlines(input_file)

for i = lines, j = lines, z = lines
    if parse(Int64, i) + parse(Int64, j) + parse(Int64, z) == 2020
        @show(parse(Int64, i) * parse(Int64, j) * parse(Int64, z))
        break
    end
end
