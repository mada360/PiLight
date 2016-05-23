# PiLight
Raspberry Pi all-in-one

## Concept

There's plenty of great examples of using the raspberry pi as a media centre, steam streaming device or a retro gaming device.
I'm simply combining all of these guides into an all in one and hopefully making the whole thing a bit more streamlined and simple.

## Prerequisites

You will need to have the following:
- A Raspberry Pi (Durr) the newer the better but a Pi 2 should be able to work
- An SD card I'd recommend an 8GB if you only really want Kodi and Moonlight and don't mind swapping roms in and out, but a 32GB should be able to hold a hefty amount of ROMs so the system wouldn't be a slouch in the retro department.
- Power supply 2.5A 5V (Recommended) - This will be able to run all the Pi's up to the latest and in the older models will allow for comfortable overclocks. 
- [RetroPie](https://github.com/RetroPie/RetroPie-Setup/wiki/First-Installation) imaged to the SD card, it will automatically expand to take up the entire card on first boot. This guide is complete for windows, mac and linux and will be updated more often than I'd be able to so be sure to follow the set-up guides there.

## Execution

I like to break things but I don't like doing something more than once and BEHOLD! I present the lazy way to get moonlight; simply run script and enjoy.

The script will add the moonlight repo to RetroPie, install moonlight embedded, pair the pi with the steam device and will create the following options for launching Moonlight:
- 720p at 30 or 60fps
- 1080 at 30 or 60fps

## Future Improvements

- I'd like to be able to include the Kodi install and to automate the simple theme installation however they still can only be installed via the Emulation station menu.
- Add hyperion for all that ambilight goodness (optional install)



## Sources and Thanks!
[AwesomePi part 1](http://awesomepi.com/diy-breath-taking-ambilight-for-your-own-tv-raspberry-pi-2-tutorial-part-1/) and [AwesomePi part 2](http://awesomepi.com/part-2-let-there-be-light-installing-ambilight-software-hyperion-in-openelec/).
In fact there's a lot of great stuff on this site so check it all out.

[Moonlight for Retropie](https://github.com/RetroPie/RetroPie-Setup/issues/1082) - This is a great guide by Haris1977 and following this makes it super simple to get setup with moonlight.

[RetroPie](https://retropie.org.uk/) - With the base image and main OS being RetroPie I can hardly leave it off the list.
