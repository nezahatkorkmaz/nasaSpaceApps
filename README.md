# NEMO AgriBee: Invasive Locust Protection & AI-Based Smart Agriculture System

## High-Level Summary
**AgriBee** is an AI-powered agricultural system designed to enhance agricultural productivity and optimize water management using UAV (Unmanned Aerial Vehicle) technologies. The system consists of hive-shaped bases mounted on four towers. These bases allow the UAVs to return for charging and monitor the fields to collect data. The collected data is used to detect agricultural needs and automatically analyze irrigation requirements. Additionally, the system tracks the vitamin and mineral needs of the plants, providing intelligent suggestions to farmers. Equipped with real-time data analysis and image processing techniques, AgriBee provides instant information on crucial agricultural factors like soil moisture levels and mineral balance. The Visual Question Answering (VQA) system allows users to ask questions based on the data collected by the UAVs, providing direct answers.

## Project Demo
More Details and CAD drawings: https://drive.google.com/drive/folders/1MlP3Uz0_SVnCD36EFY-1H0VZnlQz93ZT?usp=sharing

## Project Details
AgriBee aims to optimize water and resource management in agricultural areas by analyzing NASA satellite data. The system consists of bee-themed UAVs and hive-shaped bases positioned on towers. The UAVs are solar-powered and can autonomously recharge at these bases. Each UAV has its own designated tower and operates based on signals received from these towers. The towers communicate with each other, enabling data to be transferred to a central system for analysis. Additionally, UAVs can communicate with each other and work in coordination to comprehensively monitor the agricultural field.

The UAVs monitor important agricultural factors such as soil moisture, water status, and mineral balance in real time. This data is used to understand soil conditions and plant needs, offering intelligent recommendations to farmers for irrigation and fertilization. The UAVs also utilize image processing and Visual Question Answering (VQA) technology to respond to visual questions from farmers.

### Main Features:
- **Drone Monitoring:** UAVs continuously monitor soil moisture levels in the field.
- **Data Analysis:** NASA satellite data is used to analyze the condition of the soil in agricultural areas.
- **Intelligent Recommendation System:** Provides smart irrigation suggestions for areas lacking water.
- **Drone Management:** Monitors the operational and charging status of the UAVs.

## Drone Communication
The honeycomb-shaped stations located at the four corners of the field serve as the central communication points for mini drone swarms. Each station houses three mini drones, acting as a satellite for communication between drones. The stations also define the drones' coverage areas, ensuring each station is responsible for a specific region of the field.

The bee-themed mini drones in our project are designed for data collection, observation, and emergency response in agricultural areas. These mini drones are intended to operate in coordination as a swarm, efficiently communicating with central stations. The **LoRa** communication protocol is used to enable long-range, low-power communication.

### LoRa Communication Protocol
LoRa (Long Range) is a radio frequency technology that enables long-distance, low-power, low-data-rate communication over a wide area. It’s an ideal solution for communication between mini drones and the central station.

### Technical Overview of LoRa:
LoRa operates using the **chirp spread spectrum (CSS)** modulation technique, allowing long-distance communication without interference, even with low signal strength. It typically works in the **ISM frequency bands** (e.g., 868 MHz in Europe, 915 MHz in America, 433 MHz in Asia).

LoRa packets consist of:
- **Header:** Specifies the sender and packet size.
- **Payload:** Contains the core data (e.g., sensor data or emergency information).
- **Cyclic Redundancy Check (CRC):** Ensures data integrity by detecting transmission errors.

LoRa uses the **Spreading Factor (SF)** parameter, which balances data rate and range. Higher SF increases range but reduces data rate, ideal for wide agricultural areas where long-distance communication is necessary. LoRa also supports **Adaptive Data Rate (ADR)**, dynamically adjusting data rate and spreading factor based on signal quality, optimizing battery life and ensuring reliable communication.

### Task Coordination Algorithm
Each drone is assigned a specific area of the field, and they patrol independently in a **lawnmower pattern**, ensuring comprehensive coverage. The field is divided into equal sections, and drones are assigned to these regions to maximize efficiency.

## Emergency Drone Activation
1. **Water Transfer in Case of Drought:**  
   When soil moisture sensors detect dry areas, the UAVs are autonomously dispatched to deliver water.
   
2. **Vitamin and Mineral Deficiency Intervention:**  
   UAVs apply necessary supplements to areas where soil analysis sensors detect deficiencies.
   
3. **Invasive Species Detection and Repulsion:**  
   UAVs emit a specific frequency to repel invasive locusts or other pests when detected during patrols.

## Wireless Charging for Drones
Stations are equipped with **Qi wireless charging technology**. Drones autonomously return to their stations for wireless charging when needed. The stations are designed to allow drones to charge by stacking on top of each other, with each charging point identified by a unique QR code.

## System Interfaces
- **UAV Interface:** Provides real-time monitoring of the bee-themed UAVs, including their mechanical structures, charging status, and operational data. The VQA system enables users to ask questions such as "Is there a flood in the area?" and receive instant answers.
- **Monitoring Interface:** Displays the status of soil moisture, minerals, and other resources. Anomalies like sudden changes in moisture levels are detected, and UAVs are dispatched for further investigation.

### Example Scenario:
If an increase in moisture is detected in one area, AgriBee will recognize this as an anomaly and deploy the bee-themed UAVs to investigate. The VQA system will answer questions like:
- "Is there a flood in the area?" (Answer: Yes or No)
- "Are there animals in the area?" (Answer: Yes or No)

## Monitoring Application Features:
Below are the important agricultural factors that can be monitored through AgriBee’s system:

1. **Soil Moisture**  
   - *Data Source:* SMAP  
   - *Importance:* Helps analyze the water retention capacity of the soil and determine irrigation needs.

2. **Precipitation Data**  
   - *Data Source:* IMERG  
   - *Importance:* Useful for water management and irrigation planning.

3. **Temperature and Heatwaves**  
   - *Data Source:* MODIS, ECOSTRESS  
   - *Importance:* Temperature extremes directly affect plant growth and need to be monitored.

4. **Vegetation Health (NDVI)**  
   - *Data Source:* MODIS, VIIRS  
   - *Importance:* Helps optimize planting and harvest timing by tracking plant health.

5. **Water Bodies and Resources**  
   - *Data Source:* SWOT, Landsat  
   - *Importance:* Tracks nearby water sources to manage water resources effectively.

6. **Drought and Flood Risk**  
   - *Data Source:* Landsat, MODIS, SAR  
   - *Importance:* Helps manage agricultural risk by tracking droughts and floods.

## Use of Artificial Intelligence
AgriBee uses AI algorithms to analyze data collected from drones. Machine learning models predict soil moisture levels and plant health, providing smart recommendations for irrigation and fertilization. The VQA system enhances the user experience by allowing them to ask visual questions and receive real-time answers based on drone data. 

The system uses NASA’s data sources, such as MODIS and SMAP, to optimize irrigation and monitor environmental changes in agricultural fields.

## Space Agency Data
N/A

## References
- **ViLT Architecture:**  
  ViLT: Vision-and-Language Transformer Without Convolution or Region Supervision - Wonjae Kim, Bokyung Son, Ildoo Kim

---
