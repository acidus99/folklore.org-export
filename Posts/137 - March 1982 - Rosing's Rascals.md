---
post: 137
title: Rosing's Rascals
date: March 1982
author: Andy Hertzfeld
characters: Bill Atkinson, Wayne Rosing, Dan Smith, Frank Ludolph, Steve Jobs, Bruce Horn
topics: Software Design, Lisa, User Interface, Management
summary: The Lisa Filer was radically redesigned with no time to spare
---

# Rosing's Rascals
* Author: Andy Hertzfeld
* Story Date: March 1982
* Topics: Software Design, Lisa, User Interface, Management
* Characters: Bill Atkinson, Wayne Rosing, Dan Smith, Frank Ludolph, Steve Jobs, Bruce Horn
* Summary: The Lisa Filer was radically redesigned with no time to spare

By the spring of 1982, the Lisa User Interface was finally settling down, and the software team was working feverishly to get everything ready to ship by their deadline in the fall.  Most of the applications were shaping up, although myriad problems remained, and the team could finally sense a glimmer of light at the end of the long tunnel.


Dan Smith and Frank Ludolph were working on the Lisa Filer, the key application that managed files and launched other applications.  It was beginning to come together, but Dan was still unsatisfied with the current design. 

The Filer was based on a dialog window that prompted the user to select a document from a list, and then select an action like "Open", "Copy" or "Discard", and then answer more questions, depending on the selected action.  There was so much prompting that it became known as the "Twenty Questions Filer".  Dan thought that it wasn't easy or enjoyable to use, but there just wasn't enough time left in the schedule for further experimentation, so they were pretty much stuck with it.

One afternoon, Dan mentioned his dissatisfaction to Bill Atkinson, the main designer of the Lisa User Interface.  Bill suggested that they meet that evening at his home in Los Gatos for a brain-storming session to see if they could come up with a better design, even though it was probably too late to use it for the initial release.

Bill favored a more graphical approach, and wanted to use small graphical images to represent files, which could be manipulated by dragging them with a mouse.  He remembered an interesting prototype that he saw at M.I.T. called Dataland, where data objects could be spatially positioned over a large area.  He adapted the idea for Lisa, allowing icons representing files and directories to be positioned on a scrolling, semi-infinite plane.

After a couple of nights of fiddling around, Dan and Bill had an interesting mock-up going, with icons representing documents and folders, complete with a trash can with flies buzzing around it.  The icons used a mask bitmap to define their borders, so irregular shapes could be rendered seamlessly on the gray desktop.  The new design seemed to have the simplicity and elegance that they were striving for, so they began to get excited.

They were both eager and afraid to show the mock-up to the rest of the team, since the design of the Filer was supposed to be frozen, and embarking on such a major revision would surely slip the schedule, which was already precariously close to unrealizable.  They gathered up their courage and approached Wayne Rosing, the Lisa Engineering Manager, and explained their dilemma.

Wayne appreciated the potential of the new approach, but wasn't ready to slip the schedule to accommodate it.  He thought it was perhaps barely possible to go with both the new design and the current schedule, if they could turn the mock-up into a solid working prototype in record time.  He proposed a deal:  he gave them permission to work on the new design in secret for the next two weeks.  If they had a robust, stable prototype by then, he promised to support it.  If they didn't, Bill and Dan promised to forget it and work to finish the earlier design.

Wayne extracted one additional promise from Bill: under no circumstances was he to show the mock-up to Steve Jobs.  Wayne knew that Steve would have a strong reaction and would probably wreak havoc with the schedule accordingly.  He didn't want Steve to see it until they knew if they could pull it off.

Bill was used to showing off his latest advances to the Mac team, and this new, icon-based approach to file management was a particularly important one.  Bruce Horn had started working on the Mac team the previous month, and he was already starting to develop our file manager, which Bud had christened "The Finder".   Bruce had similar ideas about spacial filing, and he and I had created a prototype called the "micro-finder" which represented files as tabs that were spacially organized on a picture of a diskette.  Bill thought it was important for us to see the new direction as soon as possible, so he left us a copy of his prototype, under strict instructions not to show it to Steve.

We had a few close calls over the next couple of weeks as we played with the prototype, frantically quitting it when we heard Steve approaching.  Finally, on the last day before the deadline expired, we must have cut it too close, because Steve knew that we were hiding something from him.   We explained our promise to Bill, but Steve still demanded to see it, so we had to show it to him.   He immediately fell in love with it, and ran off to talk to Bill and Wayne about it, just as we feared.

Luckily, the development had gone well the last two weeks, and Wayne was ready to commit to the new approach and unveil it to the entire team.  He called an all-hands meeting, to which Bill, Dan, Frank and Wayne wore newly minted T-Shirts labeled "Rosing's Rascals".   Wayne explained the surreptitious nature of the two week effort to the team while Bill set up the demo.  Rosing's rascals had pulled it off, endowing the Lisa with a much more intuitive file manager that quickly became a hallmark of Apple's new user interface.