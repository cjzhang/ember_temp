ember_temp
==========

A thing to learn Ember with. Also a clicky game.

Installing
==========

Pull the repo, install the gems, run the server. Completely straightforward.

Precompiling assets
==========

Eh, haven't gotten around to doing it, but it's all just coffeescript so there's probably a rake task.

References
==========
lib/ has utility functions (like for calculating estimated costs).
misc/ has code blueprints for ease of adding things

Guides
==========

To add a new upgrade:

1. Create upgrade, bind it to a modifier.

2. Add modifier that it activates, and bind the modifier to a monster.

3. The monster fixture needs a link to the modifier it owns, so the modifier id has to be shoved into the fixture as well.

4. If the upgrade's not unlocked by default, the unlock trigger needs to be added to the code somewhere (quantity trigger already in).

5. If the modifier behavior type isn't already accounted for, that needs to be added too.


To add something (like an attribute) to be saved:

1. Shove it in ApplicationRoute.save action's blueprint, then the two sets of lower-case keys in the save and load methods.

