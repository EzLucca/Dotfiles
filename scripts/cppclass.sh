#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage: $0 ClassName"
	exit 1
fi

CLASS_NAME=$1
INCLUDE_DIR="include"
SRC_DIR="src"

# Create folders if they don't exist
mkdir -p "$INCLUDE_DIR"
mkdir -p "$SRC_DIR"

HEADER_FILE="${INCLUDE_DIR}/${CLASS_NAME}.hpp"
SOURCE_FILE="${SRC_DIR}/${CLASS_NAME}.cpp"
INCLUDE_GUARD=$(echo "${CLASS_NAME}_HPP" | tr '[:lower:]' '[:upper:]')

# Create header file
cat <<EOF > $HEADER_FILE
#pragma once

class $CLASS_NAME {
	private:

	public:
		$CLASS_NAME(void);
		$CLASS_NAME(const $CLASS_NAME &other);
		$CLASS_NAME &operator=(const $CLASS_NAME &other);
		~$CLASS_NAME(void);
};
EOF

# Create source file
cat <<EOF > $SOURCE_FILE
#include "$HEADER_FILE"

/**
 * @brief Default constructor.
 *
 * Initializes the $CLASS_NAME with a default type.
 */
$CLASS_NAME::$CLASS_NAME(void) {}

/**
 * @brief Copy constructor.
 *
 * Creates a new $CLASS_NAME by copying another one.
 *
 * @param other The $CLASS_NAME object to copy from.
 */
$CLASS_NAME::$CLASS_NAME(const $CLASS_NAME &other) {}

/**
 * @brief Copy assignment operator.
 *
 * Assigns the values of another $CLASS_NAME to this instance.
 *
 * @param other The $CLASS_NAME object to assign from.
 * @return Reference to the assigned $CLASS_NAME.
 */
$CLASS_NAME &$CLASS_NAME::operator=(const $CLASS_NAME &other) {}

/**
 * @brief Destructor.
 *
 * Called when the $CLASS_NAME object is destroyed.
 */
$CLASS_NAME::~$CLASS_NAME(void) {}
EOF

echo "Created $HEADER_FILE and $SOURCE_FILE"
