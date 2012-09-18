module UsersHelper
def snippet(thought)

wordcount = 3

thought.split[0..(wordcount-1)].join(" ") + (thought.split.size > wordcount ? "..." : "")

end 
def msnippet(thought)

wordcount = 1

thought.split[0..(wordcount-1)].join(" ") + (thought.split.size > wordcount ? "..." : "")

end 
def tsnippet(thought)

wordcount = 5

thought.split[0..(wordcount-1)].join(" ") + (thought.split.size > wordcount ? "" : "")

end 

def check_photo
 if  (@ext == "png" || @ext == "jpg") || (@ext == "jpeg" || @ext == "gif")
    return true;
 else
    return false; 
 end
end
end
