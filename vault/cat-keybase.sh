#! /usr/bin/env bash


set -euo pipefail


MAX_RETRIES=5
MAX_TIMEOUT=30


function get_random_number() {
    local start=$1
    local end=$2
    local range_len=$(($end - $start))

    echo $(( ($RANDOM % $range_len) + $start ))
}


function to_power() {
    local base=$1
    local power=$2
    echo "$base^$power" | bc
}


function run_with_exponential_backoff() {
    local cmd=$*
    local timeout=0
    local failcount=0
    local secret=
    local return_code=1

    while :
    do
	set +e
        secret=`$cmd`
        return_code=$?
	set -e
        if [[ $return_code -eq 0 ]]
        then
            break
	fi

        timeout=$(( `get_random_number 0 1` + `to_power $failcount 2` ))
	failcount=$(( $failcount + 1 ))

        if [[ $failcount -ge $MAX_RETRIES ]]
        then
            >&2 echo Maximum number of retries of $MAX_RETRIES reached...
            exit 2
	fi

        if [[ $timeout -gt $MAX_TIMEOUT ]]
        then
            timeout=$MAX_TIMEOUT
	fi

        >&2 echo Will retry in ${timeout}s...
        sleep $timeout
    done

    echo $secret
}


run_with_exponential_backoff \
    keybase fs read \
    /keybase/private/webknjaz/github/webknjaz/ansible-gentoo-laptop/.vault_pass
