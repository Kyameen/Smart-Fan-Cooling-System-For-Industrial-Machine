Smart Fan Cooling System for Industrial Machines
================================================

Overview
--------
This MATLAB project simulates a smart fan system designed to maintain optimal temperature in industrial environments. It features a GUI to enter parameters, control simulation modes, and visualize results in real-time.

Key Features
------------
- Interactive GUI (mainGUI.m)
- Two operation modes: Automatic and Manual
- Real-time fan speed adjustment based on temperature
- Live temperature and fan speed visualization
- Excel export of simulation results
- User input validation with error feedback

How to Run
----------
1. Open MATLAB and navigate to the project folder.
2. Run the GUI by typing the following command:
   >> mainGUI

3. In the GUI:
   - Enter input values for:
     • Ambient Temperature
     • Initial Temperature
     • Target Temperature
     • Time Steps
     • Heat/Cooling Rate

     Ensure inputs are within valid ranges.

   - Click **"Run Simulation"**.
   - Choose between **Automatic** or **Manual** mode.

4. Observe real-time plots and fan behavior.

5. After simulation:
   - Click **"Publish"** to generate an HTML report.
   - Results will also be saved in **temperature_log.xlsx**.

File Structure
--------------
- mainGUI.m                 : Main GUI logic
- fan_speed_to_numeric.m    : Converts fan speed description to numeric
- get_user_inputs.m         : Validates and fetches user input
- initialize_system.m       : Initializes temperature values
- simulate_smart_fan.m      : Runs the simulation loop
- publish_script.m          : Exports simulation results
- temperature_log.xlsx      : Stores result values

Credits
-------
Developed by Khosrow Yameen  
Course: ENGI 316 – MATLAB Project

