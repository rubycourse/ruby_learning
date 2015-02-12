# Used to practice class and module's usage
module GetInfo

  def getInfo
    print "This is a person.\n"
  end

end

class Person

  def initialize(name, age)
    @name=name
    @age=age
  end

  def swim()
    doSth "swimming"
  end

  def playBasketball()
    doSth "playing basketball"
  end

  private
  def doSth(what)
    print "#{@name} is #{what}.\n"
  end

end

class Student < Person
  include GetInfo
  def study
    doSth "studying"
  end
end

stu = Student.new("Tom", 12)
stu.getInfo
stu.study
stu.doSth("Playing poker")
