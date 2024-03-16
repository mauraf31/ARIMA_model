%Dem4e.m
 clear all
 close all force
 disp('Apple Stocks')
lw = 2.5; 
 set(0, 'DefaultAxesFontSize', 16);
 fs = 15;
 msize = 10;
 %-------------------------------------------------------------------------------------------

filt = [ -0.07576571478934  -0.02963552764595  ...
          0.49761866763246   0.80373875180522  ...
          0.29785779560554  -0.09921954357694  ...
         -0.01260396726226   0.03222310060407]; 

apple = readtable("C:\Users\saraa\Downloads\AAPL.csv");  
adjClose = apple{:, 6}; 
t=1000;  %t is between 0 and 1865
timerange1=fix(1+t):fix(2048+t); 
timerange2=fix(8420):fix(10468); %taking 2048 from end of the data
timerange3=fix(5234):fix(7282); 
sigc = adjClose(timerange1);
sigc2 = adjClose(timerange2);
sigc3 = adjClose(timerange3);
figure(1);
plot(sigc); 
figure(2);
plot(sigc2);
figure(3);
plot(sigc3);
hold on
%ang=0:0.005:2*pi;  
%r2=0.3;
%r1=220;
%xp=r1*cos(ang);
%yp=r2*sin(ang); 
%x=2035-t; y=0.2;
%plot(x+xp,y+yp,'r-','linewidth',2);

%plot(x+xp,y+yp,'r-','linewidth',1);
%axis tight
%print -depsc 'C:\Brani\Talks\Figs\Dem4e1.eps'
figure(4)
%function [slope, levels, log2spec ] = waveletspectra(data, L, wf, k1, k2, ismean,isplot)
waveletspectra(sigc,1,filt,1,10)
figure(5)
waveletspectra(sigc2,1,filt,1,10)
figure(6)
%function [slope, levels, log2spec ] = waveletspectra(data, L, wf, k1, k2, ismean,isplot)
waveletspectra(sigc3,1,filt,1,10)


