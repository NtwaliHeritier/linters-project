module Check
#function checking for extra space
  def check(file_content, array)
    i=0
    for file_line in file_content
        i+=1
        array.push("There is a trailing space at line #{i}") if file_line.split("")[-2]==' '
    end
  end
    
end