---
post: 205
title: Font Manager Redux
date: March 1985
author: Andy Hertzfeld
characters: Bud Tribble, Steve Jobs, Jerome Coonen, Bill Atkinson, Bruce Horn, Larry Kenyon, Burrell Smith, Steve Capps
topics: Software Design, Technical, Personality, Allnighters, QuickDraw
summary: I continued to work on the Font Manager even after I left Apple
---

# Font Manager Redux
* Author: Andy Hertzfeld
* Story Date: March 1985
* Topics: Software Design, Technical, Personality, Allnighters, QuickDraw
* Characters: Bud Tribble, Steve Jobs, Jerome Coonen, Bill Atkinson, Bruce Horn, Larry Kenyon, Burrell Smith, Steve Capps
* Summary: I continued to work on the Font Manager even after I left Apple

Innovation often requires discarding finished work when a better solution comes along.  Each new improvement may impact prior work, so you have to be willing to retool the older parts of a design to better integrate the newer parts as they emerge.  One example of this for the Macintosh was the development of font manager, which had to be rewritten a few different times as the system evolved.


   Bill Atkinson's QuickDraw graphics package did all the work of measuring and drawing text, but it didn't want to deal with system-dependent details like reading from the file system.  The font manager's main job was to load fonts for QuickDraw, given a font family, a size and a style, so Quickdraw could just blast out characters without having to worry about how fonts are stored and loaded.

   The initial implementation of the font manager simply included a few built-in fonts that were linked with the system, and it returned the system font if you requested one that wasn't built-in.  The initial system font that we used through most of 1981 was one that we borrowed from Smalltalk called "Cream".

   In the spring of 1982, the first implementation of our user interface software was beginning to come together.  We wanted to allow application writers to use a variety of fonts, so we had to provide a way to load fonts from disk and cache them in memory.  We also had to load hunks of code called "drivers" in a similar fashion, so Larry Kenyon and I collaborated on some code to load and cache objects from disk that we called the "object manager" that was used by the font manager.

    Bill Atkinson had recently given Quickdraw the ability to scale bitmaps, including text, so we added support in the font manager for scaled fonts, which included heuristics to find the font that best satisfied a given request, if none were perfect.  If we didn't have a font at the requested size, we could make one by scaling.  But scaled text looked kind of lumpy, so we added a way for an application to choose if it wanted it or not.

    Meanwhile, Bruce Horn was busy implementing the resource manager.  I should have realized it sooner, but by the fall of 1982, it was becoming obvious that there would be lots of benefits if fonts and drivers became resources.  We'd save space by discarding our "object manager" code, and simplify the system by eliminating lots of separate files; applications could even transparently contain their own fonts if they wanted to.  I devised a simple scheme to encode the font family and size into a resource ID, and rewrote the font manager to be based on resources. Resource IDs were 16 bits long, with the high bit reserved, so the font manager ended up supporting a universe of 128 font families in 128 different sizes, which seemed like plenty at the time.

    We added a number of refinements to the font manager in 1983, like a routine to make it easy to build the font menu, but the basic design didn't change very much, and that's what we ended up shipping with in January 1984.   The software team was exhausted from the final push, and not all that much development happened during 1984, as some of the old-timers like myself left the company (I went on leave of absence in March 1984) and new hires like Burt Sloan and Ernie Beernick got up to speed.  I certainly didn't think I'd be working on the font manager anymore.

   In early 1985, Jerome Coonen was getting the software team revved up to do a 128K version of the ROM, that would eventually ship with the Mac Plus in January 1986.   It incorporated lots of bug fixes, and some newer subsystems like Appletalk and a better, hierarchical file system.  There was so much extra space available that it even incorporated a ROM-based resource file for system resources, to speed up booting and save memory. Jerome solicited my suggestions for improvements, and I responded with a pretty long list.

   Among other things, I suggested a major overhaul of the font manager.  The LaserWriter, with its superb Postscript imaging system, had made the font situation on the Macintosh pretty complicated, with different subsystems for the screen and printing, and the limitations of the font manager made it hard to get things right.  We needed to support fractional pixel widths so the screen could better match the printer, and provide a better scheme for mapping fonts to resources that wasn't limited to 128 fonts.  But I was disappointed that the team didn't decide to implement any of my font manager suggestions because development time was growing short and it seemed like too much work.

   Even though I was no longer an Apple employee (see Things Are Better Than Ever), I was still in close touch with the company, since Burrell Smith was my best friend and next door neighbor (we had bought two houses on the same lot in Palo Alto in April 1983).  Bud Tribble had finished medical school and returned to Apple in his old role of software manager in August 1984, and was living in a spare room at Burrell's house, so I saw him frequently as well.  And every once in a while, without advance warning, Steve Jobs would show up at my doorstep for an impromptu visit on a weekend afternoon.

   On one such visit, in late February 1985, Steve asked me what I thought of the 128K ROM effort.  I complained that it wasn't ambitious enough, and mentioned the font manager changes when Steve asked for an example.  But I didn't expect his response.

  "If you think that's so important, why don't you go ahead and do it yourself", Steve told me.  "There would be time to get it done if you pitched in.  Maybe we could give you a few Macs in exchange for doing it."

   I told him I'd think about.  Bud Tribble came by the next day to discuss it with me, and I agreed to develop a new font manager for the 128K ROM in exchange for three 512K Macintoshes, which I had Apple ship directly to my brothers and sister as gifts.   All the code for the new ROM was supposed to be completed within a month, so I'd have to drop what I was doing to get the font manager done in time.     

