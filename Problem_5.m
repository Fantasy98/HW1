C = load("hw1Q5C.dat");
b = load("hw1Q5b.dat");
%%
x = zeros(100,1);
cvx_begin;
    variable x(100); 
    minimize( norm(x,1) ); 
    subject to 
         C*x == b;
cvx_end;
%%
x_sort = abs(x) <=1e-1;
n = 1;
for i = 1:length(x_sort)
        
        if x_sort(i,:) == 0
            index(n) = i;
            n = n +1 ;
        end

end