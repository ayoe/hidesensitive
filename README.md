Hide Sensitive
============

CYDIA REPO (if you're not interested in the source code): http://cydia.myrepospace.com/d4rkh0rse/

![screen1](http://i.imgur.com/4heFeoW.png)

This tweak is designed to give you the option to select certain keywords or certain apps which will not be allowed on the lock screen.

For example, if you flag the keyword "foo", any notification sent to your phone with "foo" in its content will be replaced with "sensitive content hidden" on the lock screen.

If you choose to black list, say, Messages, all Messages notifications content will be replaced with the aforementioned text.

Please don't make fun of the mess that is my code D:

Information
============

As of version 0.1, we are now in open beta! Please help in any way you can.

As of version 0.2, we are basically in a state to be released to a default repo. I want to see if I can get more features in this tweak first, though. Keep sounding off with ideas!

As of version 1.0, the tweak is ready for release and is being published to a default repo.

Changelog
============

v 0.1-8: fixed WhatsApp's bundle identifier and added a prefs bundle that does nothing as of now

v 0.1-13: thought blocking NC on lock screen would be a good idea

v 0.1-14: it wasn't.

v 0.1.1-1: working preference bundle! looking deeper into applist, for the time being there is a master kill switch

v 0.1.1-2: added Instagram, Kik, Twitter, Gmail, and Pinterest to the list

v 0.1.1-3: added a new "keywords" feature - block notifications with certain keywords. feel free to clone and add your own! but please also tell me what you're adding thanks

v 0.1.2-1: keywords are officially open to user input! KNOWN BUG: sometimes keywords fail to save over respring. this doesn't always happen. also, no need to respring to apply.

v 0.2-1: keywords actually do save through resprings? idk what i was seeing before. ANYWAY: BIG THINGS! You may now define which applications you wish to be blocked in Settings.

v 0.2.1-1: sensitive notifications on lock screen will now be hidden from notification center, too.

v 1.0-1: ready for release

v 1.0-13: removed notification center blocking as it was causing issues on Touch ID devices

v 1.0-14: added the option to use both keywords and app blocking

Credits
============

thank you google for the inspiration

Code written by me

Thomas Finch's Priority Hub helped me when I had no idea where to start - thanks.

Thanks to Ryan Petrich's AppList and PushPrivacy (which taught me how to use AppList)