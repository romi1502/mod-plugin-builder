######################################
#
# fabla
#
######################################

FABLA_VERSION = 1f8dd82066d088f4ffd304f9ef862c1764a7dde3
FABLA_SITE = $(call github,harryhaaren,openAV-Fabla2,$(FABLA_VERSION))
FABLA_CONF_OPTS=-DBUILD_GUI=OFF
FABLA_BUNDLES = fabla2.lv2

define FABLA_POST_PATCH_STATIC_KIT
	cp -rL $($(PKG)_PKGDIR)/staticKit $(@D)/src/dsp/
endef

define FABLA_POST_INSTALL_TARGET_TTLFILES
	cp -rL $($(PKG)_PKGDIR)/fabla2.lv2/* $(TARGET_DIR)/usr/lib/lv2/fabla2.lv2/
endef

FABLA_POST_PATCH_HOOKS += FABLA_POST_PATCH_STATIC_KIT
FABLA_POST_INSTALL_TARGET_HOOKS += FABLA_POST_INSTALL_TARGET_TTLFILES

$(eval $(cmake-package))
