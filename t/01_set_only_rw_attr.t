#!/usr/bin/perl;

use strict;
use warnings;

use Test::Most qw{no_plan bail};

#-----------------------------------------------------------------
#  
#-----------------------------------------------------------------
BEGIN {

package My::Test;
use Moose;
with qw{ MooseX::MutatorAttributes };

has num => (
   is => 'rw',
   isa => 'Int',
);


} #END BEGIN

#---------------------------------------------------------------------------
#  
#---------------------------------------------------------------------------
my $o  = My::Test->new();
isa_ok(  $o, 
         'My::Test', 
         q{[My::Test] new()},
);

my $store = {};
ok( $o->set_only_rw_attr( $store, num => 12, str => 'hello' ) );
is( $o->num, 12);
eq_or_diff (
   $store,
   { str => 'hello' },
);

