---
post: 90
title: A Floppy named lsadkfjalhkjh
date: January 1984
author: Bruce Horn
characters: Bruce Horn, Larry Tesler
topics: Bugs, Software Design, The Launch
summary: An early bug in the Finder sends Bruce back to the drawing board...
---

# A Floppy named lsadkfjalhkjh
* Author: Bruce Horn
* Story Date: January 1984
* Topics: Bugs, Software Design, The Launch
* Characters: Bruce Horn, Larry Tesler
* Summary: An early bug in the Finder sends Bruce back to the drawing board...

After the Mac was introduced in January, 1984, we were all excited to go out to computer dealers and see people's first reactions to our pride and joy.  Up to this point, computer users were used to the IBM PC's command-line interface, and we were more than curious as to how people would react to our point-and-click, drag-and-drop graphical user interface.  I especially was interested in seeing how people liked using the Finder, and what they found particularly compelling, or difficult.

We went to quite a few stores in the week or so after the introduction, and found that, without exception, every Mac's floppy disk had a garbage name!  They were all named something like ";lkakl;rt;klgjh", as if someone had just randomly typed characters to see what would happen.  Which is exactly what they did.

In the Finder, the startup disk would appear on the desktop, in the top-right corner, ready to be opened.  The Finder would initially select it; once selected, typing would replace the current name, following the modeless interaction model that I had learned in the Smalltalk group from Larry Tesler.  This meant that whatever anyone typed when they first came up to the Macintosh would end up renaming the disk.

We had done some user testing, but apparently not enough; our users were already too experienced with the Mac to make this type of mistake.  We apparently didn't ask enough people to find out if the Finder passed the "Mom test": would your Mom be able to figure it out without help?

I hurried back to the office and worked on a new release of the Finder that would fix the bug (and others that I had discovered)--it would require the user to take an extra step before she would be allowed to rename the disk.

Finally seeing how the public used the Mac made it clear to me that there were, in fact, good reasons for modes--at least in some cases--and it certainly gave me a taste of humble pie.