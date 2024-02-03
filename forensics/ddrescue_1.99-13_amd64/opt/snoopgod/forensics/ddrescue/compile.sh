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
	sudo rm -f /usr/bin/ddrescue
	cd /opt/snoopgod/forensics/ddrescue/
	sudo make >/dev/null 2>&1
	sudo ln -s /opt/snoopgod/forensics/ddrescue/dd_rescue /usr/bin/ddrescue
	clearscreen
	ddrescue -h
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
