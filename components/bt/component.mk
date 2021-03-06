#
# Component Makefile
#

#COMPONENT_ADD_INCLUDEDIRS := 

CURRENT_DIR=$(IDF_PATH)/components/bt

COMPONENT_ADD_INCLUDEDIRS := ./include

CFLAGS += -Wno-error=unused-label -Wno-error=return-type -Wno-error=missing-braces -Wno-error=pointer-sign -Wno-error=parentheses

LIBS := btdm_app

COMPONENT_ADD_LDFLAGS := -lbt -L$(abspath lib) \
                           $(addprefix -l,$(LIBS)) \
                          $(LINKER_SCRIPTS)


ALL_LIB_FILES := $(patsubst %,$(COMPONENT_PATH)/lib/lib%.a,$(LIBS))
$(COMPONENT_LIBRARY): $(ALL_LIB_FILES)

COMPONENT_SRCDIRS := ./

include $(IDF_PATH)/make/component_common.mk
