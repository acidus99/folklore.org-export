---
post: 151
title: Resource Manager Countdown
date: August 1982
author: Andy Hertzfeld
characters: Bruce Horn, Bob Belleville
topics: Software Design, Management
summary: Bob gives Bruce thirty days to finish the Resource Manager
---

# Resource Manager Countdown
* Author: Andy Hertzfeld
* Story Date: August 1982
* Topics: Software Design, Management
* Characters: Bruce Horn, Bob Belleville
* Summary: Bob gives Bruce thirty days to finish the Resource Manager

![Bruce used one note for each remaining day](images/Macintosh/postit.jpg) 

The Resource Manager was one of the cornerstones of the Macintosh Toolbox.  It provided a way to manage chunks of data so they could be easily accessed by the code but be stored and edited independently from it.  This was the basis of our localization, for example, since text strings could be stored as resources and translated without having to change the code and rebuild the entire application.

Resources were conceived and implemented by Bruce Horn.  They came a little late in the design cycle, and we had to rewrite some other parts of the toolbox to take advantage of them, although that wasn't clear initially.  But in the summer of 1982 they were definitely one of the riskier parts of the design.

Bob Belleville, our new software manager, assessed the situation and decided that the resource manager was too big a risk, and tried to convince us to drop it from the design.  Bruce went apoplectic, and Bob eventually compromised on giving Bruce 30 days to implement the resource manager.  Bruce agreed that if it wasn't ready within 30 days, it would be dropped from the project.

The next day, Bruce came to work with a few pads of yellow sticky notes.  He tore off one note at a time, wrote a number on it, and then stuck it on the wall of the double-sized cubicle that I shared with him.  Soon the cubicle was encircled with little yellow notes, each with a number from 1 to 30.

"This shows me how many days that I have left", Bruce explained.  "I'll tear one down each day, and it will remind me of how much time is remaining."

For the next month, the first thing that Bruce did every morning was dramatically tear off the note with the lowest remaining number.  As the days passed, he was making good progress but it wasn't at all clear that he was going to make it.

When there were only three notes left, I began to wonder what was going to happen if Bruce missed the deadline.  The resource manager was mostly working now, but he didn't seem to be on a path to closure, as he continued to refine the design.

Finally, there was only one note left on the wall.  But when Bruce came in that morning, he had a new pad of yellow notes, and instead of taking the last one down, he wrote another ten numbers and posted them up, before taking down the previously final note.  I started to laugh.

"It's overtime", he explained.  "I swear I'll really be done in ten more days."

I was waiting for Bob Belleville to confront him, and tell him that he missed the deadline, but Bob wisely saw that the resource manager was far enough along that it could stay.  And Bruce really did finish in the next ten days, kind of.