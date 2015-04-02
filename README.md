#Team: BillFinity

Representatives must be held accountable to their constituents.

Our country’s policies are the result of our legislators’ decisions, which are formed in response to a multitude of influences, many of which have no place in the political arena. Undue influences from campaign donors, lobbyists, and other private interests work to sway legislators from representing the true will of the people. Even the most-well intentioned representatives still lack a clear, comprehensive way of determining where their constituency's values lie. Unless these representatives have clear constituent polling results, they are often incentivized to vote along party lines or face losing valuable party funds in the next election.

Representatives are not held accountable for how well they represent constituents unless the constituents are given a meaningful voice.  We plan to foster citizen participation by producing important and useful metrics. By pinpointing constituent ideology on social and fiscal axes, this information can be compared with that of the representative, determining the quality of their representation.

Reps will know what voters want.  Voters will know if Reps are representing.  There’s no excuse ...

Team Members:

* Nick Mastronardi
* Tim Booher
* Don Kahn
* Mark Coyne
* Lia Mastronardi
* Dylan Cooper
* Kyle Rivers
* Adam Rosszay
* Leo Blondel
* Juan Mena
* Betty Lo
* Kris Gosselin

Nick's thoughts:

if we knew a user's political ideology (f & s score exactly - a trivia distribution) and a bill's location exactly then any ordered metric such as the euclidean metric would be fine, but since these estimates are necessarily noisy to start and we thus have distributions this mutual information is good probability/risk adjusted measure.
if the distributions are identical and collocated the affinity measure returns 1.
if they are independent the measure returns 0.
thus bills highest in the queue are the furthest from .5, and the ones to the bottom are nearest .5.
if multiple bills have the same affinity score (eg multiple bills are independent from the user's distribution and all return 0), then a tie breaker could simply be the euclidean distance of the distribution centroids.

Team Resources:

* CandS@googlegroups.com
* [google drive presentation](https://drive.google.com/folderview?id=0Bwu8eTDdx4G5fmtlcDI2MGJySHZzVzduOXRsRjNCeHgxbnNVWVU2QlBCaUd6OGFuT2QxbEU&usp=sharing)