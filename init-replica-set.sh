# prevent run.sh from creating user right away (have to init replication first)
#touch /data/db/.mongodb_password_set

# run parent script
# run in same shell (not forked sub-shell) -> important, otherwise mongod somehow isn't forked and blocks everything else
#. ./run.sh

#if [ ! -f /data/db/.mongodb_replset_init ]; then
    # wait until mongo is running
    RET=1
    while [ $RET -ne 0 ]; do
        echo "=> Waiting for confirmation of MongoDB service startup"
        sleep 5
        mongo admin --eval "help" >/dev/null 2>&1
        RET=$?
    done

    echo "initiating replication set in MongoDB using rs.initiate()"
    mongo admin --eval "rs.initiate();"

    echo "=> Done!"
#    touch /data/db/.mongodb_replset_init
#fi

# now set password (previously skipped in run.sh)
#/set_mongodb_password.sh
