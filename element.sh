#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t -c"
INPUT=$1

NUMBER_LOOKUP() {
  ATOMIC_NUMBER_LOOKUP=$($PSQL "select atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type from elements inner join properties using(atomic_number) inner join types using(type_id) where atomic_number = $INPUT")
  if [[ ! -z $ATOMIC_NUMBER_LOOKUP ]]
  then
    echo "$ATOMIC_NUMBER_LOOKUP" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELTING_POINT_CELSIUS BAR BOILING_POINT_CELSIUS BAR TYPE
      do echo -e "The element with atomic number $ATOMIC_NUMBER is $(echo $NAME | sed -r 's/^ *| *$//g')" \($(echo $SYMBOL | sed -r 's/^ *| *$//g')"). It's a $(echo $TYPE | sed -r 's/^ *| *$//g')", with a mass of $ATOMIC_MASS amu. $(echo $NAME | sed -r 's/^ *| *$//g')" has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    done
  else echo "I could not find that element in the database."
  fi
}

STRING_LOOKUP() {
  SYMBOL_LOOKUP=$($PSQL "select atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type from elements inner join properties using(atomic_number) inner join types using(type_id) where symbol = '$INPUT'")
  NAME_LOOKUP=$($PSQL "select atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type from elements inner join properties using(atomic_number) inner join types using(type_id) where name = '$INPUT'")
  if [[ ! -z $SYMBOL_LOOKUP ]]
  then
    echo "$SYMBOL_LOOKUP" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELTING_POINT_CELSIUS BAR BOILING_POINT_CELSIUS BAR TYPE
      do echo -e "The element with atomic number $ATOMIC_NUMBER is $(echo $NAME | sed -r 's/^ *| *$//g')" \($(echo $SYMBOL | sed -r 's/^ *| *$//g')"). It's a $(echo $TYPE | sed -r 's/^ *| *$//g')", with a mass of $ATOMIC_MASS amu. $(echo $NAME | sed -r 's/^ *| *$//g')" has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    done
  elif [[ ! -z $NAME_LOOKUP ]]
  then
    echo "$NAME_LOOKUP" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELTING_POINT_CELSIUS BAR BOILING_POINT_CELSIUS BAR TYPE
      do echo -e "The element with atomic number $ATOMIC_NUMBER is $(echo $NAME | sed -r 's/^ *| *$//g')" \($(echo $SYMBOL | sed -r 's/^ *| *$//g')"). It's a $(echo $TYPE | sed -r 's/^ *| *$//g')", with a mass of $ATOMIC_MASS amu. $(echo $NAME | sed -r 's/^ *| *$//g')" has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    done
  else echo "I could not find that element in the database."
  fi
}

if [[ -z $INPUT ]]
then echo "Please provide an element as an argument."
elif [[ $INPUT =~ ^[0-9]+$ ]]
then NUMBER_LOOKUP
else STRING_LOOKUP
fi