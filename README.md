A lua module that automatically creates a hardcoded table of a student's grade, with the values stored in a data template.
> Originally made for https://you-zitsu.fandom.com/id, but it should (?) work on any MediaWiki-based sites.
> 
> Understandably, you'd have to configure everything yourself from the beginning since I'm lazy to not make this entire thing hardcoded.

# Using it
The easiest way to go about it is just copying what's inside _[call.lua](https://github.com/statsduck/grade-table/blob/main/call.lua)_, then go to your wiki, and create two things:
1. A **Module:TabelOAA**, and a **Template:Penilaian/Data**
2. Paste _call.lua_ inside the _Module:TabelOAA_

Then, inside _Template:Penilaian/Data_, create a list of students with their grades in the following format:
> **<code>student name;value1;value2;value3;value4;value5</code>**

Then, create a template named whatever you want, and paste this:
> **<code>{{#invoke:TabelOAA|main|nama={{#if: {{{nama|}}}|{{{nama}}}|{{PAGENAME}}}}}}</code>**

Where:
1. It invokes the module...
2. Checks the nama param:
   1. If given one, it'll search that name in _Penilaian/Data_, and take their grades
   2. If not, then it'll use the page's title, which is assumed to have the student's name.
