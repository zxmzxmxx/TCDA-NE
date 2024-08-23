function [afterW_Cube] = intialW_Cube(W_Cube,eta)

    timeStep = size(W_Cube,2);  % 测量时间片数
    for t=1:timeStep

        A = W_Cube{t};
        s1 = A; % 根据论文中的描述，s1就是原始矩阵

        % s2 = dot(Ni,Nj)/(norm(Ni,1)*norm(Nj,1))
        % Ni = (s1[i,1],s1[i,2]......s1[i,n])
        nodeNum = size(A,1);   % 数组行数，其实就是点数，因为A就是点数*点数的矩阵
        s2 = zeros(nodeNum);
        for i=1:nodeNum
            for j=1:nodeNum
                Ni = A(i,:);
                Nj = A(j,:);
                % 点积 点乘是将向量的元素对应相乘后，加起来 语法：dot(x1,x2)
                s2(i,j) = dot(Ni,Nj)/((norm(Ni,1)*norm(Nj,1))+eps);
            end
        end
        s = s1+eta*s2;
        afterW_Cube{t} = s;
    end
end