using DelimitedFiles

input_file = open("input.txt")
lines = read(input_file, String) |>
    x -> split(x, "\n\n")
numValid = 0

for line in lines
    if count(x -> split(x, ":")[1] != "cid", split(rstrip(replace(line, "\n" => " ")), " ")) == 7
        global numValid += 1
    end
end

println(numValid)
