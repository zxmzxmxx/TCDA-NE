function [gnd,obj]=dynamicnmf2(GT_Cube,W_Cube,maxiter,alpha)
timenum=numel(GT_Cube); 
W1=W_Cube{1};
k=size(GT_Cube{1},2);
[F{1},G{1}]=nnmf(W1,k); %First randomly factorize once W1
G{1}=G{1}';
obj1 = cell(10,1);   %Iterative convergence variable
obj = [];
obj=cat(2,obj,obj1{1});
for t=2:timenum      
    kt=size(GT_Cube{t},2);
    St = intialW_Cube(W_Cube,5);  %Calculate the proximity matrix
    %time0 = cputime;
    [F{t},G{t},obj]=dmf(F{t-1},St{t-1},St{t},kt,maxiter,alpha,t,obj); %iterative updating
    %time = time + cputime - time0;
end
for t=1:timenum
    [gnd_value(:,t),gnd(:,t)]=max(G{t}');
end

end

function [Ft,Gt,obj]=dmf(Ft_1,At_1,At,k,maxiter,alpha,t,obj)
[n,m]=size(At);
Ft = abs(rand(n,k));  
Gt = abs(rand(n,k));

for i = 1:maxiter  
        Ftt = Ft_1;
         Ft = Ft .* (At'* (At * Gt)) ./ ((At'* (At * Ft) * (Gt' * Gt))+eps);       %Iterative formulas, consistent with those in the paper
        G1 = At'* (At * Ft) + alpha * At_1'* (At_1 * Ft_1);
        G2 = Gt * Ft'* At'* (At * Ft) + alpha * Gt * Ft_1'* At_1'* At_1 * Ft_1;
         Gt = Gt .* G1 ./(G2+eps);
        
        item1 = norm(At-At*Ft*Gt','fro')^2;  
        item2 = norm(At_1-At_1*Ftt*Gt','fro')^2;  
        obj(i,t) = item1 + item2;   %Calculate obj and check if the function converges
        
end  
end
