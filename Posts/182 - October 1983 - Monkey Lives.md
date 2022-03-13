---
post: 182
title: Monkey Lives
date: October 1983
author: Andy Hertzfeld
characters: Steve Capps, Bill Atkinson
topics: Software Design, Testing, Technical
summary: The very first location in low memory
---

# Monkey Lives
* Author: Andy Hertzfeld
* Story Date: October 1983
* Topics: Software Design, Testing, Technical
* Characters: Steve Capps, Bill Atkinson
* Summary: The very first location in low memory

The original Macintosh only had 128K bytes of RAM (that's one eighth of a megabyte), so dealing with memory management was usually the hardest part of writing both the system and applications.  We allocated around 16K bytes for system use, and another 22K bytes for the 512 by 342 black and white screen, so applications were left with only 90K bytes or so. The bigger ones like MacWrite or MacPaint seemed to be bursting at the seams.


By the fall of 1983, MacWrite and MacPaint were pretty much feature complete but still needed a lot of testing, especially in low memory conditions.  MacPaint needed to allocate three off-screen buffers, with each the size of the entire screen, so it was always skirting the edge of running out of memory, especially when you brought up a desk accesory, but the specific sequences that led to crashes were difficult to reproduce.

Steve Capps had been working on a "journaling" feature for the "Guided Tour" tutorial disc, where the Macintosh could demo itself by replaying back events that were recorded in a prior session.  He realized that the so-called "journaling hooks" that were used to feed pre-recorded events to the system could also be the basis of a testing tool he called "The Monkey".

The Monkey was a small desk accessory that used the journaling hooks to feed random events to the current application, so the Macintosh seemed to be operated by an incredibly fast, somewhat angry monkey, banging away at the mouse and keyboard, generating clicks and drags at random positions with wild abandon.  It had great potential as a testing tool, so Capps refined it to generate more semantically rich events, with a certain percentage of the events as menu commands, a certain percentage as window drags, etc.

The Monkey proved to be an excellent testing tool, and a great amusement, as well. Its manic activity was sort of hypnotic, and it was interesting to see what kind of MacPaint pictures the Monkey could draw, or if it would ever produce something intelligible in MacWrite.  At first it could crash the system fairly easily, but soon we fixed the more obvious bugs.  We thought it would be a good test for an application to see if it could run the Monkey all night, but usually it didn't run for more than 20 minutes, even if it didn't crash, because the Monkey would invariably select the quit command.

Bill Atkinson came up with the idea of defining a system flag called "MonkeyLives" (pronounced with a short "i" but often mispronounced with a long one), that indicated when the Monkey was running. The flag allowed MacPaint and other applications to test for the presence of the Monkey and disable the quit command while it was running, as well as other areas they wanted the Monkey to avoid.  This allowed the Monkey to run all night, or even longer, driving the application through every possible situation.

We kept our system flags in an area of very low memory reserved for the system globals, starting at address 256 ($100 in hexadecimal), since the first 256 bytes were used as a scratch area.  The very first slot in the system globals area, address 256, had just been freed up, so that's where we put the MonkeyLives boolean.  The Monkey itself eventually faded into relative obscurity, as the 512K Macintosh eased the memory pressure, but its memory was kept alive by the curious name of the very first value defined in the system globals area.

