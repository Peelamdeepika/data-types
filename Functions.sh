#!/bin/bash
validate() {
    SUM=$ ( ( $1+$2 ) )
}

validate 200 300
echo " finally the sum is $SUM"