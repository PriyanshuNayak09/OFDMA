# OFDMA Communication System Simulation (MATLAB/Simulink)

## Overview

This project implements a complete Orthogonal Frequency Division Multiple Access (OFDMA) communication chain using MATLAB and Simulink. The model simulates multi-user transmission over an AWGN channel, including subcarrier allocation, OFDM modulation/demodulation, and bit-error-rate (BER) evaluation per user.

The objective of this project is to demonstrate the working of OFDMA in a multi-user environment and analyze system performance under noise.

---

## System Description

**Transmitter**
- Random data generation for multiple users
- User-wise data partitioning
- Subcarrier mapping
- IFFT-based OFDM modulation

**Channel**
- AWGN channel model

**Receiver**
- FFT-based OFDM demodulation
- Subcarrier demapping
- QPSK demodulation
- Per-user BER calculation

---

## Model Architecture

The simulation pipeline follows a linear, stage-by-stage structure:

```
[Data Generation]
      |
      v
[For Each User: Data Partitioning & QPSK Modulation]
      |
      v
[Subcarrier Mapper]  →  Assigns each user a dedicated group of subcarriers
      |
      v
[IFFT Block]         →  OFDM modulation (time-domain signal generation)
      |
      v
[AWGN Channel]       →  Additive white Gaussian noise injection
      |
      v
[FFT Block]          →  OFDM demodulation (frequency-domain recovery)
      |
      v
[Subcarrier Demapper] →  Extracts each user's subcarrier group
      |
      v
[For Each User: QPSK Demodulation & BER Calculation]
      |
      v
[Scope / Output Display]
```

Each user is assigned a non-overlapping group of subcarriers and processed independently through the transmit and receive chains.

---

## Key Features

- Multi-user OFDMA transmission
- Configurable number of users and subcarriers per user
- AWGN channel modeling
- QPSK modulation and demodulation
- Per-user BER evaluation
- MATLAB Function blocks for subcarrier mapping and demapping
- Fixed-size signal implementation for stable simulation

---

## Parameters

| Parameter    | Description                          | Relationship             |
|--------------|--------------------------------------|--------------------------|
| `numUsers`   | Number of users                      | —                        |
| `Nsc`        | Number of subcarriers per user       | —                        |
| `FFTLength`  | Total FFT size                       | `FFTLength = numUsers × Nsc` |

---

## MATLAB Function Blocks

| Block                | Input              | Output               |
|----------------------|--------------------|----------------------|
| `AllUsersData`       | —                  | `[Nsc × numUsers]`   |
| `SubcarrierMapper`   | `[Nsc × numUsers]` | `[FFTLength × 1]`    |
| `SubcarrierDemapper` | `[FFTLength × 1]`  | `[Nsc × numUsers]`   |

All outputs are fixed-size matrices to avoid variable-size propagation errors in Simulink.

---

## Requirements

- MATLAB
- Simulink
- Communications Toolbox
- Recommended version: R2016a or later

---

## How to Run

1. **Clone the repository:**
   ```bash
   git clone https://github.com/YourUsername/OFDMA_Simulink_Demo.git
   cd OFDMA_Simulink_Demo
   ```

2. **Open MATLAB:**
   Launch MATLAB on your system.

3. **Set workspace parameters:**
   In the MATLAB Command Window, define the simulation parameters:
   ```matlab
   numUsers  = 4;
   Nsc       = 16;
   FFTLength = numUsers * Nsc;
   ```

4. **Load the Simulink model:**
   Open the main model file `OFDMA_Simulink_Demo.slx`.

5. **Run the simulation:**
   Click the **Run** button in Simulink to start the simulation.

6. **Modify parameters (optional):**
   - Adjust `numUsers` to change the number of active users
   - Adjust `Nsc` to change subcarriers allocated per user
   - Modify the AWGN channel SNR to evaluate performance at different noise levels

7. **Observe results:**
   View the simulation outputs in the scope blocks for:
   - Per-user BER values
   - Frequency-domain subcarrier allocation
   - Time-domain transmitted and received signals

---

## Learning Outcomes

- OFDMA multi-user subcarrier allocation
- OFDM modulation and demodulation via IFFT/FFT
- Subcarrier mapping and demapping logic
- Per-user BER analysis in a multi-user system
- Simulink signal sizing and fixed-size constraints
- Use of For Each subsystems in Simulink

---

## Possible Extensions

- Rayleigh fading channel model
- Higher-order modulation schemes (16-QAM, 64-QAM)
- Adaptive subcarrier allocation based on channel quality
- Pilot-based channel estimation
- Cyclic prefix insertion and removal

---

## Author

**Priyanshu Nayak**
B.Tech Electrical Engineering