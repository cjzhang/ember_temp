ember_temp
==========

A thing to learn Ember with. Also a clicky game.


TODO LIST (in rough order)
==========

Quests. Some sort of gambling system rolled in as part of them, maybe.

Content? Need more upgrades and items, need images for the extra mons, need the reskin to make it pokemon themed. Need to make the base numbers harder now that there's upgrades and stuff that make it easier.

Refactor things (everything) to be more clean. OH GOD EVERYTHING BREAKS.

Make stats pane have more stats. List upgrades bought.

Add content to the about pane.

Add more CSS to make things look nicer. Make items more pretty. 

Debug panel?? Or maybe just a debug setting or something.

Improve log panel to do that whole "xN" thing instead of duping the row

Shiny pokemans.



Nice to Have
============

Menu options, content in the about pane.

Changelog.

Import/export of saves

More styling on tooltips and the notice/alert message.

Tuning on the actual numbers, yeah right.

Cheevos.

Ascension.



Guides
==========

To add a new upgrade:
1. Create upgrade, bind it to a modifier.
2. Add modifier that it activates, and bind the modifier to a monster.
3. The monster fixture needs a link to the modifier it owns, so the modifier id has to be shoved into the fixture as well.
4. If the upgrade's not unlocked by default, the unlock trigger needs to be added to the code somewhere (quantity trigger already in).
5. If the modifier behavior type isn't already accounted for, that needs to be added too.


To add something to be saved:
1. Shove it in ApplicationRoute.save action's blueprint, then the two sets of lower-case keys in the save and load methods.