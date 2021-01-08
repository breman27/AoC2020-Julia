function readFile()
    input_file = open("input.txt")
    lines =
        read(input_file, String) |>
        x -> split(x, "\n\n") |> y -> rstrip.(replace.(y, "\n" => " "))
    lines
end

function part1(lines)::Int64
    numValid = 0

    for line in lines
        if count(x -> split(x, ":")[1] != "cid", split(line, " ")) == 7
            numValid += 1
        end
    end
    numValid
end

function part2(lines)
    numValid = 0
    fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
    for line in split.(lines, " ")
        c = 0
        if count(x -> x[1] != "cid", split.(line, ":")) == 7
            for field in split.(line, ":")
                if field[1] == fields[1]
                    if verifyBYR(string(field[2]))
                        c += 1
                    end
                elseif field[1] == fields[2]
                    if verifyIYR(string(field[2]))
                        c += 1
                    end
                elseif field[1] == fields[3]
                    if verifyEYR(string(field[2]))
                        c += 1
                    end
                elseif field[1] == fields[4]
                    if verifyHGT(string(field[2]))
                        c += 1
                    end
                elseif field[1] == fields[5]
                    if verifyHCL(string(field[2]))
                        c += 1
                    end
                elseif field[1] == fields[6]
                    if verifyECL(string(field[2]))
                        c += 1
                    end
                elseif field[1] == fields[7]
                    if verifyPID(string(field[2]))
                        c += 1
                    end
                else
                    continue
                end
            end
            if c == 7
                @show line
                numValid += 1
            end
        end
    end
    numValid
end

function verifyBYR(byr::String)::Bool
    1920 <= parse(Int64, byr) <= 2002
end

function verifyIYR(iyr::String)::Bool
    2010 <= parse(Int64, iyr) <= 2020
end

function verifyEYR(eyr::String)::Bool
    2020 <= parse(Int64, eyr) <= 2030
end

function verifyHGT(hgt::String)::Bool
    if endswith(hgt, "cm")
        if (150 <= parse(Int64, hgt[1:end-2]) <= 193)
            true
        else
            false
        end
    elseif endswith(hgt, "in")
        if (59 <= parse(Int64, hgt[1:end-2]) <= 76)
            true
        else
            false
        end
    else
        false
    end
end

function verifyHCL(hcl::String)::Bool
    match(r"#[0-9a-f]{6}", hcl) != nothing
end

function verifyECL(ecl::String)::Bool
    if (
        ecl == "amb" ||
        ecl == "blu" ||
        ecl == "brn" ||
        ecl == "gry" ||
        ecl == "grn" ||
        ecl == "hzl" ||
        ecl == "oth"
    )
        true
    else
        false
    end
end

function verifyPID(pid::String)::Bool
    (length(pid) == 9)
end

println(part2(readFile()))
