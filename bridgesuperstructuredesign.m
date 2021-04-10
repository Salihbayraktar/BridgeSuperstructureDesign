format Long; 
global BetKal DonKal; 
Es=200000; % Donat� elastisite modulu
BarHac=0.24; %Bariyerin 1m uzunlu�unun hacmi
Zd=0.95;
Zr=1.05;
Zi=0.95; %Dayan�m s�n�r durumunda y�k d�zeltme katsay�lar�
Im=0.33; %Darbe �arpan�
% BetKal=input('K�pr�de kullan�lacak beton s�n�f� de�erini giriniz. (Mpa) :');
% DonKal=input('K�pr�de kullan�lacak donat� s�n�f� de�erini giriniz. (Mpa) :');
% cap=input('K�pr�de kullan�lacak donat� �ap� de�erini giriniz. (mm) :');
% Alan=cap^2*pi/4; 
% cap2=input('K�pr�de kullan�lacak da��tma, r�tre ve s�cakl�k de�i�imi i�in kullan�lacak donat� �ap� de�erini giriniz. (mm) :'); 
% Alan2=cap2*cap2*pi/4;
if (DonKal == 220)
fyd = 191;
elseif (DonKal == 420)
fyd = 365;
elseif (DonKal == 500)
fyd = 435;
% else
% fprintf('Hatal� donat� s�n�f� girdiniz. :')
% break
end
if (BetKal == 16)
fcd=11;
fctd=0.9;
Ec=27000;
k1=0.85;
elseif (BetKal == 18)
fcd = 12;
fctd=0.95;
Ec=27500;
k1=0.85;
elseif (BetKal == 20)
fcd=13;
fctd=1;
Ec=28000;
k1=0.85;
elseif (BetKal == 25)
fcd=17;
fctd=1.15;
Ec=30000;
k1=0.85;
elseif (BetKal == 30)
fcd=20;
fctd=1.25;
Ec=32000;
k1=0.82;
elseif (BetKal == 35)
fcd=23;
fctd=1.35;
Ec=33000;
k1=0.79;
elseif (BetKal == 40)
fcd=27;
fctd=1.45;
Ec=34000;
k1=0.76;
elseif (BetKal == 45)
fcd=30;
fctd=1.55;
Ec=36000;
k1=0.73;
elseif (BetKal == 50)
fcd=33;
fctd=1.65;
Ec=37000;
k1=0.7;
%else
%fprintf('Hatal� beton s�n�f� girdiniz. :')
%break
end
%n=Es/Ec;
%W=input('K�pr� �st yap�s�n�n toplam geni�lik de�erini giriniz.(cm) "W" :');
%W=W/100;
%L=input('K�pr� �st yap�s�n�n serbest a��kl�k de�erini giriniz.(cm) "L" :');
%L=L/100;
%b2=input('Tabliye kenar� ile bariyer i� y�z� aras�ndaki mesafeyi giriniz.(cm) :');
%b2=b2/100;
%Eser=input('�erit geni�li�ini giriniz.(cm) :');
%Eser=Eser/100;
%BetYog=input('Betonun yo�unlu�unu giriniz. (kN/m^3) :');
%KapYog=input('Yol kaplamas� yo�unlu�unu giriniz. (kN/m^3) :');
%KapKal=input('Yol kaplamas� kal�nl���n� giriniz. (cm) :');
% DosKal=input('D��eme kal�nl���n� giriniz. (cm) :');
% KorKal=input('Korkuluk kal�nl���n� giriniz. (cm) :');




Ec=32000;
n=Es/Ec;
W=1126;
W=W/100;
L=1100;
L=L/100;
b2=53;
b2=b2/100;
Eser=360;
Eser=Eser/100;
fcd=20;
fyd=365;
BetYog=24;
KapYog=22;
KapKal=7.5;
DosKal=49;
KorKal=24;
cap=24;    %�� ve Kenar �eritlerde kullan�lacak olan donat� �a��
Alan=cap^2*pi/4; 
cap2=14;    %Da��tma, R�tre ve s�cakl�k de�i�imi i�in kullan�lacak donat� �ap�
Alan2=cap2*cap2*pi/4;
k1=0.82;
fctd=1.25;
DosKal=49;
KorKal=24;



