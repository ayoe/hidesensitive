ARCHS = armv7 arm64
GO_EASY_ON_ME = 1

include theos/makefiles/common.mk

TWEAK_NAME = HideSensitive
HideSensitive_FILES = Tweak.xm
HideSensitive_FRAMEWORKS = UIKit Foundation
HideSensitive_LIBRARIES = applist

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += hidesensitive
include $(THEOS_MAKE_PATH)/aggregate.mk
