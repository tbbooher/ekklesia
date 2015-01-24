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

Another problem: donating to one legislator subscribes to their entire policy base, including other policies you may not know about or actually oppose.

Why this happens: Becoming well-informed and taking collective action is _hard_.

openPAC is a platform where a user can easily find out which legislators support the issues he/she cares about and easily make a donation to that cause, diversified across those legislators (as opposed to giving it all to one politician). To do this, a search returns two types of results:
- legislators' relative positions on the issue (in terms of left/right) based on quantitative data 
- user-generated 'stances' that express an opinion regarding which legislators support a given position

## MVP Stories
As a user..

* I can take a 'stance' on a political issue I care about and present the legislators that I believe support my position
 * The legislators must come from our legislator database, which comes from the Sunlight Foundation (SF) API
* I can easily search for my own political issue, and see all 'stances' that other users have taken on the issue
* I can view any legislator's profile, which shows basic information about that legislator.

## More Stories (wip)
As a user..

- once I identify the politicians that support my cause, I can make a donation to that cause, diversified across multiple politicians as I see fit (using the Stripe API)
- I can highlight a state on the homepage map to see legislator data for that state
- I can search my issue and see the where legislators stand on the issue relative to democrats and republicans

#### Trello Board
https://trello.com/b/ZnYW0S9G/openpac
