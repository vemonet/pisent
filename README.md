# 🍓📽️ Pisent

Simple setup for Raspberry Pi, to automatically present the content available at a URL on a screen (e.g. a google docs presentation).

## 📥️ Installation

This requires a SD card of 8GB or more. 

First you will need to install the Raspberry Pi Operating System on your SD card

1. Install the **Raspberry Pi Imager** tool on your laptop. 

2. You can then use this tool to easily install the recommended OS for Raspberry pi (based on Debian) on your SD card: https://www.raspberrypi.com/software

3. Once the installation is done, open the SD card using your laptop file explorer, and copy this folder (with the `install.sh` and `start.sh` scripts) in the folder `/home/pi` in the SD card

You can now put the SD card in the Raspberry Pi. You will also need to connect a mouse, a keyboard and a screen to the Raspberry Pi to finish the setup.

1. Start the Raspberry Pi and choose your timezone
2. Open the terminal, and go to the folder where the scripts are located:

```bash
cd /home/pi/pisent
```

2. Run the `install.sh` script:

```bash
./install.sh
```

3. Restart the Raspberry Pi

The Raspberry Pi should now automatically display the slideshow when it is started (be careful as it will need to access the internet to load the slideshow at the start)

## 🔄 Update the slideshow

The easiest way to update the slideshow presented is to restart the Raspberry Pi.

1. Make sure it is connected to the internet (required to load the slideshow at start). 

Use your smartphone mobile hotspot to allow the Raspberry Pi to quickly connect.

If you need to add a new WiFi connection: plug the USB mouse and keyboard to the Raspberry Pi, use `Alt + F4` to close the slideshow, then add your smartphone WiFi credits

2. Unplug and replug the power cable (there is no button)
2. Note that if you change a slide manually it will stop the automatic scrolling and you will need to restart the Pi.

## 📚️ Other actions

### Connect via SSH

Go to **Preferences** in the Raspberry Pi OS:

* Enable SSH
* Disable Screen Blanking (screensaver)

Run this on the Raspberry Pi to get the hostname (should be starting with `192.168.****`):

```bash
hostname -l
```

Connect from your laptop terminal (need to be on same WiFi, get the hostname with the previous command)

```bash
ssh pi@192.168.183.162	
```

> Password: damnthatsamsung23

### Turn on/off TV

> cf. the `install.sh` script to install the required packages

Turn off:

```bash
echo standby 0 | cec-client -s -d 1
```

Turn on:

```bash
echo on 0 | cec-client -s -d 1
```

You can add it to the CRON jobs to do it automatically from 8:00 to 20:00. Access the CRON configuration with the command `crontab -e` and add the following lines:

```bash
0 20 * * * echo standby 0 | cec-client -s -d 1
0 8 * * * echo on 0 | cec-client -s -d 1
```

### Try out YouTube TV

This requires a powerful Raspberry Pi, otherwise it will lag a lot for higher resolutions.

Install the "YouTube on TV" chrome extension in the browser, then run:

```bash
chromium-browser --enable-extensions --kiosk "https://www.youtube.com/tv"
chromium-browser --enable-extensions --fullscreen "https://www.youtube.com/tv"
```

