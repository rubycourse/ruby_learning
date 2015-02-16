#Define a class which contains some common operations to file
class FileOperator

  OP = { "C" => "create",
    "D" => "delete",
    "R" => "read",
    "A" => "append" }

  def new_file(name, path = "./")
    print_start_info(OP["C"], name, path)

    begin
      file = File.new(path + name, "w")
    rescue StandardError => e
      puts e.to_s
    ensure
      close_file(file)
    end
  end

  def delete_file(name, path = "./")
    print_start_info(OP["D"], name, path)

    begin
      File.delete(path + name)
      puts "File #{name} is deleted successfully."
    rescue StandardError => e
      puts e.to_s
    end
  end

  def read_file(name, path = "./")
    print_start_info(OP["R"], name, path)

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
    print_start_info(OP["A"], name, path)

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

op = FileOperator.new
op.new_file("abc.txt", "/Users/rogertong/")
op.delete_file("abc.txt", "/Users/rogertong/")
op.new_file("def.txt")
op.append_file("hahaha", "def.txt")
op.read_file("def.txt")
op.delete_file("abc.txt")

