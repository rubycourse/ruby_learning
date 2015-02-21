#Define a class which contains some common operations to file
require 'pry'

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
    operate(OP[:c], name) { |file_name| File.new(file_name, "w") }
  end

  def delete_file(name)
    operate(OP[:d], name) do |file_name| 
      File.delete(file_name)
      nil
    end
  end

  def read_file(name)
    operate(OP[:r], name) { |file_name| File.open(file_name, "r") }
  end

  def append_file(content, name)
    operate(OP[:a], name) do |file_name, content|
      file = File.open(file_name, "w")
      file.write(content)
      file
    end
  end

  def setCurrDir(dir)
    puts "Input directory: #{dir}"
    Dir.chdir(dir)
  end

  def currDir
    puts "Current directory is #{Dir.pwd}"
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

FileOperator.pry

op.setCurrDir(dir2)
op.new_file(file2)
op.append_file("hahaha", file2)
op.read_file(file2)
op.delete_file(file2)
op.delete_file(file2)
