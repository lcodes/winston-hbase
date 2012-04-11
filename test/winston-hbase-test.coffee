# -*- mode: Coffee; tab-width: 4; fill-column: 80; comment-column: 40; -*-

winston = require "winston"
hbase = require "../lib/winston-hbase"

winston.level = "silly"

winston.add winston.transports.HBase,
    level: "silly"
    host: "localhost"
    port: 8080
    table: "log"

winston.silly walk:
    argument: (clinic) -> argument clinic
    parrot: dead: true
