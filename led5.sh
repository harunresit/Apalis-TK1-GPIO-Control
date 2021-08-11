#!/bin/bash                                                                     
                                                                                
echo 181 > /sys/class/gpio/export                                               
echo out > /sys/class/gpio/gpio181/direction                                    
echo $1 > /sys/class/gpio/gpio181/value  
