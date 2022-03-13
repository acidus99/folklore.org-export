---
post: 192
title: Disk Swapper's Elbow
date: January 1984
author: Steve Capps
characters: Steve Capps
topics: Software Design, Technical, Bugs
summary: a last minute bug causes some problems
---

# Disk Swapper's Elbow
* Author: Steve Capps
* Story Date: January 1984
* Topics: Software Design, Technical, Bugs
* Characters: Steve Capps
* Summary: a last minute bug causes some problems

One of the more common afflictions of early Macintosh users was the dreaded "Disk Swapper's Elbow" caused by a disk copying operation run amok. Disk swapping was a necessary evil caused by having 400KB floppy disks, 128KB of RAM, and a single floppy drive. If a user wanted to make a backup of a disk, she had to eject the source disk, insert a blank one, format it, drag the source disk over the new disk, and then the Finder would copy data piece-by-piece with the necessary swapping.

A typical application on a 128K Mac had about 85K of memory available; the rest was used by the system, mostly for the bitmap display. A simple calculation shows that copying a 400K disk should involve about 5 or 6 swaps. Five disk swaps was barely tolerable, but, as early Finder users will remember, occasionally it would take well over 20 disk swaps.

You'd start a disk copy and hold your breath during the fifth, and hopefully, final swap. If the Mac dutifully disgorged the floppy that sixth time, you'd convince yourself you miscounted, cross your fingers, and hope for the best. By the seventh swap you start cursing because you knew you were trapped and you'd start wondering about investing in a second, external drive.

Even though the whole Finder was only 46K of code and had about 10K of overhead, the remaining 30K of memory was too small for practical copying. So, I had to break up the code into two chunks: the bare minimum for copying and all the rest. Then, I had to carefully flush out all data that was cached in memory, preload the small disk-copying chunk of code, and coalesce the balance of RAM. Usually, the Finder ended up with 75K of free memory and things worked as planned. But, sometimes the system would mysteriously reload the larger chunk of the Finder code, fragment the free memory, and cause another case of Disk Swapper's Elbow.

It took me a long time to figure out what happened because we had rarely seen this in testing. There were a few bug reports of this problem that were never reproducible. The bug reports went like this: "Copied a disk, it took 20+ swaps $%#@!!! Tried a second time, it was fine." The reason this was not reproducible was because we were all expert mouse users and usually skipped the crucial misstep.

When anybody first starts using a mouse, dragging is one of the more difficult things to do. It's actually quite awkward to click down, move the mouse while holding down the button, and then release. Beginners very often accidentally release the mouse button while dragging. In the Finder, this means you could "drop" an icon you were dragging. You rarely thought about this (unless you happened to drop it over a folder and it disappeared); you'd immediately pick the icon up and continue the drag. It turned out if you dropped the disk icon during a disk copy, you'd induce the bug.  Since all of the team members had been using the mouse for years by this time, we rarely dropped icons which is why we could never reproduce the problem.

To support the user's spatial memory, the Finder always remembered where icons were located on the desktop. When you dropped the icon -- even for a half a second -- the Finder would dutifully record its location. The routine to save the icon's location was, as you probably guessed, in the big portion of the Finder's code. When this bug occurred, the Finder would carefully massage the memory for copying and then belatedly discover the icon's location hadn't been flushed out. It would blindly call the routine to flush it and you now know what would happen...

I introduced this bug about 2AM the morning we built the final disks. This bug was caused by a fix to a much more egregious bug, so it was definitely the lesser of two evils....really!