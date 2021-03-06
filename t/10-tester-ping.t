#!/usr/bin/env perl

use warnings;
use strict;

use Test::More;

use IO::Async::Loop;

use Hello::Tester::ping;

my $loop = IO::Async::Loop->new;

{
  my $t = Hello::Tester::ping->new(
    loop    => $loop,
    name    => "ping",
    ip      => "127.0.0.1",
  );

  ok($t->test->then_done(1)->else_done(0)->get, "ping to localhost succeeds");

  my $t2 = Hello::Tester::ping->new(
    loop    => $loop,
    name    => "ping fail",
    ip      => "126.0.0.1",
    timeout => 5,
  );

  ok($t2->test->then_done(0)->else_done(1)->get, "ping to nowhere times out");
}

done_testing;
