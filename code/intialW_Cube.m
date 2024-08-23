function [afterW_Cube] = intialW_Cube(W_Cube,eta)

    timeStep = size(W_Cube,2);  % ����ʱ��Ƭ��
    for t=1:timeStep

        A = W_Cube{t};
        s1 = A; % ���������е�������s1����ԭʼ����

        % s2 = dot(Ni,Nj)/(norm(Ni,1)*norm(Nj,1))
        % Ni = (s1[i,1],s1[i,2]......s1[i,n])
        nodeNum = size(A,1);   % ������������ʵ���ǵ�������ΪA���ǵ���*�����ľ���
        s2 = zeros(nodeNum);
        for i=1:nodeNum
            for j=1:nodeNum
                Ni = A(i,:);
                Nj = A(j,:);
                % ��� ����ǽ�������Ԫ�ض�Ӧ��˺󣬼����� �﷨��dot(x1,x2)
                s2(i,j) = dot(Ni,Nj)/((norm(Ni,1)*norm(Nj,1))+eps);
            end
        end
        s = s1+eta*s2;
        afterW_Cube{t} = s;
    end
end