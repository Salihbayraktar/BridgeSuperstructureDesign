format Long; 
global BetKal DonKal; 
Es=200000; % Donatý elastisite modulu
BarHac=0.24; %Bariyerin 1m uzunluðunun hacmi
Zd=0.95;
Zr=1.05;
Zi=0.95; %Dayaným sýnýr durumunda yük düzeltme katsayýlarý
Im=0.33; %Darbe çarpaný
% BetKal=input('Köprüde kullanýlacak beton sýnýfý deðerini giriniz. (Mpa) :');
% DonKal=input('Köprüde kullanýlacak donatý sýnýfý deðerini giriniz. (Mpa) :');
% cap=input('Köprüde kullanýlacak donatý çapý deðerini giriniz. (mm) :');
% Alan=cap^2*pi/4; 
% cap2=input('Köprüde kullanýlacak daðýtma, rötre ve sýcaklýk deðiþimi için kullanýlacak donatý çapý deðerini giriniz. (mm) :'); 
% Alan2=cap2*cap2*pi/4;
if (DonKal == 220)
fyd = 191;
elseif (DonKal == 420)
fyd = 365;
elseif (DonKal == 500)
fyd = 435;
% else
% fprintf('Hatalý donatý sýnýfý girdiniz. :')
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
%fprintf('Hatalý beton sýnýfý girdiniz. :')
%break
end
%n=Es/Ec;
%W=input('Köprü üst yapýsýnýn toplam geniþlik deðerini giriniz.(cm) "W" :');
%W=W/100;
%L=input('Köprü üst yapýsýnýn serbest açýklýk deðerini giriniz.(cm) "L" :');
%L=L/100;
%b2=input('Tabliye kenarý ile bariyer iç yüzü arasýndaki mesafeyi giriniz.(cm) :');
%b2=b2/100;
%Eser=input('Þerit geniþliðini giriniz.(cm) :');
%Eser=Eser/100;
%BetYog=input('Betonun yoðunluðunu giriniz. (kN/m^3) :');
%KapYog=input('Yol kaplamasý yoðunluðunu giriniz. (kN/m^3) :');
%KapKal=input('Yol kaplamasý kalýnlýðýný giriniz. (cm) :');
% DosKal=input('Döþeme kalýnlýðýný giriniz. (cm) :');
% KorKal=input('Korkuluk kalýnlýðýný giriniz. (cm) :');




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
cap=24;    %Ýç ve Kenar þeritlerde kullanýlacak olan donatý çaðý
Alan=cap^2*pi/4; 
cap2=14;    %Daðýtma, Rötre ve sýcaklýk deðiþimi için kullanýlacak donatý çapý
Alan2=cap2*cap2*pi/4;
k1=0.82;
fctd=1.25;
DosKal=49;
KorKal=24;



