% I=imread('A.bmp');
I=imread('1.5V.png');
I=imresize(I,[1300,1300]);
figure,imshow(I),title('image with noise in frequency domain');
[w,h,s]=size(I);
for k=1:s %red green blue
    temp=I(:,:,k);
    tempFFT2=fft2(temp);
    tempfftshift=fftshift(tempFFT2);
    Mag=mat2gray(log(( abs(tempfftshift).^2)+1));
    Mag((h/2)-5:(h/2)+5,(w/2)-5:(w/2)+5)=0;
       Max=max(Mag);
 for i=1:w
    for j=1:h    
       if Mag(i ,j)>= Max
           tempfftshift(i,j)=0;
       end       
    end
 end
 F1=ifftshift(tempfftshift);
 F1=ifft2(F1);
 I(:,:,k)=F1;
end
 figure,imshow(uint8(real(I))),title('filtered img');
%   temp=I(:,:,2);
%     tempFFT2=fft2(temp);
%     tempfftshift=fftshift(tempFFT2);
%     Mag=mat2gray(log(( abs(tempfftshift).^2)+1));
%     Mag((h/2)-5:(h/2)+5,(w/2)-5:(w/2)+5)=0;
%        Max=max(Mag);
%  for i=1:w
%     for j=1:h    
%        if Mag(i ,j)> Max
%            tempfftshift(i,j)=0;
%     
%        end       
%     end
%  end
% 
%  F2=ifftshift(tempfftshift);
%  F2=ifft2(F2);
%  I(:,:,2)=F;
% 
%   temp=I(:,:,3);
%     tempFFT2=fft2(temp);
%     tempfftshift=fftshift(tempFFT2);
%     Mag=mat2gray(log(( abs(tempfftshift).^2)+1));
%     Mag((h/2)-5:(h/2)+5,(w/2)-5:(w/2)+5)=0;
%        Max=max(Mag);
%        
%  for i=1:w
%     for j=1:h    
%        if Mag(i ,j)> Max
%            tempfftshift(i,j)=0;
%        end       
%     end
%  end
%  F=ifftshift(tempfftshift);
%  F=ifft2(F);
%  I(:,:,3)=F;
 