%Plak Kal�nl���n�n Se�ilmesi
h=1.2*((L*1000)+3000)/30;
if(mod(h,10)>0)
h=h+(10-mod(h,10));
end
%Hareketli y�k e�de�er �erit geni�li�inin belirlenmesi
%�� �erit geni�li�i
if((L*1000)<18000)
L1=L*1000;
else
L1=18000;
end
if((W*1000)<18000)
W1=W*1000;
else
W1=9000;
end
Eic1=250+(0.42*((W1*L1)^0.5));
%�ok �erit y�klemesi
Nl=(W*1000)/(Eser*1000);
Nl=floor(Nl);
Eic2=2100+(0.12*((W1*L1)^0.5));
Eic3=(W*1000/Nl);
if(Eic1<Eic2 && Eic1<Eic3)
Eic=Eic1;
elseif(Eic2<Eic3)
Eic=Eic2;
else
Eic=Eic3;
end
%Kenar �erit geni�li�i
Ek1=(b2*1000)+300+Eic/2;
if(Ek1<1800)
Ek=Ek1;
else
Ek=1800;
end
% Sabit y�klerin belirlenmesi
DosYuk=(DosKal/100)*BetYog; %D��emenin olu�turdu�u sabit y�k (kN/m^2)
KapYuk=(KapKal/100)*KapYog; %Kaplaman�n olu�turdu�u sabit y�k (kN/m^2)
KorYuk=(KorKal/100)*BetYog; %Korkulu�un olu�turdu�u sabit y�k (kN/m)
% Maksimum momentlerin Belirlenmesi
Kenarolc=(L-8.6)/2; %8.6 Metrelik kamyonun mesnetlerde maksimum momenti olu�turdu�u durum i�in k�pr� kenar�nda olu�an a��kl�k
Fa=(((35*(Kenarolc))+(145*(4.3+Kenarolc))+(145*(8.6+Kenarolc)))/L); % A mesnetindeki kuvvet de�eri (kN),
Fb=325-Fa; % B mesnetindeki kuvvet de�eri (kN)
Mll=((Fa*(L/2))-623.5);   %Kamyon y�klemesi taraf�ndan kesit ortas�nda olu�an maksimum moment (kNm)
Kenarolc2=((L/2)-1.2);
Fa2=((110*(L/2))+(110*((L/2)+1.2)))/L;
Fb2=220-Fa2;
Mll2=((Fa2*(L/2))-132); %Tandem y�klemesi taraf�ndan kesit ortas�nda olu�an maksimum moment (kNm)
Mll3=(9.3*L^2)/8; %�erit y�kten dolay� kesit ortas�nda olu�an maksimum moment (kNm)
if(Mll>Mll2 && Mll>Mll3) %B�y�k moment de�erinin dikkate al�nmas�
M=Mll;
elseif (Mll2>Mll3)
M=Mll2;
else
M=Mll3;
end
Z=Zd*Zr*Zi;
if (Z<0.95)
Z=0.95;
end
%�� �eritlerde tasar�m momentinin hesaplanmas�
Ms=Mll3/(Eic/1000); %1m geni�lik i�in �erit tasar�m momenti (kNm)
Mt=Mll2/(Eic/1000); %1m geni�lik i�in tandem tasar�m momenti (kNm)
Mst=((1+Im)*Mt)+Ms; %�erit ve tandem y�klerinden dolay� olu�an moment toplam� (kNm)
Mdc=(DosYuk*L^2)/8; %K�pr� a��rl��� nedeniyle olu�an moment (kNm)
Mdw=(KapYuk*L^2)/8; %Kaplama a��rl��� nedeniyle olu�an moment (kNm)
Md=Z*((1.25*Mdc)+(1.5*Mdw)+(1.75*Mst)); %Tasar�m momentinin elde edilmesi (i� �erit)(kNm)
%Kenar �eritlerde tasar�m momentinin hesaplanmas�
Z2=1.2; %�oklu bulunma fakt�r�
Ms2=Z2*0.5*Mll3/(Ek/1000); %1m geni�lik i�in �erit tasar�m momenti (kNm)
Mt2=Z2*0.5*Mll2/(Ek/1000); %1m geni�lik i�in tandem tasar�m momenti (kNm)
Mst2=((1+Im)*Mt2)+Ms2; %�erit ve tandem y�klerinden dolay� olu�an moment toplam� (kNm)
Mdc2=((DosYuk+(KorYuk/(Ek/1000)))*(L^2)/8); %K�pr� a��rl��� nedeniyle olu�an moment (kNm)
Mdw2= (KapYuk*(((Ek/1000)-0.53)/(Ek/1000))*L^2)/8; %Kaplama a��rl��� nedeniyle olu�an moment (kNm)
Md2=Z*((1.25*Mdc2)+(1.5*Mdw2)+(1.75*Mst2)); %Tasar�m momentinin elde edilmesi (Kenar �erit)(kNm)
%Betonarme Tasar�m 
%�� �eritte Donat� Hesab�
d=h-25-(cap/2); %Faydal� y�kseklik 
%Gerekli donat� alan�n�n hesaplanmas�
a=-0.85*fcd*1000/2; 
b=0.85*1000*d*fcd; 
c=-Md*(10^6);
delta=(b^2)-(4*a*c);
if(delta<0)
fprintf('Denklem k�kleri reel de�ildir.')
break
end
x1=-(b+(delta^(0.5)))/(2*a);
x2=-(b-(delta^(0.5)))/(2*a);
if(x1>0 && x1<250)
x=x1;
else
x=x2;
end
As=(0.85*fcd*1000*x)/fyd; %Gerekli donat� alan�n�n bulunmas�
s=(1000*Alan)/As;
s=s-mod(s,10);
fprintf('#%d/%d mm aral�kla donat� se�ilmi�tir. \n', cap, s)
%Donat� oran� denetimi
Asy=1000*Alan/s; %Yerle�tirilen donat� alan� mm^2
p=Asy/(1000*d);
if((p)>(0.85*fctd/fyd))
fprintf('Maksimum donat� oran� �art�n� sa�lam��t�r. \n')
else
fprintf('Maksimum donat� oran� �art�n� sa�lamam��t�r. \n')
break
end
if((0.03*fcd/fyd)<(Asy/1000/d))
fprintf('Minimum donat� oran� �art�n� sa�lam��t�r. \n')
else
fprintf('Minimum donat� oran� �art�n� sa�lamam��t�r.')
break
end
%�� �eritte kullan�m s�n�r durumuna g�re �atlak denetimi
Md3=Mdc+Mdw+Mst;
Ft=(Md3*10^6*6)/(1000*h^2); %A��kl�k ortas�nda tabliye kesitinde Ms momenti etkisinde olu�an en b�y�k �ekme gerilmesi 
Fr=0.63*fcd^0.5;
if(Ft>0.8*Fr)
fprintf('Kesit �atlam��t�r. \n')
a3=500;
b3=n*Asy;
c3=-n*Asy*d;
delta2=(b3^2)-(4*a3*c3);
if(delta2<0)
fprintf('Denklem k�kleri reel de�ildir.')
break
end
x3=-(b3+(delta2^(0.5)))/(2*a3);
x4=-(b3-(delta2^(0.5)))/(2*a3);
if(x3>0 && x3<250)
xx=x3;
else
xx=x4;
end
Icr=(1000*(xx^3)/12)+(1000*xx*(xx/2)^2)+(n*Asy*(d-xx)^2); %D�n��t�r�lm�� kesitin atalet momenti (mm^4)
Icr=Icr/10^6;
Fs=n*Md3*(d-xx)/Icr; %Bulunan �atlam�� kesitin atalet momenti kullan�larak �ekme donas�t�nda olu�an �ekme gerilmesi (MPa)
dc=25+(cap/2);
Al=2*dc*s;
Fsa=(23000/((dc*Al)^(1/3)));
if(Fsa>fyd)
Fsa=fyd;
end
if(Fs>Fsa)
fprintf('Donat� aral��� �atlak denetimi bak�m�ndan uygun de�ildir. \n\n')
son=2;
sayi=1;
while sayi<son
s=s-10;
Asy=1000*Alan/s; %Yerle�tirilen donat� alan� mm^2
ay=Asy*fyd/(k1*fcd*1000);
a3=500;
b3=n*Asy;
c3=-n*Asy*d;
delta2=(b3^2)-(4*a3*c3);
if(delta2<0)
fprintf('Denklem k�kleri reel de�ildir.')
break
end
x3=-(b3+(delta2^(0.5)))/(2*a3);
x4=-(b3-(delta2^(0.5)))/(2*a3);
if(x3>0 && x3<250)
xx=x3;
else
xx=x4;
end
Icr=(1000*(xx^3)/12)+(1000*xx*(xx/2)^2)+(n*Asy*(d-xx)^2); %D�n��t�r�lm�� kesitin atalet momenti (mm^4)
Icr=Icr/10^6;
Fs=n*Md3*(d-xx)/Icr; %Bulunan �atlam�� kesitin atalet momenti kullan�larak �ekme donas�t�nda olu�an �ekme gerilmesi (MPa)
dc=25+(cap/2);
Al=2*dc*s;
Fsa=(23000/((dc*Al)^(1/3)));
if(Fs<Fsa)
fprintf('#%d/%d mm aral�kla yeni bir donat� se�ilmi�tir. \n', cap, s)
fprintf('Donat� aral��� �atlak denetimi bak�m�ndan uygundur. \n')
Asy=1000*Alan/s; %Yerle�tirilen donat� alan� mm^2
p=Asy/(1000*d);
if((p)>(0.85*fctd/fyd))
fprintf('(Yeni aral�k) Maksimum donat� oran� �art�n� sa�lam��t�r. \n')
else
fprintf('(Yeni aral�k) Maksimum donat� oran� �art�n� sa�lamam��t�r. \n')
break
end
if((0.03*fcd/fyd)<(Asy/1000/d))
fprintf('(Yeni aral�k) Minimum donat� oran� �art�n� sa�lam��t�r. \n\n')
else
fprintf('(Yeni aral�k) Minimum donat� oran� �art�n� sa�lamam��t�r.\n')
break
end
sayi=son;
end
end
else
fprintf('Donat� aral��� �atlak denetimi bak�m�ndan uygundur. \n\n')
end
else
fprintf('Kesit �atlamam��t�r. \n\n')
end
%Kenar �eritte Donat� Hesab�
a4=0.85*fcd*1000/2;
b4=-0.85*fcd*1000*d;
c4=Md2*10^6;
delta3=(b4^2)-(4*a4*c4);
if(delta3<0)
fprintf('Denklem k�kleri reel de�ildir.')
break
end
x5=-(b4+(delta3^(0.5)))/(2*a4);
x6=-(b4-(delta3^(0.5)))/(2*a4);
if(x5>0 && x5<250)
xx2=x5;
else
xx2=x6;
end
As2=(0.85*fcd*1000*xx2)/fyd; %Gerekli donat� alan�n�n bulunmas�
s2=(1000*Alan)/As2;
s2=s2-mod(s2,10);
fprintf('#%d/%d mm aral�kla donat� se�ilmi�tir. (Kenar �eritte) \n', cap, s2)
%Donat� oran� denetimi
Asy2=1000*Alan/s2; %Yerle�tirilen donat� alan� mm^2
p=Asy2/(1000*d);
if((p)>(0.85*fctd/fyd))
fprintf('Maksimum donat� oran� �art�n� sa�lam��t�r. (Kenar �eritte) \n')
else
fprintf('Maksimum donat� oran� �art�n� sa�lamam��t�r. (Kenar �eritte) \n')
break
end
%Minimum donat� oran� denetimi (Kenar �eritte)
if((Asy2/(1000*d))>0.002)
fprintf('Minimum donat� oran� denetimi sa�lanm��t�r. (Kenar �eritte) \n')
else
fprintf('Minimum donat� oran� denetimi sa�lanmam��t�r. (Kenar �eritte) \n')
end
%Kenar �eritte kullan�m s�n�r durumuna g�re �atlak denetimi
Ms3=Mdc2+Mdw2+Mst2;
Ft2=(Ms3*10^6*6)/(1000*h^2);
if(Ft2>Fr)
fprintf('Kesit �atlam��t�r. (Kenar �eritte) \n')
a3=500;
b3=n*Asy2;
c3=-n*Asy2*d;
delta2=(b3^2)-(4*a3*c3);
if(delta2<0)
fprintf('Denklem k�kleri reel de�ildir.  (Kenar �eritte)')
break
end
x3=-(b3+(delta2^(0.5)))/(2*a3);
x4=-(b3-(delta2^(0.5)))/(2*a3);
if(x3>0 && x3<250)
xx=x3;
else
xx=x4;
end
Icr=(1000*(xx^3)/12)+(1000*xx*(xx/2)^2)+(n*Asy2*(d-xx)^2); %D�n��t�r�lm�� kesitin atalet momenti (mm^4)
Icr=Icr/10^6;
Fs=n*Ms3*(d-xx)/Icr; %Bulunan �atlam�� kesitin atalet momenti kullan�larak �ekme donas�t�nda olu�an �ekme gerilmesi (MPa)
dc=25+(cap/2);
Al=2*dc*s2;
Fsa=(23000/((dc*Al)^(1/3)));
if(Fsa>fyd)
Fsa=fyd;
end
if(Fs>Fsa)
fprintf('Donat� aral��� �atlak denetimi bak�m�ndan uygun de�ildir.  (Kenar �eritte) \n\n')
son=2;
sayi=1;
while sayi<son
s2=s2-10;
Asy2=1000*Alan/s2; %Yerle�tirilen donat� alan� mm^2
ay=Asy2*fyd/(k1*fcd*1000);
a3=500;
b3=n*Asy2;
c3=-n*Asy2*d;
delta2=(b3^2)-(4*a3*c3);
if(delta2<0)
fprintf('Denklem k�kleri reel de�ildir.  (Kenar �eritte)')
break
end
x3=-(b3+(delta2^(0.5)))/(2*a3);
x4=-(b3-(delta2^(0.5)))/(2*a3);
if(x3>0 && x3<250)
xx=x3;
else
xx=x4;
end
Icr=(1000*(xx^3)/12)+(1000*xx*(xx/2)^2)+(n*Asy2*(d-xx)^2); %D�n��t�r�lm�� kesitin atalet momenti (mm^4)
Icr=Icr/10^6;
Fs=n*Ms3*(d-xx)/Icr; %Bulunan �atlam�� kesitin atalet momenti kullan�larak �ekme donas�t�nda olu�an �ekme gerilmesi (MPa)
dc=25+(cap/2);
Al=2*dc*s2;
Fsa=(23000/((dc*Al)^(1/3)));
if(Fs<Fsa)
fprintf('#%d/%d mm aral�kla yeni bir donat� se�ilmi�tir.  (Kenar �eritte) \n', cap, s2)
fprintf('Donat� aral��� �atlak denetimi bak�m�ndan uygundur.  (Kenar �eritte) \n')
Asy2=1000*Alan/s2; %Yerle�tirilen donat� alan� mm^2
p=Asy2/(1000*d);
if((p)>(0.85*fctd/fyd))
fprintf('(Yeni aral�k) Maksimum donat� oran� �art�n� sa�lam��t�r. (Kenar �eritte) \n')
else
fprintf('(Yeni aral�k) Maksimum donat� oran� �art�n� sa�lamam��t�r. (Kenar �eritte) \n')
break
end
if((0.03*fcd/fyd)<(Asy2/1000/d))
fprintf('(Yeni aral�k) Minimum donat� oran� �art�n� sa�lam��t�r. (Kenar �eritte)\n\n')
else
fprintf('(Yeni aral�k) Minimum donat� oran� �art�n� sa�lamam��t�r. (Kenar �eritte)\n')
break
end
sayi=son;
end
end
else
fprintf('Donat� aral��� �atlak denetimi bak�m�ndan uygundur.  (Kenar �eritte) \n\n')
end
else
fprintf('Kesit �atlamam��t�r. (Kenar �eritte)\n\n');
end

