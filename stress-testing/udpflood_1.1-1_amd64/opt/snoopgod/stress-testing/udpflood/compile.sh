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
	sudo rm -f /usr/bin/udpflood
	cd /opt/snoopgod/stress-testing/udpflood/
	sudo make >/dev/null 2>&1
	sudo ln -s /opt/snoopgod/stress-testing/udpflood/udpflood /usr/bin/udpflood
	clearscreen
	udpflood --help
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
