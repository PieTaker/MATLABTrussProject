loc = 11;
f = @(w) MaxForce(loc,w0);

w0 =1.9;
options = optimset('Display', 'iter');
fminunc(f,w0,options)