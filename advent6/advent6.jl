using StatsBase

function readFile()
    input_file = open("input.txt")
    lines =
        read(input_file, String) |>
        x -> split(x, "\n\n") |> y -> rstrip.(replace.(y, "\n" => " "))
    lines
end

function part1(lines)
    sum(map(line -> length(line), countmap.([c for c in replace.(lines, " " => "")])))
end

function part2(lines)
    total = 0
    for line in lines
        numPeople = length(split(line))
        total += count(i -> (i == numPeople),values(countmap([c for c in line])))
    end
    total
end

println(part1(readFile()))
println(part2(readFile()))
