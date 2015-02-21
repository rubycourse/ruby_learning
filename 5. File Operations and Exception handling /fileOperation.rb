#Define a class which contains some common operations to file
class FileOperator
  OP = { c: "create", d: "delete", r: "read", a: "append" }
  
  def initialize(dir = "./")
    setCurrDir(dir)
  end

  def operate(op, name, *content)
    print_start_info(op, name)

    begin
      file = yield(name, content)
    rescue StandardError => e
      puts e.to_s
    ensure
      close_file(file)
    end
  end

  def new_file(name)
    operate(OP[:c], name) { |name| File.new(name, "w") }
  end

  def delete_file(name)
    operate(OP[:d], name) do |name| 
      File.delete(name)
      nil
    end
  end

  def read_file(name)
    operate(OP[:r], name) { |name| File.open(name, "r") }
  end

  def append_file(content, name)
    operate(OP[:a], name) do |name, content|
      file = File.open(name, "w")
      file.write(content)
      file
    end
  end

  def setCurrDir(dir)
    puts "Input directory: #{dir}"
    Dir.chdir(dir)
    puts "Current Directory is #{Dir.pwd}"
  end

  private
  def close_file(file)
    if file
      file.close
      puts "File is closed"
    else
      puts "File is removed or doens't exist"
    end
  end
  
  def print_start_info(op, fileName)
    puts "Start to #{op} a file named #{fileName}"
  end
end

file1 = "abc.txt"
file2 = "def.txt"
dir1 = "/Users/Guest/"
dir2 = "/Users/rogertong/"

op = FileOperator.new(dir1)

op.new_file(file1)

op.setCurrDir(dir2)
op.new_file(file2)
op.append_file("hahaha", file2)
op.read_file(file2)
op.delete_file(file2)
op.delete_file(file2)
