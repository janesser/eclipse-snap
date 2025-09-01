kind: snap_image

config:
    directory: "/"
    metadata:
        name: eclipse
        version: EXPERIMENTAL
        type: app
        base: core24
        architecture:
            - amd64
        confinement: classic
        grade: devel
        apps:
            eclipse:
                command: firefox-wrapper
                plugs:
                - x11
                - opengl
                - wayland
                - desktop
        layout:
            /app:
                bind: $SNAP/app

