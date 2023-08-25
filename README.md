
# Smart Extension Switch




## Introduction
In a world where energy demands are on the rise, and energy costs continue to escalate, the "Smart Extension Socket" project was born out of necessity. This need for energy conservation is particularly pressing in Sri Lanka, where economic crises and shortages of fuel and energy resources compound the issue. Electricity has become an essential part of modern life, powering our daily routines. However, our busy lifestyles sometimes cause us to forget to switch off devices, leading to energy wastage and higher electricity bills. Moreover, supplying power to electronic devices beyond their required time can lead to damage, making it essential to address this problem.
## Project Overview
The "Smart Extension Socket" is designed to tackle these energy conservation challenges. It comprises two main components: the power socket itself and an LCD display with buttons for user interaction. The project followed a systematic development process, starting with simulation in Proteus, microcontroller programming, component selection, and hardware design

## Features
### Power Socket Features
**Timer Functionality:** The core functionality of the power socket is its timer, which allows users to set specific times for devices to turn on and off. This feature reduces energy wastage and ensures devices are powered only when needed.

**Periodical Mode:** Users can automate recurring tasks by activating the periodical mode, providing further convenience.

**User-Friendly Interface:** An LCD display with intuitive buttons enables users to control the extension socket effortlessly. The display shows settings and remaining time details.

**Cost-Effective Components:** The project employs common and cost-effective electronic components available in the local market, making it accessible to a wide range of users.

### Technical Details
**Microcontroller:** The project utilizes the PIC16F628A microcontroller, known for its low power consumption and affordability. Programming is achieved using an Arduino board as a programmer, allowing seamless code integration.

**LCD Display:** A 16x2 LCD display in 4-bit mode serves as the user interface, displaying process status, current options, and remaining time.

**AC-DC Step-Down Module:** An AC-DC step-down module converts the main AC voltage to regulated 5V DC power, ensuring safe and efficient operation.

**Relay Module:** A 5V relay module is used to control power supply to the socket, facilitating the switching of high-current devices with a low-current signal.

**Buzzer:** A buzzer provides an audible signal when a timer operation is complete, notifying users effectively.

## Power Circuit and Design
**Operating Voltage:** The device operates on 230V 50Hz AC voltage, with an AC-DC Step-Down converter used to convert it to 5V DC.

**Current Handling:** The product can handle a maximum current of 13A with appliances and has a maximum device current drain of 500mA.

**Power Consumption:** The extension power socket has a minimal power consumption of 2W, with options to disable the timer and display when not in use.

## PCB and Enclosure Design
**PCB Design:** The PCB design was meticulously created using Altium Designer, ensuring an efficient and compact layout. Power lines were appropriately routed for safety.

**3D Enclosure Design:** The enclosure design was done in SolidWorks, resulting in a 3D enclosure that houses the PCB and components securely. Fasteners were used to connect the top and bottom parts.

## Results and Discussion
**Prototype Testing:** The breadboard prototype underwent rigorous testing, with the LCD display, buttons, and menu system working seamlessly. Minor issues, such as a buzzer problem, were resolved by adding a capacitor.

**Component Integration:** After finalizing the PCB and enclosure design, components were soldered onto the PCB and assembled within the enclosure. Wiring was used to interconnect the components.

**Validation:** The final prototype proved successful, with the LCD display, menu system, and buzzer performing as expected. The project achieved its goals without significant setbacks.

## Conclusion
The "Smart Extension Socket" project represents a comprehensive solution to the pressing issue of energy conservation in an era of increasing energy demands and costs. By combining user-friendly features, cost-effective components, and advanced timer functionality, this project empowers users to manage their energy usage effectively and reduce electricity bills. The meticulous development process, from simulation to hardware design and testing, has resulted in a functional and efficient product that addresses the critical need for energy conservation in our modern world.







