
a = zeros(200,200);

imshow(a)

%function lista = crearParticula( anguloLanzamiento, vViento, g, b, posicionx, posiciony)
% lista = [anguloLanzamiento, vViento, g, b, posicionx, posiciony];
%endfunction

%particula1 = crearParticula( 45/180, 1, 9.8, 0.007, 0, 0);


  %anguloLanzamiento = 45/180;
%  vViento = 1;
 % g = 9.8;
  %b = 0.007;
 % posicionx = 0;
 % posiciony = 0;

v(1)=0;
j=1;
vViento = 1;
g = 9.8;
b = 0.007;

for i = 1:5

  particula.anguloLanzamiento = 45/180;
  particula.posicionx = rand()*5;
  particula.posiciony = rand()*5;
  particula.estaSubiendo = false;




  for i=1:80 %i es el espacio que recorro en el eje y

   if(!particula.estaSubiendo)
      v(j+1)=g-b*v(j)+v(j);%Es el vector de velocidad
      particula.posicionx=abs(floor(particula.posicionx+v(j+1)*(sin(particula.anguloLanzamiento))-vViento));
      particula.posiciony=abs(floor(particula.posiciony+v(j+1)*(cos(particula.anguloLanzamiento))));
   endif

   if(particula.posicionx >= 200 || particula.posiciony >= 200 || particula.posicionx <= 1 || particula.posiciony <= 1)

      v(j)=-v(j);
      v(j+1)= -b*v(j)+v(j)+g;%Es el vector de velocidad

    if(particula.posicionx >= 200)
      particula.posicionx=200;
      particula.posicionx=abs(floor(posicionx-v(j+1)*(cos(anguloLanzamiento))));
      particula.posiciony=abs(floor(posiciony+v(j+1)*(sin(anguloLanzamiento))));
      particula.estaSubiendo=true;
    endif

    if(particula.posiciony >= 200)
      particula.posiciony=200;
      particula.posicionx=abs(floor(particula.posicionx-v(j+1)*(cos(particula.anguloLanzamiento))));
      particula.posiciony=abs(floor(particula.posiciony+v(j+1)*(sin(particula.anguloLanzamiento))));
    endif

    if(particula.posiciony<=1)
      particula.posiciony=1;
      particula.posicionx=abs(floor(particula.posicionx-v(j+1)*(cos(particula.anguloLanzamiento))));
      particula.posiciony=abs(floor(particula.posiciony+v(j+1)*(sin(particula.anguloLanzamiento))));
    endif

    if(particula.posicionx<=1)
      particula.posicionx=1;
      particula.posicionx=abs(floor(particula.posicionx+v(j+1)*(cos(particula.anguloLanzamiento))));
      particula.posiciony=abs(floor(particula.posiciony+v(j+1)*(sin(particula.anguloLanzamiento))));%-vViento

    endif


   endif

   if(v<=0 & particula.estaSubiendo)
     particula.estaSubiendo=false;
    endif

    a(particula.posiciony,particula.posicionx)=255;
    imshow(a);
    pause(0.0001);
    a(particula.posiciony,particula.posicionx)=0;
    j=j+1;

endfor

endfor






