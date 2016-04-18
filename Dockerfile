FROM tutum/mongodb
MAINTAINER Fredrik Teschke <f@ftes.de>

# do not enable AUTH (https://docs.mongodb.org/v2.6/tutorial/deploy-replica-set-with-auth/#start-one-member-of-the-replica-set)
#ENV AUTH no

#RUN sed -i '1s;^;set -x\n;' run.sh
# run as replica set instead of master/slave
RUN sed -i 's/--master/--replSet rs0/' run.sh
RUN sed -i '/\$cmd \&/a \
./init-replica-set.sh' run.sh

ADD init-replica-set.sh ./init-replica-set.sh
