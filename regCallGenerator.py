# typing is no fun, for loops are better

for i in range(32):
  print "  register32 reg{} (allregs[{}], WriteData, write[{}], Clk);".format(i, i, i)

print "\n"

for i in range(32):
  print "allregs[{}],".format(i),
print ""
