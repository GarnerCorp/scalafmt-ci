#!/usr/bin/env perl
my $source_file = $ENV{source};
my $errors_file = $ENV{errors};
my $new_source_file = "$source_file.new";
open my $source_in, "<", $source_file;
open my $source_out, ">", $new_source_file;
open my $errors, ">>", $errors_file;
my $found_error=0;
while (<$source_in>) {
  if ($found_error) {
    print $errors $_;
  } elsif (/^error:|^Segmentation fault/) {
    $found_error=1;
    print $errors $_;
  } else {
    print $source_out $_;
  }
}
close $source_in;
close $source_out;
close $errors;
rename $new_source_file, $source_file;
