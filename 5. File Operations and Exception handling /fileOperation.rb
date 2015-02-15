#Define a class which contains some common operations to file
class FileOperator

def newFile (name, path="./")
  begin
    puts "Start to create a file..."
    file = File.new(name, "w")
  rescue StandardError => e
    puts e.to_s
  ensure
    puts "File is closed"
    file.close
  end
end

def deleteFile(name, path="./")
  begin
    puts "Start to delete a file..."
    File.delete(path+name)
    puts "File is deleted successfully."
  rescue StandardError => e
    puts e.to_s
  end
end

def readFile(name, path="./")
  begin
    puts "Start to read a file..."
    file = File.open(path+name, "r")
    file.readlines
  rescue StandarError => e
    puts e.to_s
  ensure
    puts "File is closed"
    file.close
  end
end

def appendFile(content, name, path="./")
  begin
    puts "Start to append something..."
    file = File.open(path+name, "w")
    file.write(content)
  rescue StandardError => e
    puts e.to_s
  ensure
    puts "File is closed"
    file.close
  end
end

end

op = FileOperator.new
op.newFile("abc.txt")
op.deleteFile("abc.txt")
op.newFile("def.txt")
op.appendFile("hahaha", "def.txt")
op.readFile("def.txt")
op.deleteFile("abc.txt")
