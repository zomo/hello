package Hello::Tester::true;

use 5.020;
use warnings;
use strict;

use Moo;
with 'Hello::Tester';

sub test {
  return Future->done;
}

1;
