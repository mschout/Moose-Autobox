package Moose::Autobox::Array;
use Moose::Role 'with';
use autobox;

our $VERSION = '0.01';

with 'Moose::Autobox::Ref',
     'Moose::Autobox::List';

## List interface
 
sub length {
    my ($array) = @_;
    CORE::scalar @$array;
}

sub grep { 
    my ($array, $sub) = @_; 
    [ CORE::grep { $sub->($_) } @$array ]; 
}

sub map { 
    my ($array, $sub) = @_; 
    [ CORE::map { $sub->($_) } @$array ]; 
}

sub join { 
    my ($array, $sep) = @_;    
    $sep ||= ''; 
    CORE::join $sep, @$array; 
}

sub reverse { 
    my ($array) = @_;
    [ CORE::reverse @$array ];
}

sub sort { 
    my ($array, $sub) = @_;     
    $sub ||= sub { $a cmp $b }; 
    [ CORE::sort { $sub->($a, $b) } @$array ]; 
}    

# ...

sub reduce {
    my ($array, $func) = @_;
    my $a = $array->values;
    my $acc = $a->shift;
    $a->map(sub { $acc = $func->($acc, $_) });
    return $acc;
}

sub zip {
    my ($array, $other) = @_;
    ($array->length < $other->length 
        ? $other 
        : $array)
            ->keys
            ->map(sub {
                [ $array->[$_], $other->[$_] ]
            });
}

## 

sub keys { 
    my ($array) = @_;    
    [ 0 .. $#{$array} ];
}

sub values { 
    my ($array) = @_;    
    [ @$array ];
}

sub kv {
    my ($array) = @_;   
    $array->keys->map(sub { [ $_, $array->[$_] ] });
}

## Array Interface

sub pop { 
    my ($array) = @_;    
    CORE::pop @$array; 
}

sub push { 
    my ($array, @rest) = @_;
    CORE::push @$array, @rest;  
    $array; 
}

sub unshift { 
    my ($array, @rest) = @_;    
    CORE::unshift @$array, @rest; 
    $array; 
}
sub exists {
    my ($array, $index) = @_;    
    CORE::exists $array->[$index];    
}

sub delete { 
    my ($array, $index) = @_;    
    CORE::delete $array->[$index];
}

sub shift { 
    my ($array) = @_;    
    CORE::shift @$array; 
}

1;
