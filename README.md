# openPAC

## Team Members
- Brian Borge
- Don J. Kahn
- Dylan Shine
- HanGyeol "Hailey" Ryu
- Peter Jahnes

## Concept
In 2012, super PACs spent a billion dollars; seventy-three percent of the money came from a hundred people.

The problem: a republican democracy is meaningless when only big-dollar candidates make it past the primaries. In other words, when the money is doing the nominating, elections don’t mean much.

Another problem: donating to one politician subscribes to their entire policy base, including other policies you may not know about or actually oppose.

Why this happens: Becoming well-informed and taking collective action is _hard_.

openPAC would be a platform where a user can easily find out which politicians support the issues he/she cares about and easily make a donation to that cause, diversified across those politicians (as opposed to giving it all to one politician).

## MVP Stories
As a user..

* I can create 'campaigns' where I present a political issue I care about and present the politicians that I believe support that cause
 * The politicians must come from our politician database, which comes from the Sunlight Foundation (SF) API
* I can easily search for my own political issue, and see all 'campaigns' that other users have created related to my issue
* I can view any politician's profile, which shows basic information that comes from the SF API

## More Stories (wip)
As a user..

- once I identify the politicians that support my cause, I can make a donation to that cause, diversified across multiple politicians as I see fit (possibly using the Stripe API)
- I can view any politician's profile, which shows me data from the Sunlight Foundation's Congress API
- I can filter results by geographical area / election
- I can relate voting history to politicians' positions on issues
- I can infer bill content (and their position relative to an issue) based on the bill authors' voting history

#### Trello Board
https://trello.com/b/ZnYW0S9G/openpac
