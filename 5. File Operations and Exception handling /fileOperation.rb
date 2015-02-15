#Define a class which contains some common operations to file
class FileOperator

  CREATE="create"
  DELETE="delete"
  READ="read"
  APPEND="append"

  def newFile(name, path="./")
    printStartInfo(CREATE, name)
    begin
      file = File.new(name, "w")
    rescue StandardError => e
      puts e.to_s
    ensure
      closeFile(file)
    end
  end

  def deleteFile(name, path="./")
    printStartInfo(DELETE, name)
    begin
      File.delete(path+name)
      puts "File is deleted successfully."
    rescue StandardError => e
      puts e.to_s
    end
  end

  def readFile(name, path="./")
    printStartInfo(READ, name)
    begin
      file = File.open(path+name, "r")
      file.readlines
    rescue StandarError => e
      puts e.to_s
    ensure
      closeFile(file)
    end
  end

  def appendFile(content, name, path="./")
    printStartInfo(APPEND, name)
    begin
      file = File.open(path+name, "w")
      file.write(content)
    rescue StandardError => e
      puts e.to_s
    ensure
      closeFile(file)
    end
  end

  private
  def closeFile(file)
    file.close
    puts "Files is closed"
  end
  
  def printStartInfo(op, fileName)
    puts "Start to #{op} a file named #{fileName}"
  end
end

op = FileOperator.new
op.newFile("abc.txt")
op.deleteFile("abc.txt")
op.newFile("def.txt")
op.appendFile("hahaha", "def.txt")
op.readFile("def.txt")
op.deleteFile("abc.txt")
