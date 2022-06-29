# Key Protect key version count

## Scope

The purpose of this repository is to provide IBM Key Protect customers a way to count all key versions of non deleted keys in all of their Key Protect instances.

What is a key version?
Every key has at least one version, additional versions are added each time a key is created. For example, on a new instance where 5 Keys were created and 3 keys rotated, total sum of key versions is 8 (5 created + 3 rotated).

## Usage

Instructions for counting key versions in your ibm cloud account.

1. Set the environment variable IBMCLOUD_API_KEY for the account you wish to count key versions in. See API Key documentation [here](https://cloud.ibm.com/docs/account?topic=account-userapikey&interface=ui).

2. Run keycount.sh
    * The program will iterate through all your instances, counting the keyversions for each instance. At the end a total count for all key versions in all regions, in all instances for all non deleted keys in the account will be displayed.

* [README.md](README.md)
* [MAINTAINERS.md](MAINTAINERS.md)
* [/src](src)
* [/bin](bin)

<!-- A notes section is useful for anything that isn't covered in the Usage or Scope. Like what we have below. -->
## Notes

Two files: 
1. countperinstance.txt - keeps track of key versions per instance, useful for tracking which instances have a large amount of keys
2. instances.txt - keeps track of instances and their regions, used to call keyversions for each instance
