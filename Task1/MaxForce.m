
f =@(F) TestBridge(F);

maxf = bisection(f, 40000, 80000,50)

TestBridgePlot(maxf);


