module ProjectsHelper
def snippet(thought)

wordcount = 3

thought.split[0..(wordcount-1)].join(" ") + (thought.split.size > wordcount ? ".." : "")

end 
def ksnippet(thought)

truncate(thought, :length => 70)

end 

end
