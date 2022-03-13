---
post: 25
title: Diagnostic Port
date: July 1981
author: Andy Hertzfeld
characters: Steve Jobs, Jef Raskin, Burrell Smith, Brian Howard, Steve Wozniak, Rod Holt
topics: Hardware Design, Management
summary: Burrell tried to sneak in some hardware expandability
---

# Diagnostic Port
* Author: Andy Hertzfeld
* Story Date: July 1981
* Topics: Hardware Design, Management
* Characters: Steve Jobs, Jef Raskin, Burrell Smith, Brian Howard, Steve Wozniak, Rod Holt
* Summary: Burrell tried to sneak in some hardware expandability

Expandability, or the lack thereof, was far and away the most controversial aspect of the original Macintosh hardware design.  Apple co-founder Steve Wozniak was a strong believer in hardware expandability, and he endowed the Apple II with luxurious expandability in the form of seven built-in slots for peripheral cards, configured in a clever architecture that allowed each card to incorporate built-in software on its own ROM chip. This flexibility allowed the Apple II to be adapted to a wider range of applications, and quickly spawned a thriving third-party hardware industry.


But Jef Raskin had a very different point of view.  He thought that slots were inherently complex, and were one of the obstacles holding back personal computers from reaching a wider audience.  He thought that hardware expandability made it more difficult for third party software writers since they couldn't rely on the consistency of the underlying hardware.  His Macintosh vision had Apple cranking out millions of identical, easy to use, low cost appliance computers and since hardware expandability would add significant cost and complexity it was therefore avoided.

Apple's other co-founder, Steve Jobs, didn't agree with Jef about many things, but they both felt the same way about hardware expandability: it was a bug instead of a feature.  Steve was reportedly against having slots in the Apple II back in the days of yore, and felt even stronger about slots for the Mac.  He decreed that  the Macintosh would remain perpetually bereft of slots, enclosed in a tightly sealed case, with only the limited expandability of the two serial ports.

Mac hardware designer Burrell Smith and his assistant Brian Howard understood Steve's rationale, but they felt differently about the proper course of action.  Burrell had already watched the Macintosh's hopelessly optimistic schedule start to slip indefinitely, and he was unable to predict when the Mac's pioneering software would be finished, if ever.  He was afraid that Moore's Law would make his delayed hardware obsolete before it ever came to market.  He thought it was prudent to build in as much flexibility as possible, as long as it didn't cost too much.

Burrell decided to add a single, simple slot to his Macintosh design, which made the processor's bus accessible to peripherals, that wouldn't cost very much, especially if it wasn't used.  He worked out the details and proposed it at the weekly staff meeting, but Steve immediately nixed his proposal, stating that there was no way that the Mac would even have a single slot.

But Burrell was not that easily thwarted.  He realized that the Mac was never going to have something called a slot, but perhaps the same functionality could be called something else.  After talking it over with Brian, they decided to start calling it the "diagnostic port" instead of a slot, arguing that it would save money during manufacturing if testing devices could access the processor bus to diagnose manufacturing errors.   They didn't mention that the same port would also provide the functionality of a slot.

This was received positively at first, but after a couple weeks, engineering manager Rod Holt caught on to what was happening, probably aided by occasional giggles when the diagnostic port was mentioned.  "That things really a slot, right?  You're trying to sneak in a slot!", Rod finally accused us at the next engineering meeting.  "Well, that's not going to happen!"

Even though the diagnostic port was scuttled, it wasn't the last attempt at surreptitious hardware expandability.  When the Mac digital board was redesigned for the last time in August 1982, the next generation of RAM chips was already on the horizon.  The Mac used 16 64Kbit RAM chips, giving it 128K of memory.   The next generation chip was 256Kbits, giving us 512K bytes instead, which made a huge difference.

Burrell was afraid the 128Kbyte Mac would seem inadequate soon after launch, and there were no slots for the user to add RAM.  He realized that he could support 256Kbit RAM chips simply by routing a few extra lines on the PC board, allowing adventurous people who knew how to wield a soldering gun to replace their RAM chips with the newer generation.   The extra lines would only cost pennies to add.

But once again, Steve Jobs objected, because he didn't like the idea of customers mucking with the innards of their computer.  He would also rather have them buy a new 512K Mac instead of them buying more RAM from a third-party.  But this time Burrell prevailed, because the change was so minimal.  He just left it in there and no one bothered to mention it to Steve, much to the eventual benefit of customers, who didn't have to buy a whole new Mac to expand their memory.

