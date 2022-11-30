close all; clear all; clc;

%load('augm_cracks.mat');
load('C:\Users\alexe\Downloads\Telegram Desktop\Данные для аугментации\Данные для аугментации\Фитопланктон\augm_phyto.mat');
vehicleDataset = Dataset;
[N,M] = size(vehicleDataset);
File = [];
Bbox = [];
for i = 1:1280
    i
    File=[File;string(vehicleDataset.imageFilename{i})];
    Bbox_temp=[vehicleDataset.crack{i}];
    [n,m]=size(Bbox_temp);
    Bbox1=[];
    for j=1:n
        Bbox0=[];
        for k=1:m
        Bbox0 = [Bbox0 ' ' int2str(Bbox_temp(j,k))];
        end
        Bbox1 = [Bbox1 ':' Bbox0];
    end
    Bbox=[Bbox;string(Bbox1)];
end
dbfile = fullfile('.\',"dataphyto.db");
conn = sqlite(dbfile,"create")
tb = table(File,Bbox);

sqlwrite(conn,'phyto',tb);

close(conn);

