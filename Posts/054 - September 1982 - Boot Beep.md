---
post: 54
title: Boot Beep
date: September 1982
author: Andy Hertzfeld
characters: Charlie Kellner, Andy Hertzfeld, Terry Oyama, Steve Jobs
topics: Software Design, Technical, Personality
summary: How the boot sound evolved
---

# Boot Beep
* Author: Andy Hertzfeld
* Story Date: September 1982
* Topics: Software Design, Technical, Personality
* Characters: Charlie Kellner, Andy Hertzfeld, Terry Oyama, Steve Jobs
* Summary: How the boot sound evolved

When you powered up an Apple II, it would make a short beep sound to let you know that it was alive.  We thought that the Mac should do something similar, once it passed the diagnostics, sort of like an infant's first cry, letting the world know that you actually made it here.

The 1981 Macintosh just had a square wave sound generator, where the software controlled the frequency by loading a value into the VIA's timer.   I wrote a boot sound routine that gradually incremented the frequency at an accelerating pace, so it had a whooping quality to it that was almost humorous.  People generally liked it, but we knew that we'd have to do something better for the real product.

In August 1982, the Mac was redesigned with much better sound quality, so we had the possibility of a better boot sound, since we now had 8-bit samples to play with.  I started experimenting a little bit, to see if I could come up with something.

Around this time, Charlie Kellner decided to transfer to the Mac group from the Apple II group.  Charlie was a brilliant Apple II programmer (who wrote a classic hi-res bowling game for the Apple II before he started work at Apple), who was a multi-talented, meticulous perfectionist.  He had designed a music synthesizer for the Apple II, called the alphaSyntauri, as a side project that was the basis of a small start-up company.  For some reason, he got bored with the Apple II and wanted to try out working with the Mac team.

Charlie saw me messing around with sounds for a new boot beep and told me that he knew of a simple algorithm that might work pretty well.  He asked me to fill the sound buffer with a simple square wave, but then make successive passes on it, averaging adjacent samples until everything reached the same level.

I coded it up and we tried it, and sure enough it had a pleasant, distinctive chiming quality.  With a little bit of tweaking, it became the famous sound that the Mac made when it powered up, which lasted until the Mac II, which had even better sound capability, in 1987.  For the interest of technical readers, here is a link to the source code, written in 68000 assembly language.

Charlie was pleased that he was able to make a significant contribution in his first week on the project.  Inspired, he asked if he could take a prototype home over the weekend for testing.   The next Monday he came into work very excited.

"I knew that something wasn't right!", he exclaimed.  "The sound is being completely muffled by the case!.  But I know how to fix it."

He had done a series of experiments with the Mac that he had taken home over the weekend, and found that the Macintosh's case was baffling and distorting the sound.  He even printed out graphics showing the results of his measurements.  Then, after analyzing the data, he drilled a hole about the size of a dime in a strategic place, which caused the measurements to improve dramatically.

He started demoing his modified prototype, showing how the hole improved the sound quality.  The difference didn't sound that significant to me, but it definitely was an improvement.  He showed it to Terry Oyama, who designed the case, and asked him if he could add the hole.

The next day, Steve Jobs came by in the afternoon and asked to hear Charlie's demo.  He listened to the two Macs, and then decreed "There's not enough improvement!  There's no way that we're going to put an ugly hole in the case!  Just forget about it!"

Charlie was pretty disappointed, and never got very enthusiatic about the Mac after that.  A couple of weeks later, he transfered back to the Apple II group, leaving the boot beep as his only legacy.