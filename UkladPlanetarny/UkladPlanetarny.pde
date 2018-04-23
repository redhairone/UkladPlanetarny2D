float T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10;

float PunoR = 100, KunoR=15, KdosR=28,
      PdosR = 170,
      PtresR = 250, KtresR=22, KcuatroR=33, KcincoR=44,
      PcuatroR = 400, KseisR=50, KsieteR=70;
float SX = 500,
      PunoX, KunoX, KdosX,
      PdosX,
      PtresX, KtresX, KcuatroX, KcincoX,
      PcuatroX, KseisX, KsieteX;
float SY = 500,
      PunoY, KunoY, KdosY,
      PdosY,
      PtresY, KtresY, KcuatroY, KcincoY,
      PcuatroY, KseisY, KsieteY;

float p=0;

int   iloscGwiazd=200, zaciemnianieGwiazd=0, ZG=0, przelacznik=0, pr=0;

float [] tabX = new float [iloscGwiazd]; 
float [] tabY = new float [iloscGwiazd];

void tlo()
{
  background(0);
  for (int i=0; i<iloscGwiazd/2; i++)
  {
    obiektAlfa(150,150,150,zaciemnianieGwiazd,tabX[i],tabY[i],4);
    obiektAlfa(150,150,150,ZG,tabX[iloscGwiazd/2+i],tabY[iloscGwiazd/2+i],4);
  }
  
  
  if (przelacznik==0) zaciemnianieGwiazd=zaciemnianieGwiazd+1;
  else zaciemnianieGwiazd=zaciemnianieGwiazd-1;
  
  if (zaciemnianieGwiazd>=255) przelacznik=1;
  else if (zaciemnianieGwiazd<=0) {przelacznik=0; wylosowanie(iloscGwiazd/2,0);}
  
  if (pr==0) ZG=ZG+2;
  else ZG=ZG-2;
  
  if (ZG>=255) pr=1;
  else if (ZG<=0) {pr=0; wylosowanie(iloscGwiazd,iloscGwiazd/2);}
}

void wylosowanie(int ilosc, int poczatek)
{
  for(int i=poczatek; i<ilosc; i++)
  {
    tabX[i]=random(width);
    tabY[i]=random(height);
  }
}

void obiektAlfa(int R, int G, int B, int alfa, float x, float y, float r)
{ 
    fill(R,G,B,alfa);
    ellipse(x,y,r,r);   
}

void obiekt(int R, int G, int B, float x, float y, float r)
{
  for(float i=0; i<=20; i=i+1)
  {
    fill(R,G,B,i);
    ellipse(x,y,r,r);
    
    r=r*(1-i/255);
  }
  
  fill(R,G,B,255);
  ellipse(x,y,r,r);
}

void orbita(int R, int G, int B, float x, float y, float r)
{
  fill(0,0,0,0);
  stroke(R,G,B);
  ellipse(x,y,r,r);
  noStroke();
}

void setup()
{
  size(1000, 1000);
  wylosowanie(iloscGwiazd, 0);
}

//ellipse(x, y, szerokosc, wysokosc)

