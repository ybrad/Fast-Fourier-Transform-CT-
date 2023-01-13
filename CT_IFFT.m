%Cooley-Tukey IFFT function.  The input x is the DFT and the 
%Result produced is the IDFTT xn.  x must have a power of 2 elements.
function X = CT_IFFT(x)
    
N = length(x);              %Sets length of x as N which must be a power of 2.
X = zeros(1,N);             %Creates an empty vector of zeros size N.

for i= 1:(N)
    X(i)=conj(x(i));        %Calculates the complex conj of all elements in x.
end
X_FFT=CT_FFT(X);            %Performs the FFT on the conjugated DFT values.

for i= 1:(N)
    X(i)=conj(X_FFT(i));    %Calculates the complex conj of all elements in X_FFT.
end

for i= 1:(N)
    X(i)=X(i)/N;            %Divides all elements by N.
end
