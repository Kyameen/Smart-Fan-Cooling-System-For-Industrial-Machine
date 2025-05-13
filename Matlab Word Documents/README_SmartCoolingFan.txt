
Smart Cooling Fan System – MATLAB Project (ENGI 316)
===================================================

This project simulates a smart cooling fan for an industrial machine, developed as part of the ENGI 316 MATLAB course.

Project Members:
----------------
• Khosrow Yameen – 22119672 – Software Engineering
• Samuel Gbemi – 22207187 – Mechanical Engineering

Project Overview:
-----------------
The system uses user-defined parameters (ambient temperature, load, initial temperature, etc.) to simulate the heating and cooling behavior of an industrial machine. 
The fan automatically adjusts its speed based on current temperature levels and shuts down the system if critical temperatures are exceeded.

Folder Structure:
-----------------
- mainGUI.m              → Main GUI logic
- mainGUI.fig            → GUI layout (GUIDE tool)
- get_user_inputs.m      → Retrieves input from GUI fields
- initialize_system.m    → Initializes time, temperature, and constants
- simulate_smart_fan.m   → Main simulation logic and shutdown control
- fan_speed_to_numeric.m → Converts fan speed to numeric levels for plotting
- publish_script.m       → Script to demonstrate/report simulation using publish()
- temperature_log.xlsx   → Excel output file

Subfolders:
- /html/                 → Output from publish_script.m (HTML report + figures)
- /Word Documents/       → Report sections (structure chart, flowchart, GUI explanation, pseudocode, and full report)

How to Run:
-----------
1. Open MATLAB and navigate to the project folder.
2. Open and run mainGUI.m (GUI will launch).
3. Enter all required input fields and click the simulation button.
4. The system will simulate temperature, plot results, and export to Excel.
5. Optionally, run `publish('publish_script.m')` to generate an HTML/PDF simulation report.

Requirements:
-------------
- MATLAB with GUIDE support (GUI functionality)
- Symbolic Math Toolbox is not required (symbolic section is optional and handled safely)
- xlswrite permission to save results locally

Final Notes:
------------
All code is modular, documented, and responsibilities between students are clearly assigned in the structure chart.
