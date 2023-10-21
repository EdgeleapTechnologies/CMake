function(configure_compiler_warnings
        target_name #input
)

    set(EDGELEAP_MSVC_WARNINGS
        /W4
        /WX
        /w14265 # class with virtual functions and non-virtual destructor
        /w14640 # thread un-safe static member initialization
        /permissive-
    )

    set(EDGELEAP_WARNINGS
        -Wall
        -Wextra
        -Wshadow
        -Wnon-virtual-dtor
        -Wcast-align
        -Woverloaded-virtual
        -Wpedantic
        -Wconversion
        -Wsign-conversion
        -Wnull-dereference
        -Wformat=2
        -Werror
    )

    set(EDGELEAP_GCC_EXTRA_WARNINGS
        -Wmisleading-indentation
        -Wduplicated-cond
        -Wduplicated-branches
        -Wlogical-op
    )

    if(MSVC)
        target_compile_options(${target_name} PRIVATE ${EDGELEAP_MSVC_WARNINGS})
    else()
        if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU") # GCC Specific Warnings are added
            target_compile_options(${target_name} PRIVATE ${EDGELEAP_WARNINGS} ${EDGELEAP_GCC_EXTRA_WARNINGS})
        else()
            target_compile_options(${target_name} PRIVATE ${EDGELEAP_WARNINGS})
        endif()
    endif()

endfunction()
