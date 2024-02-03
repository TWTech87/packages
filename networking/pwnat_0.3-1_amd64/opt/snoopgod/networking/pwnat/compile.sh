#!/usr/bin/env bash

## Clear screen
## ------------
function clearscreen()
{
	clear
	sleep 2s
}

## Keep alive
## ----------
function keepalive()
{
	sudo -v
	while true;
	do
		sudo -n true;
		sleep 60s;
		kill -0 "$$" || exit;
	done 2>/dev/null &
}

## Compile binary
## --------------
function compile()
{
	echo "Please wait while compiling the program ..."
	sudo rm -f /usr/bin/pwnat
	cd /opt/snoopgod/networking/pwnat/
	sudo make >/dev/null 2>&1
	sudo ln -s /opt/snoopgod/networking/pwnat/pwnat /usr/bin/pwnat
	clearscreen
	pwnat -h
}

## Launch
## ------
function launch()
{
	clearscreen
	keepalive
	compile
}

## -------- ##
## Callback ##
## -------- ##

launch
