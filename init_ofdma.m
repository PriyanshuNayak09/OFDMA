%% OFDMA Initialization Script

numUsers = 4;              % number of users
Nsc = 16;                  % subcarriers per user

FFTLength = numUsers * Nsc;

EbNo = 15;                 % SNR
M = 4;                     % QPSK