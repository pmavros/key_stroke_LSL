# key_stroke_LSL
Tiny matlab script to register a keystroke in the keyboard and send a marker to the LabStreamingLayer (LSL) Lab Recorder. 

## Description

The aim of this script is to enable synchronisation of data recordings across multiple devices. Although, the [Lab Streaming Layer (LSL)](https://github.com/labstreaminglayer/) framework enables time-synchronisation, it requires acess to the api of each device. Unfortunately, some physiological measurement hardware do not provide direct access to their API. 

So this, matlab script provides a simple workaround: it listens for the key press  and if it detects a key code (currently F4 but you can change it) it will send a marker to the LabStreamingLayer (LSL) Lab Recorder. 

We plan to use this to support an EDA (skin conductance) experiment, to register a marker in the Biopac Acknowledge software, and concurently send a marker in the LSL stream. Therefore, we will have to manually to import the rest of the markers for EDA in post-processing. 

The rest of the data collection uses [PsychoPy3](www.psychopy.org) for stimulus presentation and the [LSL Lab Recorder](https://github.com/labstreaminglayer/App-LabRecorder) for data aquisition.

## Prerequisites

The script relies on having a working installation of:
- [PsychToolbox](psychtoolbox.org)
- [LabStreamingLayer](https://github.com/labstreaminglayer/)

## Alternative solutions:

Since I do not yet have access to the Biopac, I have not tested this solution: https://github.com/esdalmaijer/MPyDev
