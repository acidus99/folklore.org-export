---
post: 62
title: RMaker
date: March 1983
author: Andy Hertzfeld
characters: Andy Hertzfeld, Bob Belleville, Bruce Horn, Dan Cochran, Jerome Coonen, Bill Duvall, Barry Haynes
topics: Technical, Software Design, Prototypes, LaserWriter, Lisa, Lisa Rivalry
summary: A wild hack is added to the resource compiler
---

# RMaker
* Author: Andy Hertzfeld
* Story Date: March 1983
* Topics: Technical, Software Design, Prototypes, LaserWriter, Lisa, Lisa Rivalry
* Characters: Andy Hertzfeld, Bob Belleville, Bruce Horn, Dan Cochran, Jerome Coonen, Bill Duvall, Barry Haynes
* Summary: A wild hack is added to the resource compiler

The resource manager became stable enough for other parts of the Toolbox to use in the fall of 1982.  At first, only the dialog manager (which was also written by Bruce Horn) used resources, but soon they began to spread inexorably throughout the system.  By early 1983, we were using resources to define windows, menus and controls, but we didn't have a decent way for developers to specify them.

Bruce had written a "dialog compiler" that read in a terse text-based description of a dialog and created the corresponding dialog resources. In February 1983, I expanded it into a general resource building tool that I called "RMaker", which ran on a Lisa and built a resource file from a text-based description. RMaker allowed arbitrary resources of any type to be specified in hexadecimal, and provided some specialized formats for specific types like windows or menus.  For an example of an RMaker source file, click here to see MacPaint's resource definition file.

The Macintosh was built around the Motorola 68000 microprocessor, which was an amazing chip for its day, but it did have a few problematic limitations.  The instruction set was missing a way to specify a long relative branch, and absolute branches were forbidden since we needed our code to be position independent.  This meant that the maximum size of a hunk of code was limited to the range of a relative branch, which was 32K bytes.

That wasn't nearly enough big enough for Lisa applications, so the Lisa development system supported multiple code "segments", stitched together with a jump table for inter-segment references.  Since the Macintosh had much less memory than the Lisa, I thought that we could forgo more complicated machinery and get away with supporting only a single code segment per application, and that's what we did at first.  But of course I was wrong.

In March 1983, Jerome Coonen came to me with a worried look on his face.  Apparently, three different developers started running up against the 32K code size limitation all at once, and he didn't know what we could do about it.  The schedule was already barely achievable, and it didn't seem possible to implement a multi-segment loader in the required time frame.  He asked me what I thought we should do.

Even though I hadn't thought much about it before, it seemed clear to me that we should keep the code segments in resources, since that's what we were doing with just about everything else these days.  We'd have to write a little bit of tricky code to create, load and maintain the jump table, but that didn't seem so bad.  I told Jerome that I thought I could have a resource-based multi-segment loader going in less than a week.

Jerome was surprised, thinking that it would take at least a month and asked me to get going on it right away.  I was a little hesitant, since my bad review from Bob Belleville a week or two ago was still fresh in my mind (see Too Big For My Britches), which made me less inclined to put in another heroic effort, but as usual I got excited about the new approach and dove in to try to accomplish it.

The hardest part of the job was writing a tool to extract the code from the output of the Lisa linker and turn it into code resources.  I was still working on polishing RMaker, and I realized that it was the perfect place to do the job.  I added some code to RMaker to build code resources and the jump table from object files, and was able to get a proof of concept multi-segment loader working in just a few days.

The Lisa linker supported two different sizes of jump table entries.  There was a 6 byte version, that just consisted of a single long jump instruction, to an absolute but virtual memory address, which relied on the memory management of the underlying OS to load the appropriate code.  The Macintosh didn't have any memory management hardware, so that wasn't possible for us.   Luckily, the linker also supported a 10 byte version, which didn't rely on virtual memory and made an explicit OS call to load the segment, which is what I used for my initial version.

It took four bytes to invoke a Lisa system call, but the Macintosh could do it in 2 bytes using a 'trap' instruction, so we really only needed 8 bytes per jump table entry.  8 bytes was a lot better than 10, since not only did it save precious memory, but it would keep everything aligned to 32-bit boundaries, which would eventually be important.  I thought it would be simple to modify the Lisa linker to support an 8 byte/entry jump table variant, but I didn't have the source code, so I requested that the Lisa group make the change for us.

But the engineer on the Lisa team that was responsible for the linker, who will rename nameless in this account, wasn't a fan of the Mac project and claimed that he had other, higher priority tasks to accomplish before he could get around to it.  He also refused to give me the source code, so I couldn't simply do it myself.   After a week or so,  I grew tired of waiting, and thought of a wild hack that would let me move forward without him.

The problem was that the linker generated jump table offsets for every inter-segment procedure invocation.   Since it thought that the jump table had 10 bytes/entry, I had to find and correct every jump table reference, multiplying it by 8/10 to adjust it for the 8 byte/entry jump table.  The jump table was only referenced by a few, specific op-codes, so I added a routine to RMaker to scan through the object code, identifying jump table references and patching them.   This wasn't bullet-proof, since the patch routine couldn't tell code from in-line data, so it might inadvertently patch something it shouldn't, despite the extra sanity checks that I threw in.   But I thought I could get away with it for the short while before a modified linker became available.

Even though I made repeated requests, the Lisa linker engineer didn't implement the 8 byte version of the jump table for more than nine months.  In fact, he never did, but in early 1984, he transferred to another project, and Barry Haynes, the engineer who replaced him, was able to accomplish it a few days after taking over the job, just as I was going on my leave of absence in March 1984, so we were finally able to eliminate RMaker's ugly hack.   It was a miracle that no one ever stumbled over it, at least as far as I know.

I went on leave of absence from Apple in March 1984 (see Leave Of Absence), but I still was excited about writing software for Macintosh as an independent developer, and was full of ideas about different programs to write.  But I wasn't happy about the fact that you still needed a Lisa to write software for the Mac;  among other things, the recent linker problem had left a bad taste in my mouth regarding the Lisa development system.  I had a Lisa at my house, but it really belonged to Apple, and I didn't want to have to buy one.   I decided to try to cobble together an entirely Mac-based development system.

Bill Duvall was an old friend of Bob Belleville's from Xerox who we seeded with a Mac prototype in the spring of 1983 so he could port his development system to it, including an assembler and a C compiler, to be sold by his own tiny company named Consulair.   His linker even generated Macintosh code resources, but there was no equivalent of RMaker for building the other resources required by a Mac application - you still had to do that on a Lisa.  I decided to rewrite RMaker for the Mac, so I could finally abandon the Lisa.  I used assembly language, since the assembler was much further along than Consulair C was at the time.  In a week or so, I had a new RMaker that was integrated with the Consulair tools, so you finally could write a complete application with just a Macintosh.

In the summer of 1984, I got a call from Dan Cochran, who was the marketing person at Apple in charge of developer tools.  He had heard about my new version of RMaker, and wanted to bundle it with the Consulair package.   After a bit of negotiation, I sold it to Apple in exchange for a brand new LaserWriter prototype.   I drove up to Bill Duvall's house in the Berkeley hills to help him incorporate RMaker into his system.   When my reward arrived in October, I thought it was pretty cool to be the first on my block to have a LaserWriter,  three months before it was officially announced.