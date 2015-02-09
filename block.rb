def convert (input, n, &block)
  result = input[0]
  (1..n).each do |i|
    *input=input[1]
    break unless input[0]
    result=*result,input[0]
    block.call(input,result)
  end
end

convert([34,[24,[56,[24,[76]]]]], 5) do |a, b|
  puts "current input: #{a}, result: #{b}"
end
