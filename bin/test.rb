# frozen_string_literal: true
# a="""

# """
# puts a.match?(/\w/)

file=File.read("../file.cpp")

def test(a)
    a=a.split("\n")
    key=%w[function if for while main]
    i=0
    while i<a.size
        for j in key
            if a[i].include?(j)
                k=a[i].split("")
                l=i
                loop do
                    l+=1
                    break if a[l].include?("}")
                    m=a[l].split("")
                    unless count(k)<count(m)
                        puts "indentation error"
                    end
                end
            end
        end
        i+=1
    end
end

    def count(p)
        s=0
     for i in p
        if i.match?(/\s/)
            s+=1
        end
     end
     s
    end

test(file)