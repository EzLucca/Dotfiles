#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage: $0 ClassName"
	exit 1
fi

CLASS_NAME=$1
HEADER_FILE="${CLASS_NAME}.hpp"
SOURCE_FILE="${CLASS_NAME}.cpp"
INCLUDE_GUARD=$(echo "${CLASS_NAME}_HPP" | tr '[:lower:]' '[:upper:]')

# Create header file
cat <<EOF > $HEADER_FILE
#ifndef $INCLUDE_GUARD
#define $INCLUDE_GUARD

class $CLASS_NAME {
	private:

	public:
		$CLASS_NAME();
		~$CLASS_NAME();
};

#endif // $INCLUDE_GUARD
EOF

# Create source file
cat <<EOF > $SOURCE_FILE
#include "$HEADER_FILE"

$CLASS_NAME::$CLASS_NAME() {}

$CLASS_NAME::~$CLASS_NAME() {}
EOF

echo "Created $HEADER_FILE and $SOURCE_FILE"
