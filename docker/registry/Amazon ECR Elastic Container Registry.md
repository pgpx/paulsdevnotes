# Amazon ECR - Elastic Container Registry

## Limitations

* Does support caching another registry ([issue](https://github.com/aws/containers-roadmap/issues/939), [related blog](https://aws.amazon.com/blogs/containers/advice-for-customers-dealing-with-docker-hub-rate-limits-and-a-coming-soon-announcement/))
* [Issue tracking custom domains for ECR](https://github.com/aws/containers-roadmap/issues/299) - looks like it isn't easily supported right now (other than with non-trivial workarounds). 

## Mutability

Can mark repositories as immutable so tags cannot be re-pushed.  Would need to put SNAPSHOTs elsewhere though (and wouldn't support rebuilds). [ref](https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-tag-mutability.html)

## Lifecycle policies

[ref](https://docs.aws.amazon.com/AmazonECR/latest/userguide/LifecyclePolicies.html) - provides a way to automate the cleaning up of unused images, for example expiring images based on age or count.

Can define rules using:

* `tagPrefixList` - a list of tag _prefix_ strings (that must match exactly - not a regex)
    > an image is successfully matched if all of the tags in the tagPrefixList value are matched against any of the image's tags.

> With `countType = imageCountMoreThan`, images are sorted from youngest to oldest based on `pushed_at_time` and then all images greater than the specified count are expired.

> With `countType = sinceImagePushed`, all images whose `pushed_at_time` is older than the specified number of days based on countNumber are expired.

## Configuration

* <https://docs.aws.amazon.com/AmazonECR/latest/userguide/registry_auth.html>