%Da��tma donat�lar�n�n belirlenmesi

Dgt=(1750)/((1000*L)^0.5);
if(Dgt>50)
Dgt=50;
end
%�� �eritte da��tma donat�s�
As3=Dgt*Asy/100;
s3=1000*Alan2/As3;
s3=s3-mod(s3,10);
fprintf('#%d/%d mm aral�kla da��tma donat�s� se�ilmi�tir. \n', cap2, s3)

%Kenar �eritte da��tma donat�s�
As4=Dgt*Asy2/100;
s4=1000*Alan2/As4;
s4=s4-mod(s4,10);
fprintf('#%d/%d mm aral�kla da��tma donat�s� se�ilmi�tir. (Kenar �eritte) \n', cap2, s4)

%R�tre ve s�cakl�k de�i�imi donat�s�n�n belirlenmesi
Ash=0.75*1000*h/fyd;
Asht=Ash/2;
s5=1000*Alan2/Asht;
s5=s5-mod(s5,10);
fprintf('#%d/%d mm aral�kla R�tre ve s�cakl�k de�i�imi donat�s� se�ilmi�tir. (Enine Do�rultuda) \n', cap2, s5)
Ashl=2*Asht/3;
s6=1000*Alan2/Ashl;
s6=s6-mod(s6,10);
fprintf('#%d/%d mm aral�kla R�tre ve s�cakl�k de�i�imi donat�s� se�ilmi�tir. (Boyuna Do�rultuda) \n', cap2, s6)
