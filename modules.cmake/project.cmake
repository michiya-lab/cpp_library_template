########################################################################################
### Definittion  : USE_DEFINITTION1, USE_DEFINITION2, ...
### Source Dir.  : TEMPLATE_SOURCE_DIR
### Include Dir. : TEMPLATE_INCLUDE_DIR
########################################################################################
set_property(GLOBAL PROPERTY PATH_TEMPLATE_MODULE "${CMAKE_CURRENT_LIST_DIR}")
macro(LOAD_DEFINITION_TEMPLATE_MODULE MACRO_ARG)
    ### You can change USE_DEFINITION (cmake arg) and ENABLE_DEFINITION (source)
    ### ex. cmake -DUSE_DIFINITION=ON ../
    option(USE_DEFINITION1 "Use definition" OFF)
    if(USE_DEFINITION1)
        target_compile_definitions(${MACRO_ARG} PRIVATE ENABLE_DEFINITION1)
    endif()
    option(USE_DEFINITION2 "Use definition2" OFF)
    if(USE_DEFINITION2)
        target_compile_definitions(${MACRO_ARG} PRIVATE ENABLE_DEFINITION2)
    endif()
endmacro()
macro(SET_TEMPLATE_VARIABLES)
    get_property(MY_MODULE_PATH GLOBAL PROPERTY PATH_TEMPLATE_MODULE)
    if(NOT DEFINED TEMPLATE_LIB_NAME)
        set(TEMPLATE_LIB_NAME "TEMPLATE")
        get_property(
            MY_MODULE_PATH
            GLOBAL PROPERTY
            PATH_TEMPLATE_MODULE
            )
        set(
            TEMPLATE_SOURCE_DIR
            "${MY_MODULE_PATH}/../src/child"
            "${MY_MODULE_PATH}/../src/parent"
            )
        set(
            TEMPLATE_INCLUDE_DIR
            "${MY_MODULE_PATH}/../src/child"
            "${MY_MODULE_PATH}/../src/parent"
            )
    endif()
endmacro()
macro(LOAD_DEPENDENCIES_TEMPLATE_MODULE MACRO_ARG)
    SET_TEMPLATE_VARIABLES()
    add_dependencies(${MACRO_ARG} ${TEMPLATE_LIB_NAME})
endmacro()
macro(LOAD_LINKS_TEMPLATE_MODULE MACRO_ARG)
    SET_TEMPLATE_VARIABLES()
    target_link_libraries(
        ${MACRO_ARG}
        PRIVATE ${TEMPLATE_LIB_NAME}
        )
endmacro()
macro(LOAD_INCLUDES_TEMPLATE_MODULE MACRO_ARG)
    SET_TEMPLATE_VARIABLES()
    target_include_directories(
        ${MACRO_ARG}
        PRIVATE ${TEMPLATE_INCLUDE_DIR}
    )
endmacro()
macro(LOAD_SETTING_TEMPLATE_MODULE MACRO_ARG)
    LOAD_DEPENDENCIES_TEMPLATE_MODULE(${MACRO_ARG})
    LOAD_LINKS_TEMPLATE_MODULE(${MACRO_ARG})
    LOAD_INCLUDES_TEMPLATE_MODULE(${MACRO_ARG})
    LOAD_DEFINITION_TEMPLATE_MODULE(${MACRO_ARG})
endmacro()
