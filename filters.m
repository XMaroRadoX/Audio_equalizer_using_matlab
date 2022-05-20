clc
close all
fs = 44100; % to be taken from input part
fn = fs/2; % normalized frequency
type = 'fir'; % to be taken from input part

if type == 'iir'
    % IIR filters
    N = 4; % order of the system
    
    %0-170 
    [b1,a1] = butter(N,170/fn);
    analyze(b1,a1,'4th order 0-170 Hz IIR LPF');
    
    %170-310
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [b2,a2] = butter(N,[170/fn,310/fn]);
    analyze(b2,a2,'4-th order 170-310 Hz IIR BPF');
    
    %310-600
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [b3,a3] = butter(N,[310 600]/fn);
    analyze(b3,a3,'4-th order 310-600 Hz IIR BPF');
   
    %600-1000
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [b4,a4] = butter(N,[600 1000]/fn);
    analyze(b4,a4,'4-th order 600-1000 Hz IIR BPF');
    
    %1-3
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [b5,a5] = butter(N,[1000 3000]/fn);
    analyze(b5,a5,'4-th order 1-3 KHz IIR BPF');
     
    %3-6 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [b6,a6] = butter(N,[3000 6000]/fn);
    analyze(b6,a6,'4-th order 3-6 KHz IIR BPF');
    
    %6-12 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [b7,a7] = butter(N,[6000 12000]/fn);
    analyze(b7,a7,'4-th order 6-12 KHz IIR BPF');
   
    %12-14 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [b8,a8] = butter(N,[12000 14000]/fn);
    analyze(b8,a8,'4-th order 12-14 KHz IIR BPF');
     
    %14-16 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [b9,a9] = butter(N,[14000 16000]/fn);
    analyze(b9,a9,'4th order 14-16 KHz IIR BPF');
  
else
    % FIR filters
    N = 40;
    
    %0-170
    coef1 = fir1(N,170/fn);
    analyze(coef1,1,'40-th order 0-170 Hz FIR LPF');
   
    %170-310
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coef2 = fir1(N,[170 310]/fn);
    analyze(coef2,1,'40-th order 170-310 HZ FIR BPF');
       
    %310-600
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coef3 = fir1(N,[310 600]/fn);
    analyze(coef3,1,'40-th order 310-600 HZ FIR BPF');

    %600-1000
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coef4 = fir1(N,[600 1000]/fn);
    analyze(coef4,1,'40-th order 600-1000 HZ FIR BPF');
    
    %1-3
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coef5 = fir1(N,[1000 3000]/fn);
    analyze(coef5,1,'40-th order 1-3 KHZ FIR BPF');
     
    %3-6
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coef6 = fir1(N,[3000 6000]/fn);
    analyze(coef6,1,'40-th order 3-6 KHZ FIR BPF');
   
    %6-12
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coef7 = fir1(N,[6000 12000]/fn);
    analyze(coef7,1,'40-th order 6-12 KHZ FIR BPF');
     
    %12-14
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coef8 = fir1(N,[12000 14000]/fn);
    analyze(coef8,1,'40-th order 12-14 KHZ FIR BPF');
   
    %14-16
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    coef9 = fir1(N,[14000 16000]/fn);
    analyze(coef9,1,'40-th order 14-16 KHZ FIR BPF');  
     
end


%START HERE



























function analyze(b,a,name)
    figure('name',name);
    
    [H,wh] = freqz(b,a);
    [P,wp] = phasez(b,a);
    
    subplot(3,2,1)
    plot(wh/pi,abs(H));grid;
    title('Magnitude response')
    xlabel('Normalized Frequency (\times\pi rad/sample)')
    ylabel('Magnitude')

    subplot(3,2,2)
    plot(wp/pi,P*180/pi);grid;
    title('Phase response')
    xlabel('Normalized Frequency (\times\pi rad/sample)')
    ylabel('Phase (degrees)')

    
    subplot(3,2,3)
    impz(b,a);grid;
    title('Impulse response')
    xlabel('Samples')
    ylabel('Amplitude')

    subplot(3,2,4)
    stepz(b,a);grid;
    title('Step response')
    xlabel('Samples')
    ylabel('Amplitude')

    subplot(3,2,[5 6])
    zplane(b,a);grid;
    title('Pole-Zero plot')
end
