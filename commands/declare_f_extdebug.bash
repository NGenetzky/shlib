#!/bin/bash

declare_f_extdebug()
{
    # https://superuser.com/a/974066

    # Turn on extended shell debugging
    shopt -s extdebug
    # Display the function’s name, line number and fully qualified source file
    declare -F ${1?"1:Specify name of function"}
    # Turn off extended shell debugging
    shopt -u extdebug
}
