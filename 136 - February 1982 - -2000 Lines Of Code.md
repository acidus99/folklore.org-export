---
post: 136
title: -2000 Lines Of Code
date: February 1982
author: Andy Hertzfeld
characters: Bill Atkinson
topics: Software Design, Management, Lisa
summary: It's hard to measure progress by lines of code
---

# -2000 Lines Of Code
* Author: Andy Hertzfeld
* Story Date: February 1982
* Topics: Software Design, Management, Lisa
* Characters: Bill Atkinson
* Summary: It's hard to measure progress by lines of code

In early 1982, the Lisa software team was trying to buckle down for the big push to ship the software within the next six months.  Some of the managers decided that it would be a good idea to track the progress of each individual engineer in terms of the amount of code that they wrote from week to week.  They devised a form that each engineer was required to submit every Friday, which included a field for the number of lines of code that were written that week.


Bill Atkinson, the author of Quickdraw and the main user interface designer, who was by far the most important Lisa implementor, thought that lines of code was a silly measure of software productivity.  He thought his goal was to write as small and fast a program as possible, and that the lines of code metric only encouraged writing sloppy, bloated, broken code.

He recently was working on optimizing Quickdraw's region calculation machinery, and had completely rewritten the region engine using a simpler, more general algorithm which, after some tweaking, made region operations almost six times faster.  As a by-product, the rewrite also saved around 2,000 lines of code.

He was just putting the finishing touches on the optimization when it was time to fill out the management form for the first time.  When he got to the lines of code part, he thought about it for a second, and then wrote in the number: -2000.

I'm not sure how the managers reacted to that, but I do know that after a couple more weeks, they stopped asking Bill to fill out the form, and he gladly complied.

