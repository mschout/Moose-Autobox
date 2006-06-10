package Moose::Autobox::String;
use Moose::Role;

our $VERSION = '0.01';

with 'Moose::Autobox::Value';

# perl built-ins

sub lc      { CORE::lc      $_[0] }
sub lcfirst { CORE::lcfirst $_[0] }
sub uc      { CORE::uc      $_[0] }
sub ucfirst { CORE::ucfirst $_[0] }
sub chomp   { CORE::chomp   $_[0] }
sub chop    { CORE::chop    $_[0] }
sub reverse { CORE::reverse $_[0] }
sub length  { CORE::length  $_[0] }
sub index   { 
    return CORE::index($_[0], $_[1]) if scalar @_ == 2;
    return CORE::index($_[0], $_[1], $_[2]);
}

# FIXME: this is not working 
#sub rindex  { CORE::rindex  $_[0], $_[1], (defined $_[2] ? $_[2] : ()) }
     
1;

__END__

=pod

=head1 NAME 

Moose::Autobox::String - the String role

=head1 SYNOPOSIS

  use Moose::Autobox;
  use autobox;
  
  "Hello World"->uc; # HELLO WORLD

=head1 DESCRIPTION

This is a role to describes a String value.

=head1 METHODS

=over 4

=item B<chomp>

=item B<chop>

=item B<index>

=item B<lc>

=item B<lcfirst>

=item B<length>

=item B<reverse>

=item B<uc>

=item B<ucfirst>

=back

=over 4

=item B<meta>

=back

=head1 BUGS

All complex software has bugs lurking in it, and this module is no 
exception. If you find a bug please either email me, or add the bug
to cpan-RT.

=head1 AUTHOR

Stevan Little E<lt>stevan@iinteractive.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2006 by Infinity Interactive, Inc.

L<http://www.iinteractive.com>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut