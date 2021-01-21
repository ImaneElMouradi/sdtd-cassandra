#!/bin/bash

#RUN CASSANDRA DB SERVICE
cassandra -R &
sleep 60

#INITIALIZE CASSANDRA TABLES
cqlsh -f init_cassandra.cql
while true; do sleep 1000; done