%Plak Kalýnlýðýnýn Seçilmesi
h=1.2*((L*1000)+3000)/30;
if(mod(h,10)>0)
h=h+(10-mod(h,10));
end
%Hareketli yük eþdeðer þerit geniþliðinin belirlenmesi
%Ýç þerit geniþliði
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
%Çok þerit yüklemesi
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
%Kenar þerit geniþliði
Ek1=(b2*1000)+300+Eic/2;
if(Ek1<1800)
Ek=Ek1;
else
Ek=1800;
end
% Sabit yüklerin belirlenmesi
DosYuk=(DosKal/100)*BetYog; %Döþemenin oluþturduðu sabit yük (kN/m^2)
KapYuk=(KapKal/100)*KapYog; %Kaplamanýn oluþturduðu sabit yük (kN/m^2)
KorYuk=(KorKal/100)*BetYog; %Korkuluðun oluþturduðu sabit yük (kN/m)
% Maksimum momentlerin Belirlenmesi
Kenarolc=(L-8.6)/2; %8.6 Metrelik kamyonun mesnetlerde maksimum momenti oluþturduðu durum için köprü kenarýnda oluþan açýklýk
Fa=(((35*(Kenarolc))+(145*(4.3+Kenarolc))+(145*(8.6+Kenarolc)))/L); % A mesnetindeki kuvvet deðeri (kN),
Fb=325-Fa; % B mesnetindeki kuvvet deðeri (kN)
Mll=((Fa*(L/2))-623.5);   %Kamyon yüklemesi tarafýndan kesit ortasýnda oluþan maksimum moment (kNm)
Kenarolc2=((L/2)-1.2);
Fa2=((110*(L/2))+(110*((L/2)+1.2)))/L;
Fb2=220-Fa2;
Mll2=((Fa2*(L/2))-132); %Tandem yüklemesi tarafýndan kesit ortasýnda oluþan maksimum moment (kNm)
Mll3=(9.3*L^2)/8; %Þerit yükten dolayý kesit ortasýnda oluþan maksimum moment (kNm)
if(Mll>Mll2 && Mll>Mll3) %Büyük moment deðerinin dikkate alýnmasý
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
%Ýç þeritlerde tasarým momentinin hesaplanmasý
Ms=Mll3/(Eic/1000); %1m geniþlik için þerit tasarým momenti (kNm)
Mt=Mll2/(Eic/1000); %1m geniþlik için tandem tasarým momenti (kNm)
Mst=((1+Im)*Mt)+Ms; %Þerit ve tandem yüklerinden dolayý oluþan moment toplamý (kNm)
Mdc=(DosYuk*L^2)/8; %Köprü aðýrlýðý nedeniyle oluþan moment (kNm)
Mdw=(KapYuk*L^2)/8; %Kaplama aðýrlýðý nedeniyle oluþan moment (kNm)
Md=Z*((1.25*Mdc)+(1.5*Mdw)+(1.75*Mst)); %Tasarým momentinin elde edilmesi (iç Þerit)(kNm)
%Kenar þeritlerde tasarým momentinin hesaplanmasý
Z2=1.2; %Çoklu bulunma faktörü
Ms2=Z2*0.5*Mll3/(Ek/1000); %1m geniþlik için þerit tasarým momenti (kNm)
Mt2=Z2*0.5*Mll2/(Ek/1000); %1m geniþlik için tandem tasarým momenti (kNm)
Mst2=((1+Im)*Mt2)+Ms2; %Þerit ve tandem yüklerinden dolayý oluþan moment toplamý (kNm)
Mdc2=((DosYuk+(KorYuk/(Ek/1000)))*(L^2)/8); %Köprü aðýrlýðý nedeniyle oluþan moment (kNm)
Mdw2= (KapYuk*(((Ek/1000)-0.53)/(Ek/1000))*L^2)/8; %Kaplama aðýrlýðý nedeniyle oluþan moment (kNm)
Md2=Z*((1.25*Mdc2)+(1.5*Mdw2)+(1.75*Mst2)); %Tasarým momentinin elde edilmesi (Kenar þerit)(kNm)
%Betonarme Tasarým 
%Ýç Þeritte Donatý Hesabý
d=h-25-(cap/2); %Faydalý yükseklik 
%Gerekli donatý alanýnýn hesaplanmasý
a=-0.85*fcd*1000/2; 
b=0.85*1000*d*fcd; 
c=-Md*(10^6);
delta=(b^2)-(4*a*c);
if(delta<0)
fprintf('Denklem kökleri reel deðildir.')
break
end
x1=-(b+(delta^(0.5)))/(2*a);
x2=-(b-(delta^(0.5)))/(2*a);
if(x1>0 && x1<250)
x=x1;
else
x=x2;
end
As=(0.85*fcd*1000*x)/fyd; %Gerekli donatý alanýnýn bulunmasý
s=(1000*Alan)/As;
s=s-mod(s,10);
fprintf('#%d/%d mm aralýkla donatý seçilmiþtir. \n', cap, s)
%Donatý oraný denetimi
Asy=1000*Alan/s; %Yerleþtirilen donatý alaný mm^2
p=Asy/(1000*d);
if((p)>(0.85*fctd/fyd))
fprintf('Maksimum donatý oraný þartýný saðlamýþtýr. \n')
else
fprintf('Maksimum donatý oraný þartýný saðlamamýþtýr. \n')
break
end
if((0.03*fcd/fyd)<(Asy/1000/d))
fprintf('Minimum donatý oraný þartýný saðlamýþtýr. \n')
else
fprintf('Minimum donatý oraný þartýný saðlamamýþtýr.')
break
end
%Ýç þeritte kullaným sýnýr durumuna göre çatlak denetimi
Md3=Mdc+Mdw+Mst;
Ft=(Md3*10^6*6)/(1000*h^2); %Açýklýk ortasýnda tabliye kesitinde Ms momenti etkisinde oluþan en büyük çekme gerilmesi 
Fr=0.63*fcd^0.5;
if(Ft>0.8*Fr)
fprintf('Kesit çatlamýþtýr. \n')
a3=500;
b3=n*Asy;
c3=-n*Asy*d;
delta2=(b3^2)-(4*a3*c3);
if(delta2<0)
fprintf('Denklem kökleri reel deðildir.')
break
end
x3=-(b3+(delta2^(0.5)))/(2*a3);
x4=-(b3-(delta2^(0.5)))/(2*a3);
if(x3>0 && x3<250)
xx=x3;
else
xx=x4;
end
Icr=(1000*(xx^3)/12)+(1000*xx*(xx/2)^2)+(n*Asy*(d-xx)^2); %Dönüþtürülmüþ kesitin atalet momenti (mm^4)
Icr=Icr/10^6;
Fs=n*Md3*(d-xx)/Icr; %Bulunan çatlamýþ kesitin atalet momenti kullanýlarak çekme donasýtýnda oluþan çekme gerilmesi (MPa)
dc=25+(cap/2);
Al=2*dc*s;
Fsa=(23000/((dc*Al)^(1/3)));
if(Fsa>fyd)
Fsa=fyd;
end
if(Fs>Fsa)
fprintf('Donatý aralýðý çatlak denetimi bakýmýndan uygun deðildir. \n\n')
son=2;
sayi=1;
while sayi<son
s=s-10;
Asy=1000*Alan/s; %Yerleþtirilen donatý alaný mm^2
ay=Asy*fyd/(k1*fcd*1000);
a3=500;
b3=n*Asy;
c3=-n*Asy*d;
delta2=(b3^2)-(4*a3*c3);
if(delta2<0)
fprintf('Denklem kökleri reel deðildir.')
break
end
x3=-(b3+(delta2^(0.5)))/(2*a3);
x4=-(b3-(delta2^(0.5)))/(2*a3);
if(x3>0 && x3<250)
xx=x3;
else
xx=x4;
end
Icr=(1000*(xx^3)/12)+(1000*xx*(xx/2)^2)+(n*Asy*(d-xx)^2); %Dönüþtürülmüþ kesitin atalet momenti (mm^4)
Icr=Icr/10^6;
Fs=n*Md3*(d-xx)/Icr; %Bulunan çatlamýþ kesitin atalet momenti kullanýlarak çekme donasýtýnda oluþan çekme gerilmesi (MPa)
dc=25+(cap/2);
Al=2*dc*s;
Fsa=(23000/((dc*Al)^(1/3)));
if(Fs<Fsa)
fprintf('#%d/%d mm aralýkla yeni bir donatý seçilmiþtir. \n', cap, s)
fprintf('Donatý aralýðý çatlak denetimi bakýmýndan uygundur. \n')
Asy=1000*Alan/s; %Yerleþtirilen donatý alaný mm^2
p=Asy/(1000*d);
if((p)>(0.85*fctd/fyd))
fprintf('(Yeni aralýk) Maksimum donatý oraný þartýný saðlamýþtýr. \n')
else
fprintf('(Yeni aralýk) Maksimum donatý oraný þartýný saðlamamýþtýr. \n')
break
end
if((0.03*fcd/fyd)<(Asy/1000/d))
fprintf('(Yeni aralýk) Minimum donatý oraný þartýný saðlamýþtýr. \n\n')
else
fprintf('(Yeni aralýk) Minimum donatý oraný þartýný saðlamamýþtýr.\n')
break
end
sayi=son;
end
end
else
fprintf('Donatý aralýðý çatlak denetimi bakýmýndan uygundur. \n\n')
end
else
fprintf('Kesit çatlamamýþtýr. \n\n')
end
%Kenar Þeritte Donatý Hesabý
a4=0.85*fcd*1000/2;
b4=-0.85*fcd*1000*d;
c4=Md2*10^6;
delta3=(b4^2)-(4*a4*c4);
if(delta3<0)
fprintf('Denklem kökleri reel deðildir.')
break
end
x5=-(b4+(delta3^(0.5)))/(2*a4);
x6=-(b4-(delta3^(0.5)))/(2*a4);
if(x5>0 && x5<250)
xx2=x5;
else
xx2=x6;
end
As2=(0.85*fcd*1000*xx2)/fyd; %Gerekli donatý alanýnýn bulunmasý
s2=(1000*Alan)/As2;
s2=s2-mod(s2,10);
fprintf('#%d/%d mm aralýkla donatý seçilmiþtir. (Kenar Þeritte) \n', cap, s2)
%Donatý oraný denetimi
Asy2=1000*Alan/s2; %Yerleþtirilen donatý alaný mm^2
p=Asy2/(1000*d);
if((p)>(0.85*fctd/fyd))
fprintf('Maksimum donatý oraný þartýný saðlamýþtýr. (Kenar Þeritte) \n')
else
fprintf('Maksimum donatý oraný þartýný saðlamamýþtýr. (Kenar Þeritte) \n')
break
end
%Minimum donatý oraný denetimi (Kenar þeritte)
if((Asy2/(1000*d))>0.002)
fprintf('Minimum donatý oraný denetimi saðlanmýþtýr. (Kenar Þeritte) \n')
else
fprintf('Minimum donatý oraný denetimi saðlanmamýþtýr. (Kenar Þeritte) \n')
end
%Kenar þeritte kullaným sýnýr durumuna göre çatlak denetimi
Ms3=Mdc2+Mdw2+Mst2;
Ft2=(Ms3*10^6*6)/(1000*h^2);
if(Ft2>Fr)
fprintf('Kesit çatlamýþtýr. (Kenar Þeritte) \n')
a3=500;
b3=n*Asy2;
c3=-n*Asy2*d;
delta2=(b3^2)-(4*a3*c3);
if(delta2<0)
fprintf('Denklem kökleri reel deðildir.  (Kenar Þeritte)')
break
end
x3=-(b3+(delta2^(0.5)))/(2*a3);
x4=-(b3-(delta2^(0.5)))/(2*a3);
if(x3>0 && x3<250)
xx=x3;
else
xx=x4;
end
Icr=(1000*(xx^3)/12)+(1000*xx*(xx/2)^2)+(n*Asy2*(d-xx)^2); %Dönüþtürülmüþ kesitin atalet momenti (mm^4)
Icr=Icr/10^6;
Fs=n*Ms3*(d-xx)/Icr; %Bulunan çatlamýþ kesitin atalet momenti kullanýlarak çekme donasýtýnda oluþan çekme gerilmesi (MPa)
dc=25+(cap/2);
Al=2*dc*s2;
Fsa=(23000/((dc*Al)^(1/3)));
if(Fsa>fyd)
Fsa=fyd;
end
if(Fs>Fsa)
fprintf('Donatý aralýðý çatlak denetimi bakýmýndan uygun deðildir.  (Kenar Þeritte) \n\n')
son=2;
sayi=1;
while sayi<son
s2=s2-10;
Asy2=1000*Alan/s2; %Yerleþtirilen donatý alaný mm^2
ay=Asy2*fyd/(k1*fcd*1000);
a3=500;
b3=n*Asy2;
c3=-n*Asy2*d;
delta2=(b3^2)-(4*a3*c3);
if(delta2<0)
fprintf('Denklem kökleri reel deðildir.  (Kenar Þeritte)')
break
end
x3=-(b3+(delta2^(0.5)))/(2*a3);
x4=-(b3-(delta2^(0.5)))/(2*a3);
if(x3>0 && x3<250)
xx=x3;
else
xx=x4;
end
Icr=(1000*(xx^3)/12)+(1000*xx*(xx/2)^2)+(n*Asy2*(d-xx)^2); %Dönüþtürülmüþ kesitin atalet momenti (mm^4)
Icr=Icr/10^6;
Fs=n*Ms3*(d-xx)/Icr; %Bulunan çatlamýþ kesitin atalet momenti kullanýlarak çekme donasýtýnda oluþan çekme gerilmesi (MPa)
dc=25+(cap/2);
Al=2*dc*s2;
Fsa=(23000/((dc*Al)^(1/3)));
if(Fs<Fsa)
fprintf('#%d/%d mm aralýkla yeni bir donatý seçilmiþtir.  (Kenar Þeritte) \n', cap, s2)
fprintf('Donatý aralýðý çatlak denetimi bakýmýndan uygundur.  (Kenar Þeritte) \n')
Asy2=1000*Alan/s2; %Yerleþtirilen donatý alaný mm^2
p=Asy2/(1000*d);
if((p)>(0.85*fctd/fyd))
fprintf('(Yeni aralýk) Maksimum donatý oraný þartýný saðlamýþtýr. (Kenar Þeritte) \n')
else
fprintf('(Yeni aralýk) Maksimum donatý oraný þartýný saðlamamýþtýr. (Kenar Þeritte) \n')
break
end
if((0.03*fcd/fyd)<(Asy2/1000/d))
fprintf('(Yeni aralýk) Minimum donatý oraný þartýný saðlamýþtýr. (Kenar Þeritte)\n\n')
else
fprintf('(Yeni aralýk) Minimum donatý oraný þartýný saðlamamýþtýr. (Kenar þeritte)\n')
break
end
sayi=son;
end
end
else
fprintf('Donatý aralýðý çatlak denetimi bakýmýndan uygundur.  (Kenar Þeritte) \n\n')
end
else
fprintf('Kesit çatlamamýþtýr. (Kenar Þeritte)\n\n');
end

