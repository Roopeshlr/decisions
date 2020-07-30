#!/bin/bash
start=$SECONDS
echo "Getting the packages, stay tuned..."
for d in */ ; do
    cd $d
    if [ -f pubspec.yaml ]; then
        echo Working in directory $d
        flutter pub get
    fi
    cd ..
done
echo Working in parent directory ${PWD##*/}
flutter pub get
end=$SECONDS
duration=$(( end - start ))
echo "\nYou can start working now, I have done it in $duration seconds."