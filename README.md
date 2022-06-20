# Key Version Count for Key Protect

## Scope

The purpose of this repository is to provide customers a way to count the amount of key versions in their instance(s).

## Usage

This repository contains binaries for calculating key count to determine the cost of their instance(s).

* [README.md](README.md)
* [MAINTAINERS.md](MAINTAINERS.md)
* [/src](src)
* [/bin](bin)

<!-- A notes section is useful for anything that isn't covered in the Usage or Scope. Like what we have below. -->
## Notes

Key Versions: The total amount of key material generated for all keys in an instances. 5 Keys created, 3 keys rotated -> Total amount of keys remains 5, total amount of key versions = 8 (5 created + 3 rotated)
Add notes for how to use the keycount binaries, requirements (apikey, instance id etc). Will update final version when the script is functional per account or per region, currently only is scoped to counting key versions in one instance