Pretty soon, I had the new font manager going, which used a new resource type called "FOND" to describe all of the properties of a font family, including the resource IDs of the font bitmaps.   This allowed us to support tens of thousands of font families instead of a mere 128 like the old design.   I also got the fractional width support going, but I needed some changes in QuickDraw to make it so  applications could actually use it.

I talked with Bill about implementing the required changes and was surprised to find that he was reluctant to do it.  In fact, even though we had identified a number of bugs, Bill didn't want to change QuickDraw at all, arguing that any sort of change at all would mess up existing applications.   Finally, while I was down at Apple to attend a coordination meeting, Bud, Steve Capps and I all ganged up on Bill, telling him that if he didn't want to maintain QuickDraw, he'd have to let one of us do it.  Bill said he'd think about it overnight, and we planned to meet again the next afternoon to decide what to do.

We were all surprised when Bill showed up at Apple the next day, excited to give us a demo of ovals drawing almost twice as fast as they used to.  Apparently, when he started looking at the code yesterday evening he got excited about working on QuickDraw again.  He started to fix the bugs we identified, and one thing led to another, and he soon he saw a half dozen ways to improve things.  I was happy that Bill was excited about QuickDraw again, but a little bit afraid that he had swung too far in the opposite direction.

At this point, there was only around a week left before code freeze, but it seemed like the font manager was just about finished.   Bill implemented measuring with the fractional widths, and it seemed to work great.  But then, the evening before we were going to freeze the code, I got a call from Bill at around 8pm.

"Hey, Andy, I've got some great news.  I can speed up text drawing by more than 40%!  But I need a little help from the font manager."

It turns out that Bill had realized that, on the average, since most text was lower case, characters only used around half of the total height of the strike bitmap - only a few characters had descenders, and most didn't go all the way to the top, either.   QuickDraw usually could just skip the blank parts in the characters, saving lots of time.

QuickDraw didn't have time to measure the tops and bottoms of the characters on the fly, but it was a perfect job for the font manager, which could do it once, right after it loaded a new font into memory.   For each character, it calculated an offset and a length, telling Bill where to start and stop the drawing.   Bill told me the format of the table that he'd like the font manager to supply, and asked me if I thought I could do it.

I thought that it was crazy to attempt something like this with the freeze scheduled in less than 16 hours, but it was such a cool idea that I told Bill that I'd give it a try.   I went out for dinner, bought two six packs of Diet Coke, and started implementing the font measuring code around 10pm.  I came up with a nice, efficient way to do it, iterating through the strike bitmap a longword at a time, and, eight diet Cokes later, I  thought I had it working just about the time the sun was rising; I even had enough time to sleep for a few hours before meeting Bill at Apple at 10am.

We crossed our fingers when we tried it out, but luckily both of our parts worked the first time, with Bill's tests showing that we achieved the projected 40% speed-up.   Of course, the code freeze ended up slipping for other reasons, so we didn't really have to rush like we did, but the urgency made it a little bit more fun, I guess.

