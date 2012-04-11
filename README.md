
winston-hbase
=============

A [HBase](https://github.com/wdavidw/node-hbase) transport for the
[winston](https://github.com/orlandov/node-mongodb) logger written in
[coffee-script](http://coffeescript.org/).


Installation
------------

Using [npm](https://github.com/isaacs/npm):

```bash
    $ npm install winston-hbase
```


Synopsis
--------

```coffee
    winston = require "winston"
    require "winston-hbase"

    winston.add winston.transports.HBase,
        level: "silly"
        host: "localhost"
        port: 8080
        table: "log"

    winston.silly walk:
        argument: (clinic) -> new Argument clinic
        parrot: dead: true
```


Related projects
----------------

* Official Apache HBase project: <http://hbase.apache.org/>
* HBase client for node.js: <https://github.com/wdavidw/node-hbase>
* Winston logging for node.js: <https://github.com/flatiron/winston>
* CoffeeScript language: <http://coffeescript.org/>


License
-------

(The MIT License)

Copyright (C) 2012 Jeremie Pelletier <jeremiep@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
