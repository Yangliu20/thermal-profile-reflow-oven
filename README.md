# Reflow soldering thermal profile

## Modeling

- Use COMSOL to simulate environment temperature in the reflow oven
- To simplify, introduce an easier moving-average model
- Simulate the thermal profile based on heat equation and Newton's law of cooling
- Computational results from both simplified and COMSOL model agree with experiment data

<img src="https://github.com/Yangliu20/thermal-profile-reflow-oven/blob/main/docs/images/simulation.png" width = 50%/>

<img src="https://github.com/Yangliu20/thermal-profile-reflow-oven/blob/main/docs/images/env_temp_comparison.png" width = 50%/>

- Also compute the thermal profile under different passing velocity

<img src="https://github.com/Yangliu20/thermal-profile-reflow-oven/blob/main/docs/images/thermal_profile_w_different_velocity.png" width = 50%/>

## Optimization

- **Goal**: Minimize the area above 217 degC below peak temperature, subject to several constraints (on peak temperature, slope, velocity, time above 217 degC, temperature of each segment etc.)
- Adopt Genetic Algorithm, converting constraints to a penalty term in the fitness function

<img src="https://github.com/Yangliu20/thermal-profile-reflow-oven/blob/main/docs/images/min_area.png" width = 50%/>

<img src="https://github.com/Yangliu20/thermal-profile-reflow-oven/blob/main/docs/images/genetic_algorithm_convergence.png" width = 50%/>
