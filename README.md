# Key Version Count for Key Protect

## Scope

The purpose of this repository is to provide customers a way to count the amount of key versions in their instance(s).

## Usage

This repository contains binaries for calculating key count to determine the cost of their instance(s).

Instructions for counting key versions in your ibm cloud account (Unix env)
1. Set in your environment your IBMCLOUD_API_KEY for the account you wish to count key versions in
2. Run keycount.sh
    * The program will iterate through all your instances, counting the keyversions for each instance. At the end a total count for all key versions in all regions, in all instances for all keys in the account will be displayed.

* [README.md](README.md)
* [MAINTAINERS.md](MAINTAINERS.md)
* [/src](src)
* [/bin](bin)

<!-- A notes section is useful for anything that isn't covered in the Usage or Scope. Like what we have below. -->
## Notes

Key Versions: The total amount of key material generated for all keys in an instances. 5 Keys created, 3 keys rotated -> Total amount of keys remains 5, total amount of key versions = 8 (5 created + 3 rotated)

Two files: 
1. countperinstance.txt - keeps track of key versions per instance, useful for tracking which instances have a large amount of keys
2. instances.txt - keeps track of instances and their regions, used to call keyversions for each instance
