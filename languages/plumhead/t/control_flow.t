# $Id$

=head1 NAME

plumhead/t/control_flow.t - tests for Plumhead

=head1 DESCRIPTION

Test control flow.

=cut

# pragmata
use strict;
use warnings;
use 5.006_001;

use FindBin;
use lib "$FindBin::Bin/../lib", "$FindBin::Bin/../../../lib";

use Parrot::Config (); 
use Parrot::Test;
use Test::More     tests => 5;

language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED' . q{  }, 'positive int' );
<?php
if (1) {
  ?>
    <strong>Condition is true.</strong>
  <?php
}
?>
END_CODE
    <strong>Condition is true.</strong>
END_EXPECTED

language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED', 'zero' );
<?php
if (0) {
  ?>
    <strong>'Condition is true' does not apply.</strong>
  <?php
}
?>
Condition is false.
END_CODE
Condition is false.
END_EXPECTED

language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED', 'string' );
<?php
if ( 'false' ) {
?>
The string 'false' is true.
<?php
}
?>
END_CODE
The string 'false' is true.
END_EXPECTED

language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED', 'string' );
<?php
if ( 'vrai' ) {
?>
The string 'vrai' is true.
<?php
}
else
{
?>
The string 'vrai' is false.
<?php
}
?>
END_CODE
The string 'vrai' is true.
END_EXPECTED


language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED', 'string' );
<?php
if ( 0 ) {
?>
The integer 0 is true.
<?php
}
else
{
?>
The integer 0 is false.
<?php
}
?>
END_CODE
The integer 0 is false.
END_EXPECTED
