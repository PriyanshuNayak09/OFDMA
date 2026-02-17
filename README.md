# OFDMA Communication System Simulation (MATLAB/Simulink)

## Overview
This project implements a complete Orthogonal Frequency Division Multiple Access (OFDMA) communication chain using MATLAB and Simulink. The model simulates multi-user transmission over an AWGN channel, including subcarrier allocation, OFDM modulation/demodulation, and bit‑error‑rate (BER) evaluation per user.

The objective of this project is to demonstrate the working of OFDMA in a multi‑user environment and analyze system performance under noise.

---

## System Description

Transmitter:
- Random data generation for multiple users  
- User‑wise partitioning  
- Subcarrier mapping  
- IFFT (OFDM modulation)

Channel:
- AWGN channel

Receiver:
- FFT (OFDM demodulation)  
- Subcarrier demapping  
- QPSK demodulation  
- BER calculation per user  

---

## Model Architecture

All Users Data → For Each (User Processing) → Subcarrier Mapper → IFFT → AWGN → FFT → Subcarrier Demapper → For Each (BER per user) → Scope

Each user is assigned a group of subcarriers and processed independently.

---

## Key Features

- Multi‑user OFDMA transmission  
- Configurable number of users  
- Configurable subcarriers per user  
- AWGN channel modeling  
- QPSK modulation/demodulation  
- BER per user  
- MATLAB Function blocks for mapping and demapping  
- Fixed‑size signal implementation for stable simulation  

---

## Parameters

numUsers – Number of users  
Nsc – Subcarriers per user  
FFTLength – Total FFT size  

FFTLength = numUsers × Nsc

---

## MATLAB Function Blocks

AllUsersData → Output: [Nsc × numUsers]  
SubcarrierMapper → Output: [FFTLength × 1]  
SubcarrierDemapper → Output: [Nsc × numUsers]

All outputs are fixed‑size matrices to avoid variable‑size propagation errors.

---

## Requirements

MATLAB  
Simulink  
Communications Toolbox  

Recommended version: R2016a or later

---

## How to Run

1. Open MATLAB  
2. Open OFDMA_Simulink_Demo.slx  
3. Set parameters in workspace:

numUsers = 4;
Nsc = 16;
FFTLength = numUsers*Nsc;

4. Run simulation  
5. Observe BER outputs

---

## Learning Outcomes

- OFDMA multi‑user allocation  
- OFDM modulation/demodulation  
- Subcarrier mapping logic  
- Multi‑user BER analysis  
- Simulink signal sizing  
- For Each subsystem usage  

---

## Possible Extensions

- Rayleigh fading channel  
- Higher‑order modulation  
- Adaptive allocation  
- Channel estimation  
- Cyclic prefix addition  

---

## Author

Priyanshu Nayak  
B.Tech Electrical Engineering
