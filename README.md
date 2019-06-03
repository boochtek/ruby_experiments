Ruby Experiments
================

This repo contains a set of experiments in Ruby.
Most of the experiments are changes to the core library.
We might include some changes to Ruby's syntax as well.
Some of these experiments are meant to test out some functionality,
with the end goal of adding the functionality to Ruby itself.
Others are merely thought experiments.


Experiments
-----------

### Propagating Nil

This gem will prevent `NoMethodError` on `nil`.
It does this by implementing `method_missing` on `nil` to always return `nil`.
This likely negates the need for `try` and the safe navigation operator (`&.`).
However, we've identified a few situations where this might cause serious issues.

### Enumerable Nil

This gem attempts to solve much of the problem that the Propagating Nil gem solves.
However, it's much more limited in scope.
The idea is that in most cases where you have a nil, you were expecting an array or a hash.
In this case, we can treat `nil` just like an empty hash or an empty array.
This seems more likely to not cause any problems.

While this could probably be added to Ruby without any issues,
Matz is pretty conservative, so it's unlikely that he would approve it.
It might make some sense to look into getting this added to Crystal,
but it's probably less helpful in a statically-typed language.

### Enumerable Object

This gem takes the idea from Enumerable Nil, but also applies it to scalar objects.
If you expect to have an array (or other enumerable) but end up with a scalar,
the code will still work; it'll just operate on the single object instead of a collection.

This is more of a thought experiment than a serious proposal.
However, I'm considering implementing something like this for Stone.

### Better Digging

This gem extends Ruby's `dig` method.
It adds the option to specify a default value (via a block) to be more similar to `fetch`.
It also adds a `dig!` method, which allows in-place manipulation of the object that it retrieved.

This gem is meant to test out ideas to hopefully be integrated into Ruby itself.

TODO: Move this over from its own repo (and rename it).
