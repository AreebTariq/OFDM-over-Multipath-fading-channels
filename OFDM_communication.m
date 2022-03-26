clear; clc;
close all;

% IMPORTANT NOTE: SIMULAITON TIME IN SIMULINK: 0.1s %
% Uncomment the path you need to experiment (SNR, Delay, or Doppler) %
% By Default EB/No vs BER %

DelayVec = [0.2 1 2 10 20 100 200 1000 2000];
GainVec = [1 2 3 4 5 6 7 8 9];
MaxDopplerShiftVec = [0 0.0000001 0.000001 0.00001 0.0001 0.001 0.01 0.1 1 10 100 1000 10000 100e3];
DelayVec = DelayVec*(1e-9);
GainVec = GainVec*(-1.5);
EbNoVec = [0:3:15];
maxNumErrors = 1e6;
maxNumBits = 1e10;

% To vary the Eb/No (dB) parameter of AWGN Channel block with parameter name <<EbNo>>
for n = 1: length(EbNoVec)
    EbNo = EbNoVec (n);
    output = sim ('OFDM_project');
    BERVEC(n,:) = BER_values6(10417,1);
    BERVEC1(n,:) = BER_values7(10417,1);
    disp(BER_values6(10417,1));
    disp(BER_values7(10417,1));
 
end

% To vary the Discrete path delays (s) parameter of SISO Fading Channel block with parameter name <<Delay>>

% for n = 1: length(DelayVec)
%     Delay = DelayVec (n);
%     output = sim ('OFDM_project');
%     BERVEC(n,:) = BER_values6(10417,1);
%     BERVEC1(n,:) = BER_values7(10417,1);
% 
% end


% To vary the Maximum Doppler shift (Hz) parameter of SISO Fading Channel block with parameter name <<MaxDopplerShift>>

% for n = 1: length(MaxDopplerShiftVec)
%     MaxDopplerShift = MaxDopplerShiftVec (n);
%     output = sim ('OFDM_project');
%     BERVEC(n,:) = BER_values6(10417,1);
%     BERVEC1(n,:) = BER_values7(10417,1);
% 
% end


%Plot BER vs Eb/No
semilogy(EbNoVec,BERVEC(:,1), 'ob--');
legend('OFDM with AWGN');
ylabel('Error Probability');
xlabel('Eb/No (dB)');
title('OFDM with AWGN BER vs EbNo');
grid on;

hold;
semilogy(EbNoVec,BERVEC1(:,1), 'dg--');
legend('OFDM with AWGN','OFDM  with AWGN and Rayleigh');


%Plot BER vs Multipath delay

% BERVEC1 = BERVEC1*100;
% semilogx(DelayVec,BERVEC1(:,1), 'ob--');
% legend('OFDM with Multipath Rayleigh');
% ylabel('Error Probability');
% xlabel('Delay (s)');
% title('OFDM with Multipath Rayleigh Delay vs BER');
% grid on;

%Plot BER vs Doppler shift

% BERVEC1 = BERVEC1*100;
% semilogx(MaxDopplerShiftVec,BERVEC1(:,1), 'ob--');
% legend('OFDM with Multipath Rayleigh');
% ylabel('BER %age');
% xlabel('Max Doppler Shift (Hz)');
% title('OFDM Rayleigh Doppler Shift vs BER');
% grid on;

