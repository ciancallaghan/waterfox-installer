# Waterfox Installer

A simple bash script which pulls the latest waterfox release, unpacks it in
/opt/ and creates a desktop entry for it.

It needs to be run as sudo/root so that it can get access to the required
directories.

## Update 2023-09-26

I haven't looked at this script for a while and in that time waterfox ended up
changing its versioning and how it releases packages. I've updated the script
so that it works (for now).

I've also made efforts to make the scripts more POSIX compliant but they're
still only useful for Linux-x86_64.
