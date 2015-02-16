#Define a class which contains some common operations to file
class FileOperator

  OP = { c: "create",
    d: "delete",
    r: "read",
    a: "append" }

  def new_file(name, path = "./")
    print_start_info(OP[:c], name, path)

    begin
      file = File.new(path + name, "w")
    rescue StandardError => e
      puts e.to_s
    ensure
      close_file(file)
    end
  end

  def delete_file(name, path = "./")
    print_start_info(OP[:d], name, path)

    begin
      File.delete(path + name)
      puts "File #{name} is deleted successfully."
    rescue StandardError => e
      puts e.to_s
    end
  end

  def read_file(name, path = "./")
    print_start_info(OP[:r], name, path)

    begin
      file = File.open(path + name, "r")
      file.readlines
    rescue StandarError => e
      puts e.to_s
    ensure
      close_file(file)
    end
  end

  def append_file(content, name, path = "./")
    print_start_info(OP[:a], name, path)

    begin
      file = File.open(path + name, "w")
      file.write(content)
    rescue StandardError => e
      puts e.to_s
    ensure
      close_file(file)
    end
  end

  private
  def close_file(file)
    if file
      file.close
      puts "Files is closed"
    end
  end
  
  def print_start_info(op, fileName, path)
    puts "Start to #{op} a file named #{fileName} under #{path}"
  end
end

file1 = "abc.txt"
file2 = "def.txt"
path = "/Users/rogertong/"

op = FileOperator.new

op.new_file(file1, path)
op.delete_file(file1, path)

op.new_file(file2)
op.append_file("hahaha", file2)
op.read_file(file2)
op.delete_file(file2)
op.delete_file(file2)
