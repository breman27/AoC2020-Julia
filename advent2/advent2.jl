input_file = open("C:\\Julia workspace\\advent2\\input.txt")
lines = readlines(input_file)
valid_count = 0

for rule in lines
    parsed = split(rule, r":|-| ")
    occurences = sum([1 for i = eachmatch(Regex(parsed[3]), parsed[end])])
    if parse(Int64, parsed[2]) >= occurences && parse(Int64, parsed[1]) <= occurences
        global valid_count += 1
    end
end

println(valid_count)
valid_count = 0

for rule in lines
    parsed = split(rule, r":|-| ")
    if xor(string(parsed[end][parse(Int64, parsed[1])]) == parsed[3], string(parsed[end][parse(Int64, parsed[2])]) == parsed[3])
        global valid_count += 1
    end
end

println(valid_count)
