#!/bin/bash
start=$SECONDS
echo "Take some break till I complete your build..."
for d in */ ; do
    cd $d
    if [ -f pubspec.yaml ]; then
        echo Cleaning directory $d
        flutter clean
        flutter pub upgrade
    fi
    cd ..
done
echo Cleaning parent directory ${PWD##*/}
flutter pub upgrade
end=$SECONDS
duration=$(( end - start ))
echo "\nYou can start working now, I have done it in $duration seconds."