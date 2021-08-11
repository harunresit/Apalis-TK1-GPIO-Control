### How to reach device drivers on Apalis Tk1 SoC

## What are device drivers

   Device drivers are firmwares sitting on kernel as ABI (Application Binary Interface). These firmwares are locating under /sys/class... directories.
If we get in /sys/class directory, we will see a lot of drivers for hardware interfaces Apalis Tk1 that binded to main board (Ixora Carrier) have.

## Let's control GPIO interface

   If we don't want to mess with breadboard, jumper cable, led, resistor etc., the easiest way of seeing whether we can control a GPIO pin on the board is controlling a pin connected to a free led on the board. Firstly we should look at the datasheet of Ixora Carrier (not Apalis). Open [datasheet of Ixora Carrier main board](https://docs.toradex.com/104004-apalis-arm-ixora-datasheet-v1-1.pdf), 
and look at Page 10. You will see a top side technical drawing of the board and it is so clear where which leds are locating. We suppose our goal is controlling LED5. Now we have to find how to light on
that led so we are going down to page 14. We will see a table that points which leds how to light on. Led 5 has 2 color led, red and green. Let's try to light on the green led. You will see you have to
make pin 152 of the MXM3 connector high to light on LED5 GREEN. MXM3 is GPIO interface of Apalis Tk1. 152 is pyhsical number of GPIO interface, we can't control this pin of GPIO giving this number to
Linux kernel. Because Linux kernel has different number for these pins. So secondly we have to find the Linux GPIO number. You can find on [this page](https://developer.toradex.com/knowledge-base/gpio-alphanumeric-to-gpio-numeric-assignment) or you can also find it on gpio-names.h file. You can find gpio-names.h file under ../buildroot/output/build/linux-ad44961f8b3cf5ce342d234c7eca05d89369c26b/arch/arm/mach-tegra directory. But before that we have to know which port pin 152 belongs to. For this we will look at [datasheet of Apalis Tk1](https://docs.toradex.com/103129-apalis-tk1-datasheet.pdf#page=11&zoom=100,109,160). Open page 23 after opening the datasheet, you will see a huge table under function list title. When you scroll down, you will see pin 152 is corresponding to GPIO3_PW.05. This means this pin is fifth pin of W port of GPIO3 interface. An MCU or MPU may contain one type of hardware more than one. After all these steps, finally we will learn Linux GPIO number is 181 for pin 152. For starting the operation, boot your SoC. 

## Commands for lighting on LED5 GREEN

   You can find commands easily on the internet but you can find commands on the script I installed also.

