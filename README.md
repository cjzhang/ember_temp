ember_temp
==========

A thing to learn Ember with. Also a clicky game.


TODO LIST (in rough order)
==========

item boxes - maybe? as quest rewards

more levelQuests (get A, B, C mons to level Y)

Quests. Some sort of gambling system rolled in as part of them, maybe.

quest and upgrade unlocking based on level

totalLevel quest (get X total levels between your party)

pokemon that can't be bought from the pokemon store (obtained through quests instead)

multiple save files to save to or load from

tradeQuest - take mon of level X and trade it for an unbuyable mon

quests view needs a selector (so you select the quest to see its description and get the option to complete it)

trainerQuest - give your potions and pokeballs and start a timedEvent that, when it finishes, deletes X potions and X pokeballs from inventory and adds a pokemon to the pokemon store

timedEvents - shop restock (restock to X levels, not just add X amount each time period), quest to add more pokeman to shop, pokemon eggs

shiny pokemons:
upgrade to make the active pokemon produce eggs as a timedEvent (but it'd only tick down for the pokemon that's currently active)

hatching egg adds 1 to the numAvailable in the store for that pokemon (meaningless for buyable pokemons, but good for unbuyable ones)

rare chance to hatch a shiny poke (which also adds to the store and has a perSecond rate equal to its nonshiny version; multiple quantity does nothing)

More upgrades, more items

rebalancing of numbers

Refactor things (everything) to be more clean. OH GOD EVERYTHING BREAKS.

Make stats pane have more stats. List upgrades bought.

Add content to the about pane.

Add more CSS to make things look nicer. Make items more pretty. 

Debug panel?? Or maybe just a debug setting or something.

Improve log panel to do that whole "xN" thing instead of duping the row


Nice to Have
============

Menu options, content in the about pane.

Changelog.

Import/export of saves

More styling on tooltips and the notice/alert message.

Tuning on the actual numbers, yeah right.

Cheevos.

Ascension. (resetting gives you small medals based on behavior, which can then be spent in the medal store for permanent upgrdes or to start with extra stuff)



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