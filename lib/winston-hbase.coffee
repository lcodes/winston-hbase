# -*- mode: Coffee; tab-width: 4; fill-column: 80; comment-column: 40; -*-

winston = require "winston"
hbase = require "hbase"

# Returns a function that takes an error and a value argument.
# When evaluated it will throw an Error if the error argument is not null.
# Otherwise it will call the given function with the value argument.
winstonCallback = (fn) ->
    (err, val) ->
        throw new Error err if err?
        fn val

class HBase extends winston.Transport
    # The name of the winston transport.
    name: "hbase"

    # Whether the hbase client is ready to insert log entries.
    ready: false

    # List of logs accumulated while the client is initializing.
    _logs: []

    constructor: (options) ->
        @client = hbase
            host: options.host ? "localhost"
            port: options.port ? 8080
            timeout: options.timeout ? 60000

        # TODO db number
        # TODO auth

        @table = @client.getTable options.table ? "log"
        @table.exists winstonCallback (exists) =>
            if !exists then @$createTable() else @$setReady()

    $createTable: ->
        @table.create "log", winstonCallback (success) =>
            throw new Error "Failed to create hbase log table." unless success
            @$setReady()

    $setReady: ->
        @ready = true
        @$log e for e in @_logs
        @_logs = []

    columnNames: ["log:timestamp", "log:level", "log:message", "log:metadata"]

    log: (level, msg, meta, callback) ->
        return if not level? or not msg?
        entry =
            timestamp: (new Date).getMilliseconds()
            level: level
            msg: msg
            meta: meta ? {}
        if @ready then @$log entry else @_logs.push entry

    $log: (e) ->
        row = @table.getRow e.timestamp # TODO: salt the key with something, if
                                        # two machines log at the same
                                        # millisecond only the last to save is
                                        # kept

        row.put @columnNames, [e.timestamp, e.level, e.msg, e.meta], winstonCallback (success) =>
            throw Error "Failed to insert log in HBase" unless success

exports.HBase = HBase
winston.transports.HBase = HBase