void draw()
{
  tlo();
  
  // ================================================== //
  // ==================OBIEKTY========================= //
  // ================================================== //
  
  
  // ===== GWIAZDA GOWNA ===== //
  obiekt(235,176,1,SX,SY,100); // Zgnila Zolc.
  
  // ===== PIERWSZA PLANETA ===== //
  obiekt(190,61,54,PunoX,PunoY,20); // Spalona Czerwien.
  orbita(190,61,54,SX,SY,100+100);
  
  PunoX = (SX+PunoR*cos(T0));
  PunoY = (SY+PunoR*sin(T0));
  
  
  // ===== DRUGA PLANETA ===== //
  obiekt(13,131,10,PdosX,PdosY,40); // Ciemna Zielen.
  orbita(13,131,10,SX,SY,100+240);
 
  PdosX = (SX+PdosR*cos(-T3));
  PdosY = (SY+PdosR*sin(-T3));
  
  
  // ===== TRZECIA PLANETA ===== //
  obiekt(39,129,237,PtresX,PtresY,30); // Niebieski (jak Niebo).
  orbita(39,129,237,SX,SY,100+250+150);
  
  PtresX = (SX+PtresR*cos(-T4));
  PtresY = (SY+PtresR*sin(-T4));
  
  
  // ===== CZWARTA PLANETA ===== //
  obiekt(155,29,239,PcuatroX,PcuatroY,60); // Szmaragdowy Fiolet.
  orbita(155,29,239,SX,SY,100+350+350);
  
  PcuatroX = (SX+PcuatroR*cos(T8));
  PcuatroY = (SY+PcuatroR*sin(T8));
  
  
  // ================================================== //
  // ==================KSIEZYCE======================== //
  // ================================================== //
  
  
  // KSIEZYCE PIERWSZEJ PLANETY //
  //&1
  fill(255,255,255); // Biala Biel.
  ellipse(KunoX,KunoY,4,4);
  orbita(255,255,255,PunoX,PunoY,20+10);
  
  KunoX = (PunoX+KunoR*cos(T1));
  KunoY = (PunoY+KunoR*sin(T1));
  
  //&2
  fill(255,255,254); // Biala Biel.
  ellipse(KdosX,KdosY,5,5);
  orbita(255,255,254,PunoX,PunoY,20+28+8);
  
  KdosX = (PunoX+KdosR*cos(-T2));
  KdosY = (PunoY+KdosR*sin(-T2));
  
   // KSIEZYCE TRZECIEJ PLANETY //
  //&3
  fill(255,255,253); // Biala Biel.
  ellipse(KtresX,KtresY,8,8);
  orbita(255,255,253,PtresX,PtresY,30+16);
  
  KtresX = (PtresX+KtresR*cos(T5));
  KtresY = (PtresY+KtresR*sin(T5));
  
  //&4
  fill(255,255,252); // Biala Biel.
  ellipse(KcuatroX,KcuatroY,5,5);
  orbita(255,255,252,PtresX,PtresY,30+36);
  
  KcuatroX = (PtresX+KcuatroR*cos(T6));
  KcuatroY = (PtresY+KcuatroR*sin(T6));
  
  //&5
  fill(255,255,251); // Biala Biel.
  ellipse(KcincoX,KcincoY,6,6);
  orbita(255,255,251,PtresX,PtresY,30+58);
  
  KcincoX = (PtresX+KcincoR*cos(-T7));
  KcincoY = (PtresY+KcincoR*sin(-T7));
  
  // KSIEZYCE CZWARTEJ PLANETY //
  //&6
  fill(255,255,250); // Biala Biel.
  ellipse(KseisX,KseisY,7,7);
  orbita(255,255,250,PcuatroX,PcuatroY,60+40);
  
  KseisX = (PcuatroX+KseisR*cos(T9));
  KseisY = (PcuatroY+KseisR*sin(T9));
  
  //&7
  fill(255,255,249); // Biala Biel.
  ellipse(KsieteX,KsieteY,8,8);
  orbita(255,255,249,PcuatroX,PcuatroY,60+80);
  
  KsieteX = (PcuatroX+KsieteR*cos(-T10));
  KsieteY = (PcuatroY+KsieteR*sin(-T10));
  
  
  // ============================== //
  // ======ZANIKANIE GWIAZD======== //
  // ============================== //
  /*
  fill(0,5);
  rect(0,0,width,height);
  
  fill(255);
  ellipse(random(width),random(height),4,4);
  */
  // ============================== //
  // ======ODNAWIANIE GWIAZD======= //
  // ============================== //
  /*
  if (p==100) {wylosowanie(); p=0;}
  p++;
  */
  // ============================== //
  // ======ODNAWIANIE CZASU======== //
  // ============================== //
  
  T0 = millis()/8000.0f;
  T1 = millis()/1000.0f;
  T2 = millis()/3000.0f;
  T3 = millis()/3500.0f;
  T4 = millis()/9000.0f;
  T5 = millis()/1500.0f;
  T6 = millis()/800.0f;
  T7 = millis()/2000.0f;
  T8 = millis()/5000.0f;
  T9 = millis()/1200.0f;
  T10 = millis()/3200.0f;
}