%Daðýtma donatýlarýnýn belirlenmesi

Dgt=(1750)/((1000*L)^0.5);
if(Dgt>50)
Dgt=50;
end
%Ýç þeritte daðýtma donatýsý
As3=Dgt*Asy/100;
s3=1000*Alan2/As3;
s3=s3-mod(s3,10);
fprintf('#%d/%d mm aralýkla daðýtma donatýsý seçilmiþtir. \n', cap2, s3)

%Kenar þeritte daðýtma donatýsý
As4=Dgt*Asy2/100;
s4=1000*Alan2/As4;
s4=s4-mod(s4,10);
fprintf('#%d/%d mm aralýkla daðýtma donatýsý seçilmiþtir. (Kenar Þeritte) \n', cap2, s4)

%Rötre ve sýcaklýk deðiþimi donatýsýnýn belirlenmesi
Ash=0.75*1000*h/fyd;
Asht=Ash/2;
s5=1000*Alan2/Asht;
s5=s5-mod(s5,10);
fprintf('#%d/%d mm aralýkla Rötre ve sýcaklýk deðiþimi donatýsý seçilmiþtir. (Enine Doðrultuda) \n', cap2, s5)
Ashl=2*Asht/3;
s6=1000*Alan2/Ashl;
s6=s6-mod(s6,10);
fprintf('#%d/%d mm aralýkla Rötre ve sýcaklýk deðiþimi donatýsý seçilmiþtir. (Boyuna Doðrultuda) \n', cap2, s6)
