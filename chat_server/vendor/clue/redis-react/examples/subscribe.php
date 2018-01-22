<?php

use Clue\React\Redis\Client;
use Clue\React\Redis\Factory;

require __DIR__ . '/../vendor/autoload.php';

$loop = React\EventLoop\Factory::create();
$factory = new Factory($loop);

$channel = isset($argv[1]) ? $argv[1] : 'channel';

$factory->createClient('localhost')->then(function (Client $client) use ($channel) {
    $client->subscribe($channel)->then(function () {
        echo 'Now subscribed to channel ' . PHP_EOL;
    });

    $client->on('message', function ($channel, $message) {
        echo 'Message on ' . $channel . ': ' . $message . PHP_EOL;
    });
});

$loop->run();
