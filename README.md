# Eclipse (confined snap edition)

Fork from <https://github.com/snapcrafters/eclipse>

Ships a few altered approaches

* flavored eclipse - any eclipse-package can be snapped, see <https://github.com/snapcrafters/eclipse/pull/10> for discussion related.
* goes along a latest snap confinement. Selected touchpoints with the home-directory remain.

Attempt to merge with snapcrafters here: <https://github.com/snapcrafters/eclipse/pull/56>.

## Wanna try?

1. `git clone https://github.com/janesser/eclipse-snap.git`
1. edit `eclipse-packages.yaml` according to your needs, and what is available at <www.eclipse.org/download> (see comment on query-params tweaking)
1. `./try-build.sh eclipse-pde` other packages declared will work

### Known issues

* something is broken with certain GPU setups <https://github.com/canonical/gpu-snap/issues/27>
* certain file priviledges required by eclipse are too restricted
  * can't run PDE tests / junit tests in normal java projects work though

    ```text
    [0.021s][info][exceptions] Exception <a 'java/lang/Error'{0x000000071e402720}: Properties init: Could not determine current working directory.> (0x000000071e402720) 
        thrown [src/hotspot/share/prims/jni.cpp, line 539]
        for thread 0x00007c1a7402dc50
        [0.021s][info][exceptions] Exception <a 'java/lang/InternalError'{0x000000071e402e60}: platform encoding not initialized> (0x000000071e402e60) 
        thrown [src/hotspot/share/prims/jni.cpp, line 539]
        for thread 0x00007c1a7402dc50
        [0.021s][info][exceptions] Exception <a 'java/lang/InternalError'{0x000000071e402e60}: platform encoding not initialized>
        thrown in interpreter method <{method} {0x00007c19ff19f638} 'platformProperties' '()[Ljava/lang/String;' in 'jdk/internal/util/SystemProps$Raw'>
        at bci 0 for thread 0x00007c1a7402dc50 (main)
        [0.021s][info][exceptions] Exception <a 'java/lang/InternalError'{0x000000071e402e60}: platform encoding not initialized>
        thrown in interpreter method <{method} {0x00007c19ff19f588} '<init>' '()V' in 'jdk/internal/util/SystemProps$Raw'>
        at bci 5 for thread 0x00007c1a7402dc50 (main)
        [0.021s][info][exceptions] Exception <a 'java/lang/InternalError'{0x000000071e402e60}: platform encoding not initialized>
        thrown in interpreter method <{method} {0x00007c19ff4594e0} 'initProperties' '()Ljava/util/Map;' in 'jdk/internal/util/SystemProps'>
        at bci 4 for thread 0x00007c1a7402dc50 (main)
        [0.021s][info][exceptions] Exception <a 'java/lang/InternalError'{0x000000071e402e60}: platform encoding not initialized>
        thrown in interpreter method <{method} {0x00007c19ff01a898} 'initPhase1' '()V' in 'java/lang/System'>
        at bci 3 for thread 0x00007c1a7402dc50 (main)
        Error occurred during initialization of VM
        java.lang.InternalError: platform encoding not initialized
            at jdk.internal.util.SystemProps$Raw.platformProperties(java.base@21.0.5/Native Method)
            at jdk.internal.util.SystemProps$Raw.<init>(java.base@21.0.5/SystemProps.java:263)
            at jdk.internal.util.SystemProps.initProperties(java.base@21.0.5/SystemProps.java:67)
            at java.lang.System.initPhase1(java.base@21.0.5/System.java:2162)
    ```

### Troubleshoot

Eclipse may or may not (depending on its configuration) be prepared to run in such a limited setup.

```bash
# when build timeouts
sudo systemctl restart snap.lxd.daemon
```

## Disclaimer

This won't be published to snap repos, since ment to be used in local build mode only.

## Shout out

<https://github.com/lbovet/yglu>
