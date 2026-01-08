# 2D Brownian Motion Simulation with Reflecting Boundaries

This project simulates a 2D Brownian motion with a vectorizied random walk model in MATLAB.
A set (100) of particles go through random displacements during each time step and are confined within a bounded domain whilst using reflecting boundary conditions.

This simulation visualizes particle motion in real time and analyzes diffusion behaviour with mean squared displacement (MSD)

## Features
- Vectorized random walk implementation
- Reflecting boundary conditions in a bounded 2D domain
- Real-time particle animation
- Mean squared displacement (MSD) analysis

## How It Works
- Particles start the the origin (0,0) and move randomly in both the x and y directions
- At each time step, particles receive a random displacement drawn from a normal distribution
- Reflecting walls prevent particles from leaving the simulations domain
- MSD is computed to quantify how the particle spread evolves over time


## How to Run
1. Open the MATLAB script in MATLAB
2. Run the script
3. Both the animation and MSD plot will appear in a single figure window

## Output
- Left panel: Animated particle motion
- Right panel: Mean squared displacement (MSD) vs time graph

## Notes 
This project was created as a learning exercise to practice MATLAB vectorization, simulation design, as well as data visualization.
