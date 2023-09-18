clear;clc;   
fl=dir('C:\Users\30743\Desktop\社团检测\干活\画图\画图\matlab代码\实验数据集\LFR-data10\');   %Folder path to the experimental dataset
[foldname]=readfile(fl);
nl=length(foldname); 
for k=1:nl %Read one of the datasets
    disp(k)
    aa='C:\Users\30743\Desktop\社团检测\干活\画图\画图\matlab代码\实验数据集\LFR-data10\';
    str=strcat(aa,foldname{k});
    load(str);  %Load data
    %TCDA-NE
    T=length(W_Cube);  %Number of timesteps
    K=size(GT_Cube{1},2);  %Number of communities
    maxiter=100;   %Maximum number of iterations
    for alpha = 0.1:0.1:1
        %for i=1:1:10
        for i=1:20   %Number of repeated runs
            disp TCDA_NE·
            disp(i)
            [TTNMF_G{k}{i},obj{k}{i}] =dynamicnmf2(GT_Cube,W_Cube,maxiter,alpha);   
            [CA10{k}(:,i), CR10{k}(:,i), CP10{k}(:,i), CF10{k}(:,i), CNMI10{k}(:,i)] = computePerformance(TTNMF_G{k}{i},GT_Cube); %Computational performance metrics
        end
        savename=strcat('C:\Users\30743\Desktop\社团检测\画图\中文期刊\LFR\new-LFR3-',num2str(alpha));  %Path to save experimental results
        save(strcat(savename,'.mat'));
    end
end