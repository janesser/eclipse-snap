# Eclipse on snap

Fork from <https://github.com/snapcrafters/eclipse>

Ships a few altered approaches

* flavored eclipse - any eclipse-package can be snapped, see <https://github.com/snapcrafters/eclipse/pull/10> for discussion related.
* goes along a latest snap confinement. Selected touchpoints with the home-directory remain.

Attempt to merge with snapcrafters here: <https://github.com/snapcrafters/eclipse/pull/56>.

## Wanna try?

1. `git clone https://github.com/janesser/eclipse-snap.git`
1. edit `eclipse-packages.yaml` according to your needs, and what is available at <www.eclipse.org/download> (see comment on query-params tweaking)
1. `ECLIPSE_PACKAGE=eclipse-pde ./try-build.sh # other packages declared will work`

### Troubleshoot

Eclipse may or may not (depending on its configuration) be prepared to run in such a limited setup.

    # when build timeouts
    sudo systemctl restart snap.lxd.daemon

## Disclaimer

This won't be published to snap repos, since ment to be used in local build mode only.

## Shout out

<https://github.com/lbovet/yglu>
