package MooseX::MutatorAttributes;
use Moose::Role;
use Carp;


=head1 NAME

MooseX::MutatorAttributes - Moose Role to add a quick set method that returns self

=head1 VERSION

Version 0.02

=cut

our $VERSION = '0.02';


=head1 SYNOPSIS

I got tired of doing this:

    $obj->attr1($value1);
    $obj->attr2($value2);
    $obj->method_that_uses_attr;

What I wanted to do was:

    with qw{MooseX::MutatorAttributes};
    $obj->set( attr1 => $value1, attr2 => $value2 )->method_that_uses_attr;


Now I can, and so can you.

=head1 METHOD

=head2 set

    $self->set( HASH );

Set takes a hash, keys are expected to be attributes, if they are not then we Carp::croak. If a key is an acceptable 
attribute then we attempt to set with $value.

=cut

sub set {
   my ($self, %opts) = @_;
   foreach my $attr (keys %opts) {
      if ( defined $self->meta->{'%!attributes'}->{$attr} ) {
         $self->$attr( $opts{$attr} );
      }
      else {
         croak sprintf( q{[!!!] $s is not an attribute to set }, $attr);
      }
   }
   return $self;
}

=head1 AUTHOR

ben hengst, C<< <notbenh at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-moosex-setter at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=MooseX-MutatorAttributes>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc MooseX::MutatorAttributes


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=MooseX-MutatorAttributes>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/MooseX-MutatorAttributes>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/MooseX-MutatorAttributes>

=item * Search CPAN

L<http://search.cpan.org/dist/MooseX-MutatorAttributes>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2008 ben hengst, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

1; # End of MooseX::MutatorAttributes
