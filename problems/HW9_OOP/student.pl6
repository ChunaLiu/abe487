#!/usr/bin/env perl6

enum Gender <Male Female>;

class Person {
    has Str $.name is required;
    has Date $.birthday ;
    has Gender $.gender;
    has @!schools;

    method get_name(){
	return $.name;
        }
    method get_birthday() {
        return $.birthday;
       }
   method get_gender(){
       return $.gender;
     }
   method add_school($sc) {
         if $sc ne any(@!schools) {
            push @!schools, $sc;
        }
        else {
            warn "$sc is existed in the school list!";
        }
      method get_school {
	return @!schools;
	}

    }
}

my Person $CL .= new(name => 'ChunanLiu', birthday => Date.new(1990, 10, 1), gender => Female);
 
printf "get name function: %s\n", $CL.get_name;
printf "get birthday function: %s\n",$CL.get_birthday;
printf "get name function: %s\n", $CL.get_gender;
say "initial school list:",$CL.get_school;
$CL.add_school('NJIT');
say "add NJIT to school list:",$CL.get_school;
$CL.add_school('UA');
say "add UA to school list:", $CL.get_school;
$CL.add_school('NJIT');
say  "add NJIT to school list again:(warning) ",$CL.get_school;
