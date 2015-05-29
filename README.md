# docker-centos-puppetdev
Docker images for puppet development 

## Summary
Messing with gems, bundler and various ruby installations can be a PITA when developing puppet module code. This docker image aims to remove that pain by putting everything you need for puppet module development inside a container. Best of all, everything is already cached and installed for you.

The idea here is that you can now use containers to perform development.

```shell
docker run –rm -v ${PWD}:/opt –workdir /opt –hostname=puppetdev -t logicminds/centos-puppetdev:latest3.8 rake spec
```

Overtime there will be many different tags for each puppet version so that we can easily test against different ruby/puppet combinations.

## Building
```shell
bash ./build.sh
```

