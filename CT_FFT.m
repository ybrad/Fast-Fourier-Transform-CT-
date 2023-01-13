%Cooley-Tukey FFT function.  The input x is the original sequence and the 
%Result produced is the DFT Xk.  x must have a power of 2 elements.
function X = CT_FFT(x)
N = length(x);              %Sets the length of x as N which should be a power of two.

if(N==1)                    %If N=1, set the output X as the first and only element of x.
    X=x(1);                
    return
end

even = zeros(1,round(N/2)); %Create an empty vector of zeros size N/2.

for i= 1:(N/2)
    even(i)=x(2*i-1);       %Stores even elements in vector even.
end
evenFFT=CT_FFT(even);       %Performs the DFT on even recursively.

for i= 1:(N/2)
    odd(i)=x(2*i);          %Stores odd elements in vector odd.
end
oddFFT=CT_FFT(odd);         %Performs the DFT on odd recursively.

X=zeros(1,N);               %Creates an empty vector with zeros s
for i= 1:(N/2)
    wk=exp(-2*pi*1i*(i-1)/N);%Sets twiddle factor.
    X(i)=evenFFT(i)+wk*oddFFT(i);
    X(i+N/2)=evenFFT(i)-wk*oddFFT(i);
end
