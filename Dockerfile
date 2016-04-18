FROM tutum/mongodb
MAINTAINER Fredrik Teschke <f@ftes.de>

# run as replica set instead of master/slave
RUN sed -i 's/--master/--replSet rs0/' run.sh

# before changing the password, the replication set has to be initialized
RUN sed -i '/\$cmd \&/a \
./init-replica-set.sh' run.sh

ADD init-replica-set.sh ./init-replica-set.sh
