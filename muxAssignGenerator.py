# typing is no fun, for loops are better

for i in range(32):
  print "  assign mux[{}] = input{};".format(i, i)

print "\n"
for i in range(32):
  print "input{},".format(i),
print ""
