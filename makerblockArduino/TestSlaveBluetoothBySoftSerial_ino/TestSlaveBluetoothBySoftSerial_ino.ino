/*************************************************************************
* File Name          : TestSlaveBluetoothBySoftSerial.ino
* Author             : Steve
* Updated            : Evan
* Version            : V1.0.1
* Date               : 5/17/2013
* Description        : Example for Makeblock Electronic modules of Me -  
                       Bluetooth. The module can only be connected to the 
                       port 3, 4, 5, 6 of Me - Base Shield.
* License            : CC-BY-SA 3.0
* Copyright (C) 2013 Maker Works Technology Co., Ltd. All right reserved.
* http://www.makeblock.cc/
**************************************************************************/
#include <Makeblock.h>
#include <Arduino.h>
#include <SoftwareSerial.h>
#include <Wire.h>

/*
Blue module can only be connected to port 3, 4, 5, 6 of base shield.
*/
MeBluetooth bluetooth(PORT_5);

void setup()
{
    Serial.begin(115200);
    bluetooth.begin(115200);
    Serial.println("Bluetooth Start!");
}

void loop()
{
    char inDat;
    char outDat;
    if(bluetooth.available())
    {
        inDat = (char) bluetooth.read();
        Serial.print("In Serial:");
        Serial.println(inDat);
    }
    if(Serial.available())
    {
        outDat = (char) Serial.read();
        bluetooth.write(outDat);
        Serial.print("Out Serial:");
        Serial.println(outDat);
    }
}

