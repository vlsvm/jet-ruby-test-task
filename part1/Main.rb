require_relative 'Package.rb'

puts("input weight:");
weight = gets().to_f;
puts("input length:");
length = gets().to_f;
puts("input width:");
width = gets().to_f;
puts("input height:");
height = gets().to_f;
puts("input starting point name");
start = gets().chomp;
puts("input destination point name");
destination = gets().chomp;
package = Package.new(weight,length,width,height,start,destination);

p package.hash;